-- GMCommander: A GM Command Interface for Legion 7.3.5
-- Main addon file - Version 1.1 with Search & Categories

local addonName, addon = ...

-- Saved variables
GMCommanderDB = GMCommanderDB or {}
GMCommanderDB.favorites = GMCommanderDB.favorites or {}

-- Main frame reference
local GMCFrame
local tabContents = {}
local tabButtons = {}

-- Current state
local currentCategory = nil
local currentSubcategory = nil
local searchResults = {}

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function SendGMCommand(command)
    SendChatMessage(command, "SAY")
    print("|cff00ff00[GM Commander]|r Command sent: " .. command)
end

local function SetBackdrop(frame, bgColor, borderColor)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    if bgColor then
        frame:SetBackdropColor(unpack(bgColor))
    end
    if borderColor then
        frame:SetBackdropBorderColor(unpack(borderColor))
    end
end

local function SetSimpleBackdrop(frame, bgColor, borderColor)
    frame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    if bgColor then
        frame:SetBackdropColor(unpack(bgColor))
    end
    if borderColor then
        frame:SetBackdropBorderColor(unpack(borderColor))
    end
end

local function CreateEditBox(parent, width, height, placeholder)
    local container = CreateFrame("Frame", nil, parent)
    container:SetSize(width, height)
    SetSimpleBackdrop(container, {0, 0, 0, 0.5}, {0.4, 0.4, 0.4, 1})
    
    local editBox = CreateFrame("EditBox", nil, container)
    editBox:SetPoint("TOPLEFT", 8, -2)
    editBox:SetPoint("BOTTOMRIGHT", -8, 2)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(ChatFontNormal)
    editBox:SetTextInsets(2, 2, 0, 0)
    
    editBox.placeholder = editBox:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
    editBox.placeholder:SetPoint("LEFT", 2, 0)
    editBox.placeholder:SetText(placeholder or "")
    editBox.placeholder:SetTextColor(0.5, 0.5, 0.5)
    
    editBox:SetScript("OnTextChanged", function(self)
        if self:GetText() == "" then
            self.placeholder:Show()
        else
            self.placeholder:Hide()
        end
    end)
    
    editBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    
    editBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    
    editBox:EnableMouse(true)
    container.editBox = editBox
    
    return container
end

local function CreateButton(parent, width, height, text)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(width, height)
    
    SetSimpleBackdrop(button, {0.1, 0.1, 0.1, 1}, {0.6, 0.6, 0.6, 1})
    
    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("CENTER")
    button.text:SetText(text)
    
    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.2, 0.3, 1)
        self:SetBackdropBorderColor(0.8, 0.8, 0.2, 1)
    end)
    
    button:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.1, 0.1, 0.1, 1)
        self:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
    end)
    
    button:SetScript("OnMouseDown", function(self)
        self:SetBackdropColor(0.05, 0.05, 0.05, 1)
    end)
    
    button:SetScript("OnMouseUp", function(self)
        self:SetBackdropColor(0.2, 0.2, 0.3, 1)
    end)
    
    return button
end

-- ============================================================================
-- SCROLL LIST COMPONENT
-- ============================================================================

local function CreateScrollList(parent, width, height)
    local container = CreateFrame("Frame", nil, parent)
    container:SetSize(width, height)
    SetSimpleBackdrop(container, {0.05, 0.05, 0.05, 0.8}, {0.3, 0.3, 0.3, 1})
    
    -- Scroll frame
    local scrollFrame = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 5, -5)
    scrollFrame:SetPoint("BOTTOMRIGHT", -26, 5)
    
    -- Content frame
    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(width - 35, 1) -- Height will be set dynamically
    scrollFrame:SetScrollChild(content)
    
    container.scrollFrame = scrollFrame
    container.content = content
    container.buttons = {}
    
    return container
end

local function CreateItemButton(parent, width, item, quantityBox)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width, 24)
    SetSimpleBackdrop(btn, {0.1, 0.1, 0.1, 0.8}, {0.3, 0.3, 0.3, 1})
    
    -- Item icon (using GetItemIcon if available)
    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", 2, 0)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    
    -- Try to get the actual item icon
    local itemIcon = GetItemIcon(item.id)
    if itemIcon then
        icon:SetTexture(itemIcon)
    end
    
    -- Item name
    local nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("LEFT", icon, "RIGHT", 4, 0)
    nameText:SetPoint("RIGHT", -50, 0)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(item.name)
    nameText:SetTextColor(1, 1, 1)
    
    -- Item ID
    local idText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    idText:SetPoint("RIGHT", -4, 0)
    idText:SetText("|cff888888" .. item.id .. "|r")
    
    -- Hover effects
    btn:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.3, 0.2, 1)
        self:SetBackdropBorderColor(0.5, 0.8, 0.5, 1)
        nameText:SetTextColor(0.5, 1, 0.5)
        
        -- Show item tooltip
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink("item:" .. item.id)
        GameTooltip:Show()
    end)
    
    btn:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
        self:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
        nameText:SetTextColor(1, 1, 1)
        GameTooltip:Hide()
    end)
    
    -- Click to add item
    btn:SetScript("OnClick", function(self)
        local quantity = 1
        if quantityBox then
            quantity = tonumber(quantityBox:GetText()) or 1
        end
        SendGMCommand(".additem " .. item.id .. " " .. quantity)
    end)
    
    btn.item = item
    return btn
end

-- ============================================================================
-- SEARCH FUNCTIONALITY
-- ============================================================================

local function SearchItems(query)
    local results = {}
    query = string.lower(query)
    
    -- Check if it's a numeric ID search
    local numericQuery = tonumber(query)
    
    for _, item in ipairs(GMC_SearchIndex) do
        local match = false
        
        if numericQuery then
            -- Search by ID
            if item.id == numericQuery or string.find(tostring(item.id), query) then
                match = true
            end
        else
            -- Search by name
            if string.find(item.searchName, query) then
                match = true
            end
        end
        
        if match then
            table.insert(results, item)
            if #results >= 50 then break end -- Limit results
        end
    end
    
    return results
end

-- ============================================================================
-- TAB SYSTEM
-- ============================================================================

local function SelectTab(id)
    for i, content in pairs(tabContents) do
        if i == id then
            content:Show()
        else
            content:Hide()
        end
    end
    
    for i, btn in pairs(tabButtons) do
        if i == id then
            btn:SetBackdropColor(0.2, 0.2, 0.3, 1)
            btn:SetBackdropBorderColor(1, 0.8, 0, 1)
            btn.text:SetTextColor(1, 1, 1)
        else
            btn:SetBackdropColor(0.1, 0.1, 0.1, 1)
            btn:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
            btn.text:SetTextColor(0.7, 0.7, 0.7)
        end
    end
end

local function CreateTab(parent, id, text, xOffset)
    local tab = CreateFrame("Button", nil, parent)
    tab:SetSize(80, 28)
    tab:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, -30)
    
    SetSimpleBackdrop(tab, {0.1, 0.1, 0.1, 1}, {0.4, 0.4, 0.4, 1})
    
    tab.text = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tab.text:SetPoint("CENTER")
    tab.text:SetText(text)
    tab.text:SetTextColor(0.7, 0.7, 0.7)
    
    tab:SetScript("OnClick", function()
        SelectTab(id)
    end)
    
    tabButtons[id] = tab
    return tab
end

local function CreateTabContent(parent, id)
    local content = CreateFrame("Frame", nil, parent)
    content:SetPoint("TOPLEFT", 15, -65)
    content:SetPoint("BOTTOMRIGHT", -15, 15)
    content:Hide()
    
    tabContents[id] = content
    return content
end

-- ============================================================================
-- ITEMS TAB (NEW VERSION WITH SEARCH & CATEGORIES)
-- ============================================================================

local itemsScrollList
local categoryButtons = {}
local subcategoryButtons = {}

local function UpdateItemsList(items, quantityBox)
    if not itemsScrollList then return end
    
    local content = itemsScrollList.content
    
    -- Clear existing buttons
    for _, btn in ipairs(itemsScrollList.buttons) do
        btn:Hide()
        btn:SetParent(nil)
    end
    wipe(itemsScrollList.buttons)
    
    -- Create new buttons
    local yOffset = 0
    for i, item in ipairs(items) do
        local btn = CreateItemButton(content, content:GetWidth(), item, quantityBox)
        btn:SetPoint("TOPLEFT", 0, -yOffset)
        table.insert(itemsScrollList.buttons, btn)
        yOffset = yOffset + 26
    end
    
    -- Update content height
    content:SetHeight(math.max(yOffset, 1))
end

local function ShowSubcategories(catKey, content, quantityBox)
    -- Clear existing subcategory buttons
    for _, btn in ipairs(subcategoryButtons) do
        btn:Hide()
    end
    wipe(subcategoryButtons)
    
    local catData = GMC_ItemDB[catKey]
    if not catData or not catData.subcategories then return end
    
    currentCategory = catKey
    
    local xOffset = 0
    local yOffset = 0
    local btnWidth = 140
    local btnHeight = 24
    local maxWidth = 450
    
    for subCatName, items in pairs(catData.subcategories) do
        local btn = CreateButton(content.subcatContainer, btnWidth, btnHeight, subCatName)
        btn:SetPoint("TOPLEFT", xOffset, -yOffset)
        btn.text:SetFontObject(GameFontNormalSmall)
        
        btn:SetScript("OnClick", function()
            currentSubcategory = subCatName
            UpdateItemsList(items, content.quantityBox)
            
            -- Highlight selected
            for _, b in ipairs(subcategoryButtons) do
                b:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
            end
            btn:SetBackdropBorderColor(0, 0.8, 0, 1)
        end)
        
        table.insert(subcategoryButtons, btn)
        
        xOffset = xOffset + btnWidth + 5
        if xOffset + btnWidth > maxWidth then
            xOffset = 0
            yOffset = yOffset + btnHeight + 3
        end
    end
end

local function CreateItemsTab(parent)
    local content = CreateTabContent(parent, 1)
    
    -- Title
    local title = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText("|cff00ff00Item Database|r")
    
    -- Search box
    local searchContainer = CreateEditBox(content, 200, 26, "Search by name or ID...")
    searchContainer:SetPoint("TOPLEFT", 0, -25)
    local searchBox = searchContainer.editBox
    content.searchBox = searchBox
    
    -- Quantity input (small, next to search)
    local qtyLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    qtyLabel:SetPoint("LEFT", searchContainer, "RIGHT", 10, 0)
    qtyLabel:SetText("Qty:")
    
    local qtyContainer = CreateEditBox(content, 50, 26, "1")
    qtyContainer:SetPoint("LEFT", qtyLabel, "RIGHT", 5, 0)
    local quantityBox = qtyContainer.editBox
    quantityBox:SetNumeric(true)
    quantityBox:SetText("1")
    content.quantityBox = quantityBox
    
    -- Manual ID entry button
    local manualBtn = CreateButton(content, 80, 26, "Add ID")
    manualBtn:SetPoint("LEFT", qtyContainer, "RIGHT", 10, 0)
    manualBtn:SetScript("OnClick", function()
        local searchText = searchBox:GetText()
        local itemId = tonumber(searchText)
        if itemId then
            local qty = tonumber(quantityBox:GetText()) or 1
            SendGMCommand(".additem " .. itemId .. " " .. qty)
        else
            print("|cffff0000[GM Commander]|r Enter a numeric Item ID in the search box")
        end
    end)
    
    -- Category buttons
    local catLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    catLabel:SetPoint("TOPLEFT", 0, -58)
    catLabel:SetText("|cffffffccCategories:|r")
    
    local categories = {
        {key = "MountsHorses", name = "Horses", color = {0.6, 0.4, 0.2}},
        {key = "MountsWolves", name = "Wolves", color = {0.5, 0.5, 0.5}},
        {key = "MountsCats", name = "Cats", color = {0.7, 0.5, 0.3}},
        {key = "MountsRams", name = "Rams", color = {0.4, 0.4, 0.6}},
        {key = "MountsRaptors", name = "Raptors", color = {0.3, 0.6, 0.3}},
        {key = "MountsKodos", name = "Kodos", color = {0.5, 0.4, 0.3}},
        {key = "MountsSkeletal", name = "Skeletal", color = {0.4, 0.4, 0.4}},
        {key = "MountsMechs", name = "Mechs", color = {0.3, 0.5, 0.7}},
        {key = "MountsHawkstriders", name = "Hawks", color = {0.7, 0.3, 0.3}},
        {key = "MountsElekks", name = "Elekks", color = {0.5, 0.5, 0.7}},
        {key = "MountsTalbuks", name = "Talbuks", color = {0.6, 0.6, 0.5}},
        {key = "MountsGryphons", name = "Gryphons", color = {0.8, 0.7, 0.3}},
        {key = "MountsDrakes", name = "Drakes", color = {0.3, 0.5, 0.8}},
        {key = "MountsCloudSerpents", name = "Serpents", color = {0.2, 0.7, 0.7}},
        {key = "MountsPhoenix", name = "Phoenix", color = {1, 0.5, 0}},
        {key = "MountsRaidDrops", name = "Raid", color = {0.8, 0.3, 0.8}},
        {key = "MountsLegion", name = "Legion", color = {0.1, 0.8, 0.1}},
        {key = "MountsStore", name = "Store", color = {0.2, 0.6, 0.9}},
        {key = "MountsMammoths", name = "Mammoths", color = {0.7, 0.7, 0.7}},
        {key = "MountsMisc", name = "Misc", color = {0.6, 0.5, 0.4}},
        {key = "LegionLegendaries", name = "Legends", color = {1, 0.5, 0}},
        {key = "Weapons", name = "Weapons", color = {0.6, 0.2, 0.2}},
        {key = "Consumables", name = "Consume", color = {0.2, 0.6, 0.2}},
    }
    
    local catXOffset = 0
    local catYOffset = 0
    local catBtnWidth = 58
    local catMaxWidth = 460
    
    for i, cat in ipairs(categories) do
        local btn = CreateButton(content, catBtnWidth, 20, cat.name)
        btn:SetPoint("TOPLEFT", catXOffset, -75 - catYOffset)
        btn.text:SetFontObject(GameFontNormalSmall)
        
        btn:SetScript("OnClick", function()
            ShowSubcategories(cat.key, content, quantityBox)
            
            for _, b in ipairs(categoryButtons) do
                b:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
            end
            btn:SetBackdropBorderColor(cat.color[1], cat.color[2], cat.color[3], 1)
        end)
        
        table.insert(categoryButtons, btn)
        catXOffset = catXOffset + catBtnWidth + 2
        
        if catXOffset + catBtnWidth > catMaxWidth then
            catXOffset = 0
            catYOffset = catYOffset + 22
        end
    end
    
    -- Subcategory container
    local subcatContainer = CreateFrame("Frame", nil, content)
    subcatContainer:SetPoint("TOPLEFT", 0, -125)
    subcatContainer:SetSize(460, 60)
    content.subcatContainer = subcatContainer
    
    -- Scroll list for items
    itemsScrollList = CreateScrollList(content, 440, 250)
    itemsScrollList:SetPoint("TOPLEFT", 0, -190)
    
    -- Search functionality
    searchBox:SetScript("OnTextChanged", function(self)
        local text = self:GetText()
        if self.placeholder then
            if text == "" then
                self.placeholder:Show()
            else
                self.placeholder:Hide()
            end
        end
        
        -- Perform search if 2+ characters
        if string.len(text) >= 2 then
            local results = SearchItems(text)
            UpdateItemsList(results, quantityBox)
        elseif text == "" and currentSubcategory and currentCategory then
            -- Show current subcategory items
            local catData = GMC_ItemDB[currentCategory]
            if catData and catData.subcategories and catData.subcategories[currentSubcategory] then
                UpdateItemsList(catData.subcategories[currentSubcategory], quantityBox)
            end
        end
    end)
    
    return content
end

-- ============================================================================
-- GOLD TAB
-- ============================================================================

local function CreateGoldTab(parent)
    local content = CreateTabContent(parent, 2)
    
    -- Title
    local title = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText("|cffffff00Gold Management|r")
    
    -- Gold amount input
    local goldLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    goldLabel:SetPoint("TOPLEFT", 0, -30)
    goldLabel:SetText("Amount (gold):")
    
    local goldContainer = CreateEditBox(content, 130, 28, "Enter amount")
    goldContainer:SetPoint("LEFT", goldLabel, "RIGHT", 10, 0)
    local goldBox = goldContainer.editBox
    goldBox:SetNumeric(true)
    
    -- Add Gold button
    local addGoldBtn = CreateButton(content, 120, 30, "Add Gold")
    addGoldBtn:SetPoint("TOPLEFT", 0, -70)
    addGoldBtn:SetScript("OnClick", function()
        local amount = goldBox:GetText()
        
        if amount == "" then
            print("|cffff0000[GM Commander]|r Please enter an amount")
            return
        end
        
        local copper = tonumber(amount) * 10000
        SendGMCommand(".modify money " .. copper)
    end)
    
    -- Add Gold to Target
    local addGoldTargetBtn = CreateButton(content, 130, 30, "Add to Target")
    addGoldTargetBtn:SetPoint("LEFT", addGoldBtn, "RIGHT", 10, 0)
    addGoldTargetBtn:SetScript("OnClick", function()
        local amount = goldBox:GetText()
        
        if amount == "" then
            print("|cffff0000[GM Commander]|r Please enter an amount")
            return
        end
        
        if not UnitExists("target") then
            print("|cffff0000[GM Commander]|r No target selected")
            return
        end
        
        local copper = tonumber(amount) * 10000
        local targetName = UnitName("target")
        SendGMCommand(".send money " .. targetName .. " \"GM\" \"Gold\" " .. copper)
    end)
    
    -- Separator
    local sep1 = content:CreateTexture(nil, "ARTWORK")
    sep1:SetColorTexture(0.5, 0.5, 0.5, 0.8)
    sep1:SetSize(460, 2)
    sep1:SetPoint("TOPLEFT", 0, -115)
    
    -- Quick gold buttons
    local quickLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    quickLabel:SetPoint("TOPLEFT", 0, -130)
    quickLabel:SetText("|cffffffccQuick Gold:|r")
    
    local quickAmounts = {
        {amount = 100, text = "100g"},
        {amount = 1000, text = "1,000g"},
        {amount = 10000, text = "10,000g"},
        {amount = 100000, text = "100,000g"},
    }
    
    for i, data in ipairs(quickAmounts) do
        local btn = CreateButton(content, 90, 26, data.text)
        btn:SetPoint("TOPLEFT", (i - 1) * 95, -150)
        btn:SetScript("OnClick", function()
            local copper = data.amount * 10000
            SendGMCommand(".modify money " .. copper)
        end)
    end
    
    -- Gold cap button
    local goldCapBtn = CreateButton(content, 150, 30, "Set Gold Cap (9.9M)")
    goldCapBtn:SetPoint("TOPLEFT", 0, -190)
    goldCapBtn:SetScript("OnClick", function()
        SendGMCommand(".modify money 99999990000")
    end)
    
    return content
end

-- ============================================================================
-- MAIN FRAME CREATION
-- ============================================================================

local function CreateMainFrame()
    GMCFrame = CreateFrame("Frame", "GMCommanderFrame", UIParent)
    GMCFrame:SetSize(500, 550)
    GMCFrame:SetPoint("CENTER")
    GMCFrame:SetFrameStrata("HIGH")
    
    SetBackdrop(GMCFrame, {0.1, 0.1, 0.1, 0.95}, {0.6, 0.6, 0.6, 1})
    
    GMCFrame:SetMovable(true)
    GMCFrame:EnableMouse(true)
    GMCFrame:RegisterForDrag("LeftButton")
    GMCFrame:SetScript("OnDragStart", GMCFrame.StartMoving)
    GMCFrame:SetScript("OnDragStop", GMCFrame.StopMovingOrSizing)
    GMCFrame:SetClampedToScreen(true)
    GMCFrame:Hide()
    
    -- Title bar
    local titleBar = CreateFrame("Frame", nil, GMCFrame)
    titleBar:SetPoint("TOPLEFT", 8, -8)
    titleBar:SetPoint("TOPRIGHT", -8, -8)
    titleBar:SetHeight(24)
    SetSimpleBackdrop(titleBar, {0.15, 0.15, 0.2, 1}, {0.5, 0.5, 0.5, 1})
    
    -- Title text
    local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("CENTER")
    titleText:SetText("|cff00ccffGM Commander|r |cff888888v1.1|r")
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, GMCFrame)
    closeBtn:SetSize(24, 24)
    closeBtn:SetPoint("TOPRIGHT", -10, -9)
    closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeBtn:SetScript("OnClick", function()
        GMCFrame:Hide()
    end)
    
    -- Make it closeable with Escape
    tinsert(UISpecialFrames, "GMCommanderFrame")
    
    -- Create tabs
    CreateTab(GMCFrame, 1, "Items", 15)
    CreateTab(GMCFrame, 2, "Gold", 100)
    
    -- Create tab contents
    CreateItemsTab(GMCFrame)
    CreateGoldTab(GMCFrame)
    
    -- Show first tab by default
    SelectTab(1)
    
    return GMCFrame
end

-- ============================================================================
-- MINIMAP BUTTON
-- ============================================================================

local function CreateMinimapButton()
    local button = CreateFrame("Button", "GMCommanderMinimapButton", Minimap)
    button:SetSize(33, 33)
    button:SetFrameStrata("MEDIUM")
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    
    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(21, 21)
    icon:SetPoint("CENTER", 0, 0)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_11")
    
    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetSize(54, 54)
    border:SetPoint("CENTER")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    
    local angle = 45
    local radius = 80
    button:SetPoint("CENTER", Minimap, "CENTER", 
        radius * cos(angle), 
        radius * sin(angle))
    
    local isDragging = false
    button:RegisterForDrag("RightButton")
    button:RegisterForClicks("LeftButtonUp")
    
    button:SetScript("OnDragStart", function(self)
        isDragging = true
    end)
    
    button:SetScript("OnDragStop", function(self)
        isDragging = false
    end)
    
    button:SetScript("OnUpdate", function(self)
        if isDragging then
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            px, py = px / scale, py / scale
            
            local newAngle = math.deg(math.atan2(py - my, px - mx))
            local radius = 80
            
            self:ClearAllPoints()
            self:SetPoint("CENTER", Minimap, "CENTER", 
                radius * cos(newAngle), 
                radius * sin(newAngle))
        end
    end)
    
    button:SetScript("OnClick", function(self, btn)
        if GMCFrame:IsShown() then
            GMCFrame:Hide()
        else
            GMCFrame:Show()
        end
    end)
    
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("|cff00ccffGM Commander|r")
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cffffffffLeft-click|r to toggle", 0.8, 0.8, 0.8)
        GameTooltip:AddLine("|cffffffffRight-drag|r to move", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    return button
end

-- ============================================================================
-- SLASH COMMANDS
-- ============================================================================

SLASH_GMCOMMANDER1 = "/gmc"
SLASH_GMCOMMANDER2 = "/gmcommander"

SlashCmdList["GMCOMMANDER"] = function(msg)
    if GMCFrame:IsShown() then
        GMCFrame:Hide()
    else
        GMCFrame:Show()
    end
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        CreateMainFrame()
        CreateMinimapButton()
        print("|cff00ccff[GM Commander]|r v1.1 Loaded! Type |cffffffff/gmc|r to open.")
    end
end)
