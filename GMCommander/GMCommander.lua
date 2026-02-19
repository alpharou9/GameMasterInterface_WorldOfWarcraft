-- GMCommander: A GM Command Interface for Legion 7.3.5
-- Version 2.0 - Redesigned UI

local addonName, addon = ...

GMCommanderDB = GMCommanderDB or {}
GMCommanderDB.favorites = GMCommanderDB.favorites or {}

local GMCFrame
local tabContents = {}
local tabButtons = {}

-- Layout constants
local FRAME_W     = 720
local FRAME_H     = 660
local SIDEBAR_W   = 155
local SUBCAT_H    = 95
local TITLEBAR_H  = 34
local TAB_H       = 32
local PAD         = 15

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function SendGMCommand(command)
    SendChatMessage(command, "SAY")
    print("|cff00ff00[GM Commander]|r Command sent: " .. command)
end

local function SetBackdrop(frame, bgColor, borderColor)
    frame:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    if bgColor    then frame:SetBackdropColor(unpack(bgColor))       end
    if borderColor then frame:SetBackdropBorderColor(unpack(borderColor)) end
end

local function SetSimpleBackdrop(frame, bgColor, borderColor)
    frame:SetBackdrop({
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    if bgColor    then frame:SetBackdropColor(unpack(bgColor))       end
    if borderColor then frame:SetBackdropBorderColor(unpack(borderColor)) end
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
        self.placeholder:SetShown(self:GetText() == "")
    end)
    editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    editBox:SetScript("OnEnterPressed",  function(self) self:ClearFocus() end)
    editBox:EnableMouse(true)

    container.editBox = editBox
    return container
end

local function CreateButton(parent, width, height, text)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(width, height)
    SetSimpleBackdrop(button, {0.1, 0.1, 0.1, 1}, {0.55, 0.55, 0.55, 1})

    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("CENTER")
    button.text:SetText(text)

    button:SetScript("OnEnter",    function(self) self:SetBackdropColor(0.2, 0.2, 0.3, 1); self:SetBackdropBorderColor(0.8, 0.8, 0.2, 1) end)
    button:SetScript("OnLeave",    function(self) self:SetBackdropColor(0.1, 0.1, 0.1, 1); self:SetBackdropBorderColor(0.55, 0.55, 0.55, 1) end)
    button:SetScript("OnMouseDown",function(self) self:SetBackdropColor(0.05, 0.05, 0.05, 1) end)
    button:SetScript("OnMouseUp",  function(self) self:SetBackdropColor(0.2, 0.2, 0.3, 1) end)

    return button
end

-- ============================================================================
-- SCROLL LIST COMPONENT
-- ============================================================================

local function CreateScrollList(parent, width, height)
    local container = CreateFrame("Frame", nil, parent)
    container:SetSize(width, height)
    SetSimpleBackdrop(container, {0.05, 0.05, 0.05, 0.8}, {0.3, 0.3, 0.3, 1})

    local scrollFrame = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 5, -5)
    scrollFrame:SetPoint("BOTTOMRIGHT", -26, 5)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(width - 35, 1)
    scrollFrame:SetScrollChild(content)

    container.scrollFrame = scrollFrame
    container.content     = content
    container.buttons     = {}
    return container
end

local function CreateItemButton(parent, width, item, quantityBox)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width, 24)
    SetSimpleBackdrop(btn, {0.1, 0.1, 0.1, 0.8}, {0.3, 0.3, 0.3, 1})

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", 2, 0)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    local itemIcon = GetItemIcon(item.id)
    if itemIcon then icon:SetTexture(itemIcon) end

    local nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("LEFT", icon, "RIGHT", 4, 0)
    nameText:SetPoint("RIGHT", -55, 0)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(item.name)
    nameText:SetTextColor(1, 1, 1)

    local idText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    idText:SetPoint("RIGHT", -4, 0)
    idText:SetText("|cff888888" .. item.id .. "|r")

    btn:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.3, 0.2, 1)
        self:SetBackdropBorderColor(0.4, 0.8, 0.4, 1)
        nameText:SetTextColor(0.5, 1, 0.5)
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
    btn:SetScript("OnClick", function()
        local qty = tonumber(quantityBox:GetText()) or 1
        SendGMCommand(".additem " .. item.id .. " " .. qty)
    end)

    btn.item = item
    return btn
end

-- ============================================================================
-- TAB SYSTEM
-- ============================================================================

local function SelectTab(id)
    for i, content in pairs(tabContents) do
        content:SetShown(i == id)
    end
    for i, btn in pairs(tabButtons) do
        if i == id then
            btn:SetBackdropColor(0.15, 0.15, 0.25, 1)
            btn:SetBackdropBorderColor(1, 0.8, 0, 1)
            btn.text:SetTextColor(1, 1, 1)
        else
            btn:SetBackdropColor(0.1, 0.1, 0.1, 1)
            btn:SetBackdropBorderColor(0.35, 0.35, 0.35, 1)
            btn.text:SetTextColor(0.65, 0.65, 0.65)
        end
    end
end

local function CreateTab(parent, id, text, xOffset, width)
    local tab = CreateFrame("Button", nil, parent)
    tab:SetSize(width, TAB_H)
    tab:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, -(TITLEBAR_H + 4))
    SetSimpleBackdrop(tab, {0.1, 0.1, 0.1, 1}, {0.35, 0.35, 0.35, 1})

    tab.text = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tab.text:SetPoint("CENTER")
    tab.text:SetText(text)
    tab.text:SetTextColor(0.65, 0.65, 0.65)

    tab:SetScript("OnClick", function() SelectTab(id) end)
    tabButtons[id] = tab
    return tab
end

local function CreateTabContent(parent, id)
    local CONTENT_TOP_Y = -(TITLEBAR_H + TAB_H + 8)
    local content = CreateFrame("Frame", nil, parent)
    content:SetPoint("TOPLEFT",     PAD, CONTENT_TOP_Y)
    content:SetPoint("BOTTOMRIGHT", -PAD, PAD)
    content:Hide()
    tabContents[id] = content
    return content
end

-- ============================================================================
-- ITEM BROWSER TAB  (shared layout for Mounts / Items / Legion / Transmog)
--
-- Layout (within the content frame):
--   LEFT  sidebar (SIDEBAR_W px)  : scrollable category list
--   RIGHT panel   (remaining px)  :
--     [0]       Search box + Qty + Add ID    (28px)
--     [-32]     Subcategory area - FIXED HEIGHT, scrollable inside  (SUBCAT_H px)
--     [-32-SUBCAT_H-4]  Items scroll list   (fills rest)
--
-- Nothing overlaps because every section has a fixed Y anchor.
-- ============================================================================

local function CreateItemBrowserTab(parent, tabId, title, titleColor, categories)
    local content = CreateTabContent(parent, tabId)

    -- Computed dimensions
    local CONTENT_W   = FRAME_W - 2 * PAD                              -- 690
    local CONTENT_H   = FRAME_H - TITLEBAR_H - TAB_H - 8 - PAD        -- 571
    local RIGHT_W     = CONTENT_W - SIDEBAR_W - 8                      -- 527
    local ITEMS_Y     = -(32 + SUBCAT_H + 4)                           -- -131
    local ITEMS_H     = CONTENT_H - 32 - SUBCAT_H - 4 - 2             -- 438

    -- ---- LEFT SIDEBAR ------------------------------------------------
    local sidebar = CreateFrame("Frame", nil, content)
    sidebar:SetPoint("TOPLEFT", 0, 0)
    sidebar:SetSize(SIDEBAR_W, CONTENT_H)
    SetSimpleBackdrop(sidebar, {0.05, 0.05, 0.09, 0.95}, {0.25, 0.25, 0.4, 1})

    local sideTitle = sidebar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sideTitle:SetPoint("TOP", 0, -8)
    sideTitle:SetText(titleColor .. title .. "|r")

    -- Scrollable category list inside sidebar
    local catScrollFrame = CreateFrame("ScrollFrame", nil, sidebar, "UIPanelScrollFrameTemplate")
    catScrollFrame:SetPoint("TOPLEFT",     4, -26)
    catScrollFrame:SetPoint("BOTTOMRIGHT", -22,  4)

    local catContent = CreateFrame("Frame", nil, catScrollFrame)
    catContent:SetWidth(SIDEBAR_W - 28)
    catScrollFrame:SetScrollChild(catContent)

    -- ---- RIGHT PANEL -------------------------------------------------
    local rightPanel = CreateFrame("Frame", nil, content)
    rightPanel:SetPoint("TOPLEFT", SIDEBAR_W + 8, 0)
    rightPanel:SetSize(RIGHT_W, CONTENT_H)

    -- Search + Qty + Add ID row
    local searchW = RIGHT_W - 130
    local searchCont = CreateEditBox(rightPanel, searchW, 28, "Search by name or ID...")
    searchCont:SetPoint("TOPLEFT", 0, 0)
    local searchBox = searchCont.editBox

    local qtyLabel = rightPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    qtyLabel:SetPoint("LEFT", searchCont, "RIGHT", 8, 0)
    qtyLabel:SetText("Qty:")

    local qtyCont = CreateEditBox(rightPanel, 52, 28, "1")
    qtyCont:SetPoint("LEFT", qtyLabel, "RIGHT", 4, 0)
    local quantityBox = qtyCont.editBox
    quantityBox:SetNumeric(true)
    quantityBox:SetText("1")

    local addIdBtn = CreateButton(rightPanel, 58, 28, "Add ID")
    addIdBtn:SetPoint("LEFT", qtyCont, "RIGHT", 4, 0)
    addIdBtn:SetScript("OnClick", function()
        local id = tonumber(searchBox:GetText())
        if id then
            local qty = tonumber(quantityBox:GetText()) or 1
            SendGMCommand(".additem " .. id .. " " .. qty)
        else
            print("|cffff0000[GM Commander]|r Enter a numeric Item ID in the search box first")
        end
    end)

    -- Subcategory area: FIXED height, never grows beyond SUBCAT_H
    local subcatFrame = CreateFrame("Frame", nil, rightPanel)
    subcatFrame:SetPoint("TOPLEFT", 0, -32)
    subcatFrame:SetSize(RIGHT_W, SUBCAT_H)
    SetSimpleBackdrop(subcatFrame, {0.06, 0.06, 0.1, 0.85}, {0.2, 0.2, 0.32, 1})

    local subcatHint = subcatFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subcatHint:SetPoint("TOPLEFT", 8, -8)
    subcatHint:SetText("|cff555555Select a category from the left...|r")

    -- Scroll frame INSIDE the fixed subcat area so overflow is hidden
    local subcatScrollF = CreateFrame("ScrollFrame", nil, subcatFrame, "UIPanelScrollFrameTemplate")
    subcatScrollF:SetPoint("TOPLEFT",     4, -4)
    subcatScrollF:SetPoint("BOTTOMRIGHT", -22, 4)

    local subcatContent = CreateFrame("Frame", nil, subcatScrollF)
    subcatContent:SetWidth(RIGHT_W - 28)
    subcatScrollF:SetScrollChild(subcatContent)

    -- Items list: anchored BELOW subcat area, never moves
    local itemsList = CreateScrollList(rightPanel, RIGHT_W, ITEMS_H)
    itemsList:SetPoint("TOPLEFT", 0, ITEMS_Y)

    -- ---- State -------------------------------------------------------
    local mySubcatBtns = {}
    local myCurrentCat = nil
    local myCurrentSubcat = nil
    local myCatBtns = {}

    local function UpdateItems(items)
        local lc = itemsList.content
        for _, btn in ipairs(itemsList.buttons) do
            btn:Hide()
            btn:SetParent(nil)
        end
        wipe(itemsList.buttons)

        local yOff = 0
        for _, item in ipairs(items) do
            local btn = CreateItemButton(lc, lc:GetWidth(), item, quantityBox)
            btn:SetPoint("TOPLEFT", 0, -yOff)
            table.insert(itemsList.buttons, btn)
            yOff = yOff + 26
        end
        lc:SetHeight(math.max(yOff, 1))
    end

    local function ShowSubcats(catKey)
        -- Clear old subcat buttons
        for _, btn in ipairs(mySubcatBtns) do btn:Hide() end
        wipe(mySubcatBtns)
        subcatHint:Hide()

        local catData = GMC_ItemDB[catKey]
        if not catData or not catData.subcategories then return end
        myCurrentCat = catKey

        local btnW  = 155
        local btnH  = 22
        local xOff  = 0
        local yOff  = 0
        local maxX  = RIGHT_W - 28   -- leave room for scroll bar

        for subName, items in pairs(catData.subcategories) do
            local btn = CreateButton(subcatContent, btnW, btnH, subName)
            btn:SetPoint("TOPLEFT", xOff, -yOff)
            btn.text:SetFontObject(GameFontNormalSmall)

            local cap_items = items
            local cap_name  = subName
            btn:SetScript("OnClick", function()
                myCurrentSubcat = cap_name
                UpdateItems(cap_items)
                for _, b in ipairs(mySubcatBtns) do
                    b:SetBackdropColor(0.1, 0.1, 0.1, 1)
                    b:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
                end
                btn:SetBackdropColor(0.05, 0.18, 0.05, 1)
                btn:SetBackdropBorderColor(0, 1, 0, 1)
            end)

            table.insert(mySubcatBtns, btn)
            xOff = xOff + btnW + 4
            if xOff + btnW > maxX then
                xOff = 0
                yOff = yOff + btnH + 3
            end
        end
        subcatContent:SetHeight(math.max(yOff + btnH, 1))
    end

    -- ---- Sidebar category buttons ------------------------------------
    local catYOff = 0
    for _, cat in ipairs(categories) do
        local btn = CreateButton(catContent, SIDEBAR_W - 30, 24, "")
        btn:SetPoint("TOPLEFT", 0, -catYOff)
        btn.text:SetText(cat.name)
        btn.text:SetFontObject(GameFontNormalSmall)
        btn.text:ClearAllPoints()
        btn.text:SetPoint("LEFT",  btn, "LEFT",  6, 0)
        btn.text:SetPoint("RIGHT", btn, "RIGHT", -4, 0)
        btn.text:SetJustifyH("LEFT")
        btn.text:SetTextColor(0.85, 0.85, 0.85)

        local capCat = cat
        btn:SetScript("OnClick", function()
            ShowSubcats(capCat.key)
            for _, b in ipairs(myCatBtns) do
                b:SetBackdropColor(0.1, 0.1, 0.1, 1)
                b:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
                b.text:SetTextColor(0.85, 0.85, 0.85)
            end
            local c = capCat.color
            btn:SetBackdropColor(c[1] * 0.22, c[2] * 0.22, c[3] * 0.22, 1)
            btn:SetBackdropBorderColor(c[1], c[2], c[3], 1)
            btn.text:SetTextColor(1, 1, 1)
        end)

        table.insert(myCatBtns, btn)
        catYOff = catYOff + 26
    end
    catContent:SetHeight(math.max(catYOff, 1))

    -- ---- Search (scoped to this tab's categories only) ---------------
    local validCatKeys = {}
    for _, cat in ipairs(categories) do
        validCatKeys[cat.key] = true
    end

    searchBox:SetScript("OnTextChanged", function(self)
        local text = self:GetText()
        self.placeholder:SetShown(text == "")

        if string.len(text) >= 2 then
            local results = {}
            local q    = string.lower(text)
            local numQ = tonumber(q)
            for _, item in ipairs(GMC_SearchIndex) do
                if validCatKeys[item.catKey] then
                    local match = false
                    if numQ then
                        if item.id == numQ or string.find(tostring(item.id), q) then
                            match = true
                        end
                    else
                        if string.find(item.searchName, q) then match = true end
                    end
                    if match then
                        table.insert(results, item)
                        if #results >= 50 then break end
                    end
                end
            end
            UpdateItems(results)
        elseif text == "" and myCurrentCat and myCurrentSubcat then
            local cd = GMC_ItemDB[myCurrentCat]
            if cd and cd.subcategories and cd.subcategories[myCurrentSubcat] then
                UpdateItems(cd.subcategories[myCurrentSubcat])
            end
        end
    end)

    return content
end

-- ============================================================================
-- TAB CATEGORY DEFINITIONS
-- ============================================================================

local MOUNT_CATEGORIES = {
    {key = "MountsHorses",        name = "Horses",          color = {0.7,  0.5,  0.2 }},
    {key = "MountsWolves",        name = "Wolves",          color = {0.5,  0.5,  0.6 }},
    {key = "MountsCats",          name = "Cats & Sabers",   color = {0.7,  0.5,  0.3 }},
    {key = "MountsRams",          name = "Rams",            color = {0.4,  0.4,  0.7 }},
    {key = "MountsRaptors",       name = "Raptors",         color = {0.3,  0.7,  0.3 }},
    {key = "MountsKodos",         name = "Kodos",           color = {0.6,  0.4,  0.2 }},
    {key = "MountsSkeletal",      name = "Skeletal",        color = {0.5,  0.5,  0.5 }},
    {key = "MountsMechs",         name = "Mechs",           color = {0.3,  0.6,  0.8 }},
    {key = "MountsHawkstriders",  name = "Hawkstriders",    color = {0.8,  0.3,  0.3 }},
    {key = "MountsElekks",        name = "Elekks",          color = {0.5,  0.5,  0.8 }},
    {key = "MountsTalbuks",       name = "Talbuks",         color = {0.6,  0.6,  0.4 }},
    {key = "MountsGryphons",      name = "Gryphons",        color = {0.9,  0.7,  0.2 }},
    {key = "MountsDrakes",        name = "Drakes",          color = {0.3,  0.5,  0.9 }},
    {key = "MountsProto",         name = "Proto-Drakes",    color = {0.4,  0.3,  0.7 }},
    {key = "MountsCloudSerpents", name = "Cloud Serpents",  color = {0.2,  0.8,  0.8 }},
    {key = "MountsPhoenix",       name = "Phoenix & Birds", color = {1.0,  0.5,  0.0 }},
    {key = "MountsMammoths",      name = "Mammoths & Bears",color = {0.7,  0.7,  0.7 }},
    {key = "MountsMisc",          name = "Miscellaneous",   color = {0.6,  0.5,  0.4 }},
    {key = "MountsStore",         name = "Store / TCG",     color = {0.2,  0.7,  1.0 }},
}

local ITEMS_CATEGORIES = {
    {key = "Weapons",     name = "Legendary Weapons", color = {0.8, 0.2, 0.2}},
    {key = "Consumables", name = "Consumables",       color = {0.2, 0.8, 0.2}},
}

local LEGION_CATEGORIES = {
    {key = "LegionLegendaries", name = "Legendaries",    color = {1.0, 0.5, 0.0}},
    {key = "MountsLegion",      name = "Legion Mounts",  color = {0.1, 0.9, 0.1}},
    {key = "MountsRaidDrops",   name = "Raid Drops",     color = {0.8, 0.3, 0.9}},
}

local TRANSMOG_CATEGORIES = {
    {key = "TransmogWeapons", name = "Iconic Weapons", color = {0.9, 0.7, 0.1}},
}

-- ============================================================================
-- GOLD TAB
-- ============================================================================

local function CreateGoldTab(parent)
    local content = CreateTabContent(parent, 5)

    local title = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText("|cffffff00Gold Management|r")

    local goldLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    goldLabel:SetPoint("TOPLEFT", 0, -35)
    goldLabel:SetText("Amount (gold):")

    local goldCont = CreateEditBox(content, 140, 28, "Enter amount...")
    goldCont:SetPoint("LEFT", goldLabel, "RIGHT", 10, 0)
    local goldBox = goldCont.editBox
    goldBox:SetNumeric(true)

    local addGoldBtn = CreateButton(content, 120, 30, "Add to Self")
    addGoldBtn:SetPoint("TOPLEFT", 0, -78)
    addGoldBtn:SetScript("OnClick", function()
        local a = goldBox:GetText()
        if a == "" then print("|cffff0000[GM Commander]|r Enter an amount"); return end
        SendGMCommand(".modify money " .. tonumber(a) * 10000)
    end)

    local addTargetBtn = CreateButton(content, 130, 30, "Add to Target")
    addTargetBtn:SetPoint("LEFT", addGoldBtn, "RIGHT", 10, 0)
    addTargetBtn:SetScript("OnClick", function()
        local a = goldBox:GetText()
        if a == "" then print("|cffff0000[GM Commander]|r Enter an amount"); return end
        if not UnitExists("target") then print("|cffff0000[GM Commander]|r No target selected"); return end
        local copper = tonumber(a) * 10000
        local name   = UnitName("target")
        SendGMCommand(".send money " .. name .. " \"GM\" \"Gold\" " .. copper)
    end)

    local sep = content:CreateTexture(nil, "ARTWORK")
    sep:SetColorTexture(0.5, 0.5, 0.5, 0.6)
    sep:SetSize(440, 1)
    sep:SetPoint("TOPLEFT", 0, -122)

    local quickLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    quickLabel:SetPoint("TOPLEFT", 0, -136)
    quickLabel:SetText("|cffffffccQuick Add:|r")

    local quickAmounts = {
        {amount = 100,    text = "100g"},
        {amount = 1000,   text = "1,000g"},
        {amount = 10000,  text = "10,000g"},
        {amount = 100000, text = "100,000g"},
    }
    for i, data in ipairs(quickAmounts) do
        local btn = CreateButton(content, 95, 28, data.text)
        btn:SetPoint("TOPLEFT", (i - 1) * 100, -158)
        btn:SetScript("OnClick", function()
            SendGMCommand(".modify money " .. data.amount * 10000)
        end)
    end

    local capBtn = CreateButton(content, 170, 30, "Set Gold Cap (9.9M)")
    capBtn:SetPoint("TOPLEFT", 0, -202)
    capBtn:SetScript("OnClick", function()
        SendGMCommand(".modify money 99999990000")
    end)

    return content
end

-- ============================================================================
-- MAIN FRAME
-- ============================================================================

local function CreateMainFrame()
    GMCFrame = CreateFrame("Frame", "GMCommanderFrame", UIParent)
    GMCFrame:SetSize(FRAME_W, FRAME_H)
    GMCFrame:SetPoint("CENTER")
    GMCFrame:SetFrameStrata("HIGH")
    SetBackdrop(GMCFrame, {0.08, 0.08, 0.1, 0.97}, {0.55, 0.55, 0.55, 1})

    GMCFrame:SetMovable(true)
    GMCFrame:EnableMouse(true)
    GMCFrame:RegisterForDrag("LeftButton")
    GMCFrame:SetScript("OnDragStart", GMCFrame.StartMoving)
    GMCFrame:SetScript("OnDragStop",  GMCFrame.StopMovingOrSizing)
    GMCFrame:SetClampedToScreen(true)
    GMCFrame:Hide()

    -- Title bar
    local titleBar = CreateFrame("Frame", nil, GMCFrame)
    titleBar:SetPoint("TOPLEFT",  8, -8)
    titleBar:SetPoint("TOPRIGHT", -8, -8)
    titleBar:SetHeight(TITLEBAR_H - 4)
    SetSimpleBackdrop(titleBar, {0.12, 0.12, 0.18, 1}, {0.5, 0.5, 0.6, 1})

    local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("CENTER")
    titleText:SetText("|cff00ccffGM Commander|r |cff888888v2.0|r")

    local closeBtn = CreateFrame("Button", nil, GMCFrame)
    closeBtn:SetSize(24, 24)
    closeBtn:SetPoint("TOPRIGHT", -10, -9)
    closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeBtn:SetScript("OnClick", function() GMCFrame:Hide() end)

    tinsert(UISpecialFrames, "GMCommanderFrame")

    -- 5 tabs, evenly spaced
    local tabW   = 130
    local tabGap = 4
    local startX = PAD
    CreateTab(GMCFrame, 1, "Mounts",   startX + 0 * (tabW + tabGap), tabW)
    CreateTab(GMCFrame, 2, "Items",    startX + 1 * (tabW + tabGap), tabW)
    CreateTab(GMCFrame, 3, "Legion",   startX + 2 * (tabW + tabGap), tabW)
    CreateTab(GMCFrame, 4, "Transmog", startX + 3 * (tabW + tabGap), tabW)
    CreateTab(GMCFrame, 5, "Gold",     startX + 4 * (tabW + tabGap), tabW)

    -- Tab contents
    CreateItemBrowserTab(GMCFrame, 1, "Mounts",   "|cff88ccff", MOUNT_CATEGORIES)
    CreateItemBrowserTab(GMCFrame, 2, "Items",    "|cff88ff88", ITEMS_CATEGORIES)
    CreateItemBrowserTab(GMCFrame, 3, "Legion",   "|cffff8800", LEGION_CATEGORIES)
    CreateItemBrowserTab(GMCFrame, 4, "Transmog", "|cffffdd44", TRANSMOG_CATEGORIES)
    CreateGoldTab(GMCFrame)

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

    local angle  = 45
    local radius = 80
    button:SetPoint("CENTER", Minimap, "CENTER", radius * cos(angle), radius * sin(angle))

    local isDragging = false
    button:RegisterForDrag("RightButton")
    button:RegisterForClicks("LeftButtonUp")

    button:SetScript("OnDragStart", function() isDragging = true  end)
    button:SetScript("OnDragStop",  function() isDragging = false end)
    button:SetScript("OnUpdate", function(self)
        if isDragging then
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale  = Minimap:GetEffectiveScale()
            px, py = px / scale, py / scale
            local newAngle = math.deg(math.atan2(py - my, px - mx))
            self:ClearAllPoints()
            self:SetPoint("CENTER", Minimap, "CENTER",
                radius * cos(newAngle), radius * sin(newAngle))
        end
    end)

    button:SetScript("OnClick", function()
        if GMCFrame:IsShown() then GMCFrame:Hide() else GMCFrame:Show() end
    end)
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("|cff00ccffGM Commander|r")
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cffffffffLeft-click|r to toggle",   0.8, 0.8, 0.8)
        GameTooltip:AddLine("|cffffffffRight-drag|r to move",     0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)

    return button
end

-- ============================================================================
-- SLASH COMMANDS
-- ============================================================================

SLASH_GMCOMMANDER1 = "/gmc"
SLASH_GMCOMMANDER2 = "/gmcommander"

SlashCmdList["GMCOMMANDER"] = function()
    if GMCFrame:IsShown() then GMCFrame:Hide() else GMCFrame:Show() end
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
        print("|cff00ccff[GM Commander]|r v2.0 Loaded! Type |cffffffff/gmc|r to open.")
    end
end)
