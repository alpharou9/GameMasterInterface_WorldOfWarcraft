# GM Commander

A graphical GM command interface for **World of Warcraft Legion 7.3.5** private servers.
Browse and spawn mounts, items, Legion gear, and transmog appearances — without typing a single command.

---

## Installation

1. Download or clone this repo
2. Copy the `GMCommander` folder into:
   ```
   World of Warcraft/Interface/AddOns/GMCommander/
   ```
3. Log in and make sure **GM Commander** is enabled in the AddOns list

---

## Opening the Addon

**Option 1 — Slash command**
```
/gmc
```

**Option 2 — Minimap button**
Click the book icon around the minimap to toggle the window. Right-drag to reposition it.

**Option 3 — Macro** *(recommended)*
Create an in-game macro so you can open it with a single keybind:

1. Press `Esc` → **Macros** → **New**
2. Give it a name and any icon
3. Paste this as the macro body:
   ```
   /gmc
   ```
4. Drag it to your action bar and bind a key

---

## Tabs

| Tab | What it does |
|-----|-------------|
| **Mounts** | Browse 500+ mounts by type — click to add to yourself |
| **Items** | Legendary weapons, consumables — click to add |
| **Legion** | Legion legendaries & raid gear (N/H/M via Bonus IDs) |
| **Transmog** | Browse iconic weapons — click to preview in the Dressing Room |
| **Gold** | Add gold to yourself or a target player |

---

## How to Use Each Tab

### Mounts / Items / Legion

1. Click a **category** in the left sidebar (e.g. *Drakes*)
2. Click a **subcategory** button that appears (e.g. *WotLK Drakes*)
3. Click any item in the list to spawn it
4. Use the **Qty** box to set how many you want
5. Or type a name / item ID in the **search bar** to find anything instantly

### Bonus IDs (Legion tab)

Bonus IDs control item quality when spawning Legion gear:

| Preset | Effect |
|--------|--------|
| None | Base item, no bonus |
| Heroic | Heroic difficulty (`569`) |
| Mythic | Mythic difficulty (`561`) |
| Epic TF | Mythic + Titanforged — purple quality (`561:3337`) |

You can also type custom bonus IDs in the free-form box (e.g. `561:3337:40` for Mythic TF + Socket).

### Transmog

Click any weapon to open the **Dressing Room** and preview how it looks on your character. Nothing is added to your inventory.

### Gold

- Type an amount and click **Add to Self** or **Add to Target**
- Use the quick buttons for common amounts (100g / 1,000g / 10,000g / 100,000g)
- **Set Gold Cap** gives you the maximum (9.9 million gold)

---

## Add ID Button

If you know an item ID that isn't in the database:

1. Type the ID in the search bar
2. Set quantity and bonus IDs if needed
3. Click **Add ID**

---

## Reset Button

If something looks off or buttons from a previous tab are still showing, click **Reset** (top-right of the window) to return to the default state. You can also type `/reload` as a last resort.

---

## Slash Commands

| Command | Action |
|---------|--------|
| `/gmc` | Toggle the GM Commander window |
| `/gmcommander` | Same as above |

---

## Requirements

- Legion 7.3.5 private server with GM access
- GM-level `.add` and `.modify money` commands must be enabled on the server
