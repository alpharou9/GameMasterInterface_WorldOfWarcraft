-- GMCommander Item Database - MEGA EXPANDED Edition
-- Contains 500+ mounts and Legion items

GMC_ItemDB = {
    -- ========================================================================
    -- MOUNTS - HORSES & STEEDS
    -- ========================================================================
    MountsHorses = {
        category = "Mounts: Horses",
        icon = "Interface\\Icons\\Ability_Mount_RidingHorse",
        subcategories = {
            ["Alliance Horses"] = {
                {id = 2411, name = "Black Stallion Bridle"},
                {id = 2414, name = "Pinto Bridle"},
                {id = 5655, name = "Chestnut Mare Bridle"},
                {id = 5656, name = "Brown Horse Bridle"},
                {id = 18776, name = "Swift Palomino"},
                {id = 18777, name = "Swift White Steed"},
                {id = 18778, name = "Swift Brown Steed"},
                {id = 12353, name = "White Stallion Bridle"},
                {id = 12354, name = "Palomino Bridle"},
            },
            ["Paladin Chargers"] = {
                {id = 47179, name = "Argent Charger"},
                {id = 49096, name = "Crusader's White Warhorse"},
                {id = 49098, name = "Crusader's Black Warhorse"},
            },
            ["PvP Horses"] = {
                {id = 29468, name = "Black War Steed Bridle"},
                {id = 19030, name = "Stormpike Battle Charger"},
                {id = 70909, name = "Vicious War Steed"},
            },
            ["Rare Horses"] = {
                {id = 30480, name = "Fiery Warhorse's Reins"},
                {id = 50818, name = "Invincible's Reins"},
                {id = 143499, name = "Highlord's Golden Charger"},
                {id = 143500, name = "Highlord's Vengeful Charger"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - WOLVES
    -- ========================================================================
    MountsWolves = {
        category = "Mounts: Wolves",
        icon = "Interface\\Icons\\Ability_Mount_BlackDireWolf",
        subcategories = {
            ["Horde Wolves"] = {
                {id = 5665, name = "Horn of the Dire Wolf"},
                {id = 5668, name = "Horn of the Brown Wolf"},
                {id = 1132, name = "Horn of the Timber Wolf"},
                {id = 18796, name = "Horn of the Swift Brown Wolf"},
                {id = 18797, name = "Horn of the Swift Timber Wolf"},
                {id = 18798, name = "Horn of the Swift Gray Wolf"},
            },
            ["PvP Wolves"] = {
                {id = 29469, name = "Horn of the Black War Wolf"},
                {id = 19029, name = "Horn of the Frostwolf Howler"},
                {id = 70910, name = "Vicious War Wolf"},
            },
            ["WoD Wolves"] = {
                {id = 116658, name = "Tundra Icehoof"},
                {id = 116659, name = "Garn Nighthowl"},
                {id = 116784, name = "Ironside Warwolf"},
                {id = 116794, name = "Garn Steelmaw"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - CATS & SABERS
    -- ========================================================================
    MountsCats = {
        category = "Mounts: Cats",
        icon = "Interface\\Icons\\Ability_Mount_WhiteTiger",
        subcategories = {
            ["Night Elf Sabers"] = {
                {id = 8629, name = "Reins of the Striped Nightsaber"},
                {id = 8631, name = "Reins of the Striped Frostsaber"},
                {id = 8632, name = "Reins of the Spotted Frostsaber"},
                {id = 18766, name = "Reins of the Swift Frostsaber"},
                {id = 18767, name = "Reins of the Swift Mistsaber"},
                {id = 18902, name = "Reins of the Swift Stormsaber"},
                {id = 47100, name = "Reins of the Striped Dawnsaber"},
            },
            ["PvP Tigers"] = {
                {id = 29471, name = "Reins of the Black War Tiger"},
                {id = 102533, name = "Reins of the Vicious Warsaber"},
                {id = 143648, name = "Vicious War Lion"},
            },
            ["Spectral Tigers (TCG)"] = {
                {id = 33224, name = "Reins of the Spectral Tiger"},
                {id = 33225, name = "Reins of the Swift Spectral Tiger"},
            },
            ["Special Cats"] = {
                {id = 13086, name = "Reins of the Winterspring Frostsaber"},
                {id = 68824, name = "Swift Zulian Panther"},
            },
            ["Jewelcrafting Panthers"] = {
                {id = 82453, name = "Jeweled Onyx Panther"},
                {id = 83087, name = "Ruby Panther"},
                {id = 83088, name = "Jade Panther"},
                {id = 83089, name = "Sunstone Panther"},
                {id = 83090, name = "Sapphire Panther"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - RAMS
    -- ========================================================================
    MountsRams = {
        category = "Mounts: Rams",
        icon = "Interface\\Icons\\Ability_Mount_MountainRam",
        subcategories = {
            ["Dwarf Rams"] = {
                {id = 5864, name = "Gray Ram"},
                {id = 5872, name = "Brown Ram"},
                {id = 5873, name = "White Ram"},
                {id = 18785, name = "Swift White Ram"},
                {id = 18786, name = "Swift Brown Ram"},
                {id = 18787, name = "Swift Gray Ram"},
            },
            ["Special Rams"] = {
                {id = 13328, name = "Black Ram"},
                {id = 13329, name = "Frost Ram"},
                {id = 29467, name = "Black War Ram"},
                {id = 33977, name = "Swift Brewfest Ram"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - RAPTORS
    -- ========================================================================
    MountsRaptors = {
        category = "Mounts: Raptors",
        icon = "Interface\\Icons\\Ability_Mount_Raptor",
        subcategories = {
            ["Troll Raptors"] = {
                {id = 8588, name = "Whistle of the Emerald Raptor"},
                {id = 8591, name = "Whistle of the Turquoise Raptor"},
                {id = 8592, name = "Whistle of the Violet Raptor"},
                {id = 18788, name = "Swift Blue Raptor"},
                {id = 18789, name = "Swift Olive Raptor"},
                {id = 18790, name = "Swift Orange Raptor"},
            },
            ["PvP Raptors"] = {
                {id = 29472, name = "Whistle of the Black War Raptor"},
            },
            ["Special Raptors"] = {
                {id = 19872, name = "Swift Razzashi Raptor"},
                {id = 68823, name = "Armored Razzashi Raptor"},
                {id = 64659, name = "Fossilized Raptor"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - KODOS
    -- ========================================================================
    MountsKodos = {
        category = "Mounts: Kodos",
        icon = "Interface\\Icons\\Ability_Mount_Kodo_03",
        subcategories = {
            ["Tauren Kodos"] = {
                {id = 15277, name = "Gray Kodo"},
                {id = 15290, name = "Brown Kodo"},
                {id = 18793, name = "Great White Kodo"},
                {id = 18794, name = "Great Brown Kodo"},
                {id = 18795, name = "Great Gray Kodo"},
            },
            ["Special Kodos"] = {
                {id = 29466, name = "Black War Kodo"},
                {id = 37828, name = "Great Brewfest Kodo"},
                {id = 49046, name = "White Kodo"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - SKELETAL HORSES
    -- ========================================================================
    MountsSkeletal = {
        category = "Mounts: Skeletal",
        icon = "Interface\\Icons\\Ability_Mount_Undeadhorse",
        subcategories = {
            ["Undead Horses"] = {
                {id = 13331, name = "Red Skeletal Horse"},
                {id = 13332, name = "Blue Skeletal Horse"},
                {id = 13333, name = "Brown Skeletal Horse"},
                {id = 13334, name = "Green Skeletal Warhorse"},
                {id = 18791, name = "Purple Skeletal Warhorse"},
                {id = 46308, name = "Black Skeletal Horse"},
            },
            ["Special Skeletal"] = {
                {id = 13335, name = "Deathcharger's Reins"},
                {id = 29470, name = "Red Skeletal Warhorse"},
                {id = 102514, name = "Vicious Skeletal Warhorse"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - MECHANICAL
    -- ========================================================================
    MountsMechs = {
        category = "Mounts: Mechs",
        icon = "Interface\\Icons\\Ability_Mount_MechaStrider",
        subcategories = {
            ["Mechanostriders"] = {
                {id = 8563, name = "Red Mechanostrider"},
                {id = 8595, name = "Blue Mechanostrider"},
                {id = 13321, name = "Green Mechanostrider"},
                {id = 13322, name = "Unpainted Mechanostrider"},
                {id = 18772, name = "Swift Green Mechanostrider"},
                {id = 18773, name = "Swift White Mechanostrider"},
                {id = 18774, name = "Swift Yellow Mechanostrider"},
                {id = 29465, name = "Black Battlestrider"},
            },
            ["Choppers & Bikes"] = {
                {id = 44413, name = "Mekgineer's Chopper"},
                {id = 41508, name = "Mechano-hog"},
            },
            ["Rockets"] = {
                {id = 87250, name = "Depleted-Kyparium Rocket"},
                {id = 87251, name = "Geosynchronous World Spinner"},
                {id = 49285, name = "X-51 Nether-Rocket"},
                {id = 49286, name = "X-51 Nether-Rocket X-TREME"},
            },
            ["Other Mechs"] = {
                {id = 124540, name = "Vicious War Mechanostrider"},
                {id = 152788, name = "Lightforged Warframe"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - HAWKSTRIDERS
    -- ========================================================================
    MountsHawkstriders = {
        category = "Mounts: Hawkstriders",
        icon = "Interface\\Icons\\Ability_Mount_CockatriceMountElite",
        subcategories = {
            ["Blood Elf Hawkstriders"] = {
                {id = 28927, name = "Red Hawkstrider"},
                {id = 29220, name = "Blue Hawkstrider"},
                {id = 29221, name = "Purple Hawkstrider"},
                {id = 29222, name = "Black Hawkstrider"},
                {id = 28936, name = "Swift Pink Hawkstrider"},
                {id = 29223, name = "Swift Green Hawkstrider"},
                {id = 29224, name = "Swift Purple Hawkstrider"},
            },
            ["Special Hawkstriders"] = {
                {id = 35513, name = "Swift White Hawkstrider"},
                {id = 34129, name = "Swift Warstrider"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - ELEKKS
    -- ========================================================================
    MountsElekks = {
        category = "Mounts: Elekks",
        icon = "Interface\\Icons\\Ability_Mount_Ridingelekk",
        subcategories = {
            ["Draenei Elekks"] = {
                {id = 28481, name = "Brown Elekk"},
                {id = 29743, name = "Gray Elekk"},
                {id = 29744, name = "Purple Elekk"},
                {id = 29745, name = "Great Blue Elekk"},
                {id = 29746, name = "Great Green Elekk"},
                {id = 29747, name = "Great Purple Elekk"},
            },
            ["Special Elekks"] = {
                {id = 35906, name = "Reins of the Black War Elekk"},
                {id = 45725, name = "Reins of the Argent Hippogryph"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - TALBUKS
    -- ========================================================================
    MountsTalbuks = {
        category = "Mounts: Talbuks",
        icon = "Interface\\Icons\\Ability_Mount_WhiteDireWolf",
        subcategories = {
            ["Riding Talbuks"] = {
                {id = 31829, name = "Cobalt Riding Talbuk"},
                {id = 31831, name = "Silver Riding Talbuk"},
                {id = 31833, name = "Tan Riding Talbuk"},
                {id = 31835, name = "White Riding Talbuk"},
                {id = 31836, name = "Dark Riding Talbuk"},
            },
            ["War Talbuks"] = {
                {id = 29227, name = "Cobalt War Talbuk"},
                {id = 29229, name = "Silver War Talbuk"},
                {id = 29230, name = "Tan War Talbuk"},
                {id = 29231, name = "White War Talbuk"},
                {id = 29228, name = "Dark War Talbuk"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - FLYING - GRYPHONS & WIND RIDERS
    -- ========================================================================
    MountsGryphons = {
        category = "Mounts: Gryphons",
        icon = "Interface\\Icons\\Ability_Mount_Gryphon_01",
        subcategories = {
            ["Alliance Gryphons"] = {
                {id = 25470, name = "Golden Gryphon"},
                {id = 25471, name = "Ebon Gryphon"},
                {id = 25472, name = "Snowy Gryphon"},
                {id = 25473, name = "Swift Blue Gryphon"},
                {id = 25527, name = "Swift Red Gryphon"},
                {id = 25528, name = "Swift Green Gryphon"},
                {id = 25529, name = "Swift Purple Gryphon"},
            },
            ["Horde Wind Riders"] = {
                {id = 25474, name = "Tawny Wind Rider"},
                {id = 25475, name = "Blue Wind Rider"},
                {id = 25476, name = "Green Wind Rider"},
                {id = 25477, name = "Swift Red Wind Rider"},
                {id = 25531, name = "Swift Green Wind Rider"},
                {id = 25532, name = "Swift Yellow Wind Rider"},
                {id = 25533, name = "Swift Purple Wind Rider"},
            },
            ["Armored Gryphons"] = {
                {id = 44689, name = "Armored Blue Wind Rider"},
                {id = 44690, name = "Armored Snowy Gryphon"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - FLYING - DRAKES
    -- ========================================================================
    MountsDrakes = {
        category = "Mounts: Drakes",
        icon = "Interface\\Icons\\Ability_Mount_Drake_Bronze",
        subcategories = {
            ["Netherwing Drakes"] = {
                {id = 32857, name = "Reins of the Onyx Netherwing Drake"},
                {id = 32858, name = "Reins of the Azure Netherwing Drake"},
                {id = 32859, name = "Reins of the Cobalt Netherwing Drake"},
                {id = 32860, name = "Reins of the Purple Netherwing Drake"},
                {id = 32861, name = "Reins of the Veridian Netherwing Drake"},
                {id = 32862, name = "Reins of the Violet Netherwing Drake"},
            },
            ["WotLK Drakes"] = {
                {id = 43951, name = "Reins of the Bronze Drake"},
                {id = 43952, name = "Reins of the Azure Drake"},
                {id = 43953, name = "Reins of the Blue Drake"},
                {id = 43954, name = "Reins of the Twilight Drake"},
                {id = 43986, name = "Reins of the Black Drake"},
                {id = 44151, name = "Reins of the Blue Proto-Drake"},
                {id = 44164, name = "Reins of the Black Proto-Drake"},
                {id = 44168, name = "Reins of the Time-Lost Proto-Drake"},
                {id = 44175, name = "Reins of the Plagued Proto-Drake"},
                {id = 44707, name = "Reins of the Red Proto-Drake"},
            },
            ["Cataclysm Drakes"] = {
                {id = 63040, name = "Reins of the Drake of the North Wind"},
                {id = 63041, name = "Reins of the Drake of the South Wind"},
                {id = 62901, name = "Reins of the Volcanic Stone Drake"},
                {id = 63042, name = "Reins of the Drake of the East Wind"},
                {id = 63043, name = "Reins of the Vitreous Stone Drake"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - FLYING - PROTO-DRAKES
    -- ========================================================================
    MountsProto = {
        category = "Mounts: Proto-Drakes",
        icon = "Interface\\Icons\\Ability_Mount_ProtodrakeBlack",
        subcategories = {
            ["Proto-Drakes"] = {
                {id = 44151, name = "Reins of the Blue Proto-Drake"},
                {id = 44164, name = "Reins of the Black Proto-Drake"},
                {id = 44168, name = "Reins of the Time-Lost Proto-Drake"},
                {id = 44175, name = "Reins of the Plagued Proto-Drake"},
                {id = 44707, name = "Reins of the Red Proto-Drake"},
                {id = 45271, name = "Reins of the Rusted Proto-Drake"},
                {id = 45802, name = "Reins of the Ironbound Proto-Drake"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - CLOUD SERPENTS
    -- ========================================================================
    MountsCloudSerpents = {
        category = "Mounts: Cloud Serpents",
        icon = "Interface\\Icons\\Ability_Mount_CloudSerpent",
        subcategories = {
            ["Order of the Cloud Serpent"] = {
                {id = 85430, name = "Reins of the Azure Cloud Serpent"},
                {id = 85429, name = "Reins of the Golden Cloud Serpent"},
                {id = 79802, name = "Reins of the Jade Cloud Serpent"},
            },
            ["Heavenly Cloud Serpents"] = {
                {id = 87771, name = "Reins of the Heavenly Onyx Cloud Serpent"},
                {id = 87774, name = "Reins of the Heavenly Golden Cloud Serpent"},
                {id = 87773, name = "Reins of the Heavenly Azure Cloud Serpent"},
                {id = 87769, name = "Reins of the Heavenly Crimson Cloud Serpent"},
            },
            ["Thundering Cloud Serpents"] = {
                {id = 90655, name = "Reins of the Thundering Ruby Cloud Serpent"},
                {id = 95057, name = "Reins of the Thundering Cobalt Cloud Serpent"},
                {id = 87776, name = "Reins of the Thundering August Cloud Serpent"},
                {id = 104269, name = "Reins of the Thundering Onyx Cloud Serpent"},
            },
            ["Astral Cloud Serpent"] = {
                {id = 87777, name = "Reins of the Astral Cloud Serpent"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - PHOENIXES & BIRDS
    -- ========================================================================
    MountsPhoenix = {
        category = "Mounts: Phoenix & Birds",
        icon = "Interface\\Icons\\Ability_Mount_Phoenix_Ashes",
        subcategories = {
            ["Phoenixes"] = {
                {id = 32458, name = "Ashes of Al'ar"},
                {id = 69224, name = "Smoldering Egg of Millagazor"},
                {id = 71665, name = "Flametalon of Alysrazor"},
            },
            ["Ravens & Crows"] = {
                {id = 32768, name = "Reins of the Raven Lord"},
                {id = 152789, name = "Shackled Ur'zul"},
            },
            ["Hippogryphs"] = {
                {id = 44223, name = "Reins of the Cenarion War Hippogryph"},
                {id = 45725, name = "Reins of the Argent Hippogryph"},
                {id = 69213, name = "Reins of the Flameward Hippogryph"},
                {id = 138258, name = "Cloudwing Hippogryph"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - LEGENDARY RAID DROPS
    -- ========================================================================
    MountsRaidDrops = {
        category = "Mounts: Raid Drops",
        icon = "Interface\\Icons\\Ability_Mount_Drake_Azure",
        subcategories = {
            ["Classic & TBC"] = {
                {id = 32458, name = "Ashes of Al'ar"},
                {id = 30480, name = "Fiery Warhorse's Reins"},
                {id = 32768, name = "Reins of the Raven Lord"},
            },
            ["WotLK"] = {
                {id = 43954, name = "Reins of the Twilight Drake"},
                {id = 44083, name = "Reins of the Grand Black War Mammoth"},
                {id = 45693, name = "Mimiron's Head"},
                {id = 50818, name = "Invincible's Reins"},
            },
            ["Cataclysm"] = {
                {id = 63040, name = "Reins of the Drake of the North Wind"},
                {id = 63041, name = "Reins of the Drake of the South Wind"},
                {id = 69224, name = "Smoldering Egg of Millagazor"},
                {id = 71665, name = "Flametalon of Alysrazor"},
                {id = 77069, name = "Reins of the Life-Binder's Handmaiden"},
                {id = 78919, name = "Experiment 12-B"},
            },
            ["MoP"] = {
                {id = 87771, name = "Reins of the Heavenly Onyx Cloud Serpent"},
                {id = 93666, name = "Spawn of Horridon"},
                {id = 95059, name = "Clutch of Ji-Kun"},
                {id = 104253, name = "Kor'kron Juggernaut"},
            },
            ["WoD"] = {
                {id = 116771, name = "Solar Spirehawk"},
                {id = 123890, name = "Felsteel Annihilator"},
                {id = 116660, name = "Ironhoof Destroyer"},
            },
            ["Legion"] = {
                {id = 137574, name = "Living Infernal Core"},
                {id = 137575, name = "Fiendish Hellfire Core"},
                {id = 143643, name = "Midnight's Eternal Reins"},
                {id = 152816, name = "Antoran Charhound"},
                {id = 152789, name = "Shackled Ur'zul"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - LEGION SPECIFIC
    -- ========================================================================
    MountsLegion = {
        category = "Mounts: Legion",
        icon = "Interface\\Icons\\Ability_Mount_FelDrake",
        subcategories = {
            ["Class Mounts - Tanks"] = {
                {id = 143499, name = "Highlord's Golden Charger"}, -- Paladin
                {id = 143500, name = "Highlord's Vengeful Charger"}, -- Paladin
                {id = 143509, name = "Battlelord's Bloodthirsty War Wyrm"}, -- Warrior
                {id = 143510, name = "Bloodthirsty War Wyrm Variant"}, -- Warrior
                {id = 143511, name = "Deathlord's Vilebrood Vanquisher"}, -- DK
                {id = 143512, name = "Vilebrood Vanquisher Variant"}, -- DK
            },
            ["Class Mounts - Melee DPS"] = {
                {id = 143489, name = "Slayer's Felbroken Shrieker"}, -- DH
                {id = 143490, name = "Crimson Slavermaw"}, -- DH
                {id = 143503, name = "Shadowblade's Murderous Omen"}, -- Rogue
                {id = 143504, name = "Shadowblade's Lethal Omen"}, -- Rogue
            },
            ["Class Mounts - Ranged"] = {
                {id = 143493, name = "Huntmaster's Loyal Wolfhawk"}, -- Hunter
                {id = 143494, name = "Huntmaster's Fierce Wolfhawk"}, -- Hunter
                {id = 143495, name = "Archmage's Prismatic Disc"}, -- Mage
                {id = 143496, name = "Archmage's Glowing Disc"}, -- Mage
                {id = 143507, name = "Netherlord's Chaotic Wrathsteed"}, -- Warlock
                {id = 143508, name = "Netherlord's Brimstone Wrathsteed"}, -- Warlock
            },
            ["Class Mounts - Healers"] = {
                {id = 143491, name = "Archdruid's Lunarwing Form"}, -- Druid
                {id = 143492, name = "Lunarwing Owl Variant"}, -- Druid
                {id = 143497, name = "Ban-Lu, Grandmaster's Companion"}, -- Monk
                {id = 143498, name = "Ban-Fu, Cub of Ban-Lu"}, -- Monk
                {id = 143501, name = "High Priest's Lightsworn Seeker"}, -- Priest
                {id = 143502, name = "Darksworn Seeker"}, -- Priest
                {id = 143505, name = "Farseer's Raging Tempest"}, -- Shaman
                {id = 143506, name = "Farseer's Furious Tempest"}, -- Shaman
            },
            ["Legion Raid Mounts"] = {
                {id = 137574, name = "Living Infernal Core"},
                {id = 137575, name = "Fiendish Hellfire Core"},
                {id = 143643, name = "Midnight's Eternal Reins"},
                {id = 152816, name = "Antoran Charhound"},
                {id = 152789, name = "Shackled Ur'zul"},
                {id = 152791, name = "Violet Spellwing"},
            },
            ["Argus Mounts"] = {
                {id = 152788, name = "Lightforged Warframe"},
                {id = 152790, name = "Maddened Chaosrunner"},
                {id = 152793, name = "Biletooth Gnasher"},
                {id = 152814, name = "Acid Belcher"},
                {id = 152815, name = "Crimson Slavermaw"},
            },
            ["Legion Reputation"] = {
                {id = 137573, name = "Arcanist's Manasaber"},
                {id = 138387, name = "Highmountain Elderhorn"},
                {id = 142436, name = "Leywoven Flying Carpet"},
                {id = 138389, name = "Spirit of Eche'ro"},
                {id = 142369, name = "Wild Dreamrunner"},
                {id = 147805, name = "Riddler's Mind-Worm"},
            },
            ["Legion World/Rare"] = {
                {id = 138258, name = "Cloudwing Hippogryph"},
                {id = 152840, name = "Pond Nettle"},
                {id = 152841, name = "Darkspore Mana Ray"},
                {id = 152842, name = "Vibrant Mana Ray"},
                {id = 152843, name = "Felglow Mana Ray"},
                {id = 152844, name = "Lambent Mana Ray"},
            },
            ["Legion PvP"] = {
                {id = 143864, name = "Vindictive Gladiator's Storm Dragon"},
                {id = 143865, name = "Fearless Gladiator's Storm Dragon"},
                {id = 143866, name = "Cruel Gladiator's Storm Dragon"},
                {id = 143867, name = "Ferocious Gladiator's Storm Dragon"},
                {id = 143868, name = "Fierce Gladiator's Storm Dragon"},
                {id = 143869, name = "Dominant Gladiator's Storm Dragon"},
                {id = 143870, name = "Demonic Gladiator's Storm Dragon"},
            },
            ["Legion Achievements"] = {
                {id = 137570, name = "Defiled Reins"},
                {id = 141216, name = "Grove Defiler"},
                {id = 141217, name = "Leyfeather Hippogryph"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - STORE & TCG
    -- ========================================================================
    MountsStore = {
        category = "Mounts: Store/TCG",
        icon = "Interface\\Icons\\Ability_Mount_CelestialHorse",
        subcategories = {
            ["Blizzard Store"] = {
                {id = 54811, name = "Celestial Steed"},
                {id = 69846, name = "Winged Guardian"},
                {id = 78924, name = "Heart of the Aspects"},
                {id = 92724, name = "Swift Windsteed"},
                {id = 95341, name = "Armored Bloodwing"},
                {id = 97989, name = "Enchanted Fey Dragon"},
                {id = 112326, name = "Iron Skyreaver"},
                {id = 122469, name = "Mystic Runesaber"},
                {id = 128425, name = "Illidari Felstalker"},
                {id = 137576, name = "Luminous Starseeker"},
                {id = 147901, name = "Twilight Avenger"},
            },
            ["TCG Mounts"] = {
                {id = 33224, name = "Reins of the Spectral Tiger"},
                {id = 33225, name = "Reins of the Swift Spectral Tiger"},
                {id = 49282, name = "Big Battle Bear"},
                {id = 49283, name = "Reins of the X-53 Touring Rocket"},
                {id = 49284, name = "Reins of the Magic Rooster"},
                {id = 49285, name = "X-51 Nether-Rocket"},
                {id = 49286, name = "X-51 Nether-Rocket X-TREME"},
                {id = 54068, name = "Wooly White Rhino"},
                {id = 54069, name = "Blazing Hippogryph"},
                {id = 68008, name = "Mottled Drake"},
                {id = 69228, name = "Savage Raptor"},
                {id = 71718, name = "Swift Shorestrider"},
                {id = 72575, name = "White Riding Camel"},
                {id = 72582, name = "Corrupted Hippogryph"},
                {id = 79771, name = "Feldrake"},
                {id = 93671, name = "Ghastly Charger's Skull"},
            },
            ["Collector's Edition"] = {
                {id = 85870, name = "Imperial Quilen"},
                {id = 109013, name = "Dread Raven"},
                {id = 128706, name = "Reins of the Infinite Timereaver"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - MAMMOTHS & BEARS
    -- ========================================================================
    MountsMammoths = {
        category = "Mounts: Mammoths & Bears",
        icon = "Interface\\Icons\\Ability_Mount_Mammoth_White",
        subcategories = {
            ["Mammoths"] = {
                {id = 44080, name = "Reins of the Ice Mammoth (A)"},
                {id = 44086, name = "Reins of the Ice Mammoth (H)"},
                {id = 43958, name = "Reins of the Grand Ice Mammoth (A)"},
                {id = 43961, name = "Reins of the Grand Ice Mammoth (H)"},
                {id = 44083, name = "Reins of the Grand Black War Mammoth (A)"},
                {id = 44077, name = "Reins of the Grand Black War Mammoth (H)"},
                {id = 44230, name = "Reins of the Wooly Mammoth (A)"},
                {id = 44231, name = "Reins of the Wooly Mammoth (H)"},
                {id = 44234, name = "Reins of the Traveler's Tundra Mammoth (A)"},
                {id = 44235, name = "Reins of the Traveler's Tundra Mammoth (H)"},
            },
            ["Bears"] = {
                {id = 43599, name = "Big Blizzard Bear"},
                {id = 38576, name = "Big Battle Bear"},
                {id = 60114, name = "Armored Brown Bear (A)"},
                {id = 60116, name = "Armored Brown Bear (H)"},
                {id = 22464, name = "Amani War Bear"},
                {id = 69747, name = "Amani Battle Bear"},
                {id = 140348, name = "Vicious War Bear (H)"},
                {id = 140354, name = "Vicious War Bear (A)"},
            },
        },
    },

    -- ========================================================================
    -- MOUNTS - MISCELLANEOUS
    -- ========================================================================
    MountsMisc = {
        category = "Mounts: Misc",
        icon = "Interface\\Icons\\Ability_Mount_Camel",
        subcategories = {
            ["Carpets"] = {
                {id = 44554, name = "Flying Carpet"},
                {id = 44555, name = "Magnificent Flying Carpet"},
                {id = 44556, name = "Frosty Flying Carpet"},
                {id = 65891, name = "Sandstone Drake"},
                {id = 108883, name = "Creeping Carpet"},
                {id = 142436, name = "Leywoven Flying Carpet"},
            },
            ["Camels"] = {
                {id = 63044, name = "Reins of the Brown Riding Camel"},
                {id = 63045, name = "Reins of the Tan Riding Camel"},
                {id = 63046, name = "Reins of the Grey Riding Camel"},
                {id = 72575, name = "White Riding Camel"},
            },
            ["Turtles"] = {
                {id = 46109, name = "Sea Turtle"},
                {id = 64731, name = "Riding Turtle"},
                {id = 142235, name = "Vicious War Turtle (A)"},
                {id = 142437, name = "Vicious War Turtle (H)"},
            },
            ["Goats"] = {
                {id = 89305, name = "White Riding Goat"},
                {id = 89306, name = "Black Riding Goat"},
                {id = 89307, name = "Brown Riding Goat"},
            },
            ["Direhorns"] = {
                {id = 93666, name = "Spawn of Horridon"},
                {id = 94228, name = "Reins of the Cobalt Primordial Direhorn"},
                {id = 94229, name = "Reins of the Jade Primordial Direhorn"},
                {id = 94230, name = "Reins of the Amber Primordial Direhorn"},
                {id = 94231, name = "Reins of the Slate Primordial Direhorn"},
                {id = 93671, name = "Reins of the Crimson Primal Direhorn"},
            },
            ["Water Striders"] = {
                {id = 87791, name = "Reins of the Azure Water Strider"},
                {id = 89362, name = "Reins of the Crimson Water Strider"},
            },
            ["Yaks"] = {
                {id = 84101, name = "Reins of the Blonde Riding Yak"},
                {id = 84102, name = "Reins of the Grey Riding Yak"},
                {id = 89362, name = "Reins of the Grand Expedition Yak"},
            },
            ["Event Mounts"] = {
                {id = 37012, name = "The Horseman's Reins"},
                {id = 37719, name = "Swift Lovebird"},
                {id = 44178, name = "Reins of the Albino Drake"},
                {id = 73766, name = "Darkmoon Dancing Bear"},
            },
        },
    },

    -- ========================================================================
    -- LEGION LEGENDARIES
    -- ========================================================================
    LegionLegendaries = {
        category = "Legion Legendaries",
        icon = "Interface\\Icons\\INV_Misc_Gem_Bloodgem_01",
        subcategories = {
            ["Death Knight"] = {
                {id = 132365, name = "Instructor's Fourth Lesson"},
                {id = 132366, name = "Acherus Drapes"},
                {id = 132367, name = "Draugr, Girdle of the Everlasting King"},
                {id = 132376, name = "Shackles of Bryndaor"},
                {id = 132448, name = "Death March"},
                {id = 132453, name = "Rattlegore Bone Legplates"},
                {id = 132458, name = "Toravon's Whiteout Bindings"},
                {id = 132459, name = "Perseverance of the Ebon Martyr"},
                {id = 144280, name = "Soul of the Deathlord"},
                {id = 151640, name = "Cold Heart"},
            },
            ["Demon Hunter"] = {
                {id = 137014, name = "Achor, the Eternal Hunger"},
                {id = 137038, name = "Runemaster's Pauldrons"},
                {id = 137061, name = "Cloak of Fel Flames"},
                {id = 137071, name = "Delusions of Grandeur"},
                {id = 137090, name = "Mo'arg Bionic Stabilizers"},
                {id = 137091, name = "The Defiler's Lost Vambraces"},
                {id = 138949, name = "Kirel Narak"},
                {id = 138117, name = "Anger of the Half-Giants"},
                {id = 144279, name = "Soul of the Slayer"},
                {id = 151639, name = "Oblivion's Embrace"},
            },
            ["Druid"] = {
                {id = 132381, name = "Ekowraith, Creator of Worlds"},
                {id = 132409, name = "Promise of Elune, the Moon Goddess"},
                {id = 132410, name = "Oneth's Intuition"},
                {id = 137015, name = "Ailuro Pouncers"},
                {id = 137024, name = "Aman'Thul's Wisdom"},
                {id = 137025, name = "Tearstone of Elune"},
                {id = 137039, name = "Luffa Wrappings"},
                {id = 137040, name = "X'oni's Caress"},
                {id = 137062, name = "Fiery Red Maimers"},
                {id = 137067, name = "Essence of Infusion"},
                {id = 137092, name = "Skysec's Hold"},
                {id = 137094, name = "The Wildshaper's Clutch"},
                {id = 144242, name = "Soul of the Archdruid"},
                {id = 151783, name = "Behemoth Headdress"},
            },
            ["Hunter"] = {
                {id = 132466, name = "The Shadow Hunter's Voodoo Mask"},
                {id = 137064, name = "Qapla, Eredun War Order"},
                {id = 137080, name = "Roar of the Seven Lions"},
                {id = 137081, name = "War Belt of the Sentinel Army"},
                {id = 137082, name = "Call of the Wild"},
                {id = 137227, name = "Butcher's Bone Apron"},
                {id = 138140, name = "Magnetized Blasting Cap Launcher"},
                {id = 144326, name = "Soul of the Huntmaster"},
                {id = 151641, name = "Parsel's Tongue"},
            },
            ["Mage"] = {
                {id = 132406, name = "Marquee Bindings of the Sun King"},
                {id = 132413, name = "Cord of Infinity"},
                {id = 132442, name = "Belo'vir's Final Stand"},
                {id = 132454, name = "Koralon's Burning Touch"},
                {id = 132863, name = "Darckli's Dragonfire Diadem"},
                {id = 133970, name = "Zann'esu Journey"},
                {id = 133977, name = "Mantle of the First Kirin Tor"},
                {id = 137018, name = "Ice Time"},
                {id = 137019, name = "Mystic Kilt of the Rune Master"},
                {id = 144260, name = "Soul of the Archmage"},
            },
            ["Monk"] = {
                {id = 132378, name = "Cenedril, Reflector of Hatred"},
                {id = 132436, name = "Hidden Master's Forbidden Touch"},
                {id = 132444, name = "Leggings of the Black Flame"},
                {id = 132447, name = "Eye of Collidus the Warp-Watcher"},
                {id = 132510, name = "Ei'thas, Lunar Glides of Eramas"},
                {id = 137016, name = "Fundamental Observation"},
                {id = 137028, name = "Drinking Horn Cover"},
                {id = 137029, name = "Katsuo's Eclipse"},
                {id = 137057, name = "Unison Spaulders"},
                {id = 144239, name = "Soul of the Grandmaster"},
            },
            ["Paladin"] = {
                {id = 137046, name = "Whisper of the Nathrezim"},
                {id = 137047, name = "Heathcliff's Immortality"},
                {id = 137048, name = "Justice Gaze"},
                {id = 137065, name = "Tyelca, Ferren Marcus's Stature"},
                {id = 137070, name = "Maraad's Dying Breath"},
                {id = 137076, name = "Ilterendi, Crown Jewel of Silvermoon"},
                {id = 144273, name = "Soul of the Highlord"},
                {id = 144275, name = "Chain of Thrayn"},
                {id = 151644, name = "Pillars of Inmost Light"},
            },
            ["Priest"] = {
                {id = 132437, name = "Al'maiesh, the Cord of Hope"},
                {id = 132447, name = "The Twins' Painful Touch"},
                {id = 132449, name = "Mangaza's Madness"},
                {id = 132450, name = "Anund's Seared Shackles"},
                {id = 132457, name = "Mother Shahraz's Seduction"},
                {id = 132861, name = "Estel, Dejahna's Inspiration"},
                {id = 133800, name = "Zeks Exterminatus"},
                {id = 137022, name = "Inner Hallation"},
                {id = 137023, name = "Heart of the Void"},
                {id = 144244, name = "Soul of the High Priest"},
            },
            ["Rogue"] = {
                {id = 132357, name = "Insignia of Ravenholdt"},
                {id = 137021, name = "Thraxis Tricksy Treads"},
                {id = 137030, name = "Greenskin's Waterlogged Wristcuffs"},
                {id = 137031, name = "Mantle of the Master Assassin"},
                {id = 137032, name = "The Dreadlord's Deceit"},
                {id = 137049, name = "Will of Valeera"},
                {id = 137069, name = "Zoldyck Family Training Shackles"},
                {id = 137099, name = "Denial of the Half-Giants"},
                {id = 137100, name = "Shivarran Symmetry"},
                {id = 144236, name = "Soul of the Shadowblade"},
            },
            ["Shaman"] = {
                {id = 137035, name = "Emalon's Charged Core"},
                {id = 137036, name = "Uncertain Reminder"},
                {id = 137050, name = "Eye of the Twisting Nether"},
                {id = 137051, name = "Nobundo's Redemption"},
                {id = 137052, name = "Focuser of Jonat, the Elder"},
                {id = 137074, name = "Al'Akir's Acrimony"},
                {id = 137083, name = "Spiritual Journey"},
                {id = 137084, name = "Akainu's Absolute Justice"},
                {id = 137085, name = "Storm Tempests"},
                {id = 144258, name = "Soul of the Farseer"},
            },
            ["Warlock"] = {
                {id = 132357, name = "Odr, Shawl of the Ymirjar"},
                {id = 132369, name = "Wilfred's Sigil of Superior Summoning"},
                {id = 132374, name = "Feretory of Souls"},
                {id = 132375, name = "Streten's Sleepless Shackles"},
                {id = 132381, name = "Sindorei Spite"},
                {id = 132393, name = "Magistrike Restraints"},
                {id = 132394, name = "Hood of Eternal Disdain"},
                {id = 132456, name = "Power Cord of Lethtendris"},
                {id = 144385, name = "Wakener's Loyalty"},
            },
            ["Warrior"] = {
                {id = 132444, name = "Mannoroth's Bloodletting Manacles"},
                {id = 132453, name = "Destiny Driver"},
                {id = 137053, name = "Thundergod's Vigor"},
                {id = 137054, name = "Kazzalax, Fujieda's Fury"},
                {id = 137055, name = "Ayala's Stone Heart"},
                {id = 137060, name = "The Walls Fell"},
                {id = 137077, name = "Weight of the Earth"},
                {id = 137087, name = "Ceann-Ar Charger"},
                {id = 137088, name = "Naj'entus's Vertebrae"},
                {id = 144278, name = "Soul of the Battlelord"},
            },
            ["Shared Legendaries"] = {
                {id = 132443, name = "Prydaz, Xavaric's Magnum Opus"},
                {id = 132452, name = "Sephuz's Secret"},
                {id = 132455, name = "Norgannon's Foresight"},
                {id = 132378, name = "Aggramar's Stride"},
            },
        },
    },

    -- ========================================================================
    -- WEAPONS
    -- ========================================================================
    Weapons = {
        category = "Weapons",
        icon = "Interface\\Icons\\INV_Sword_04",
        subcategories = {
            ["Legendary Weapons"] = {
                {id = 17182, name = "Sulfuras, Hand of Ragnaros"},
                {id = 19019, name = "Thunderfury, Blessed Blade of the Windseeker"},
                {id = 22589, name = "Atiesh, Greatstaff of the Guardian"},
                {id = 32837, name = "Warglaive of Azzinoth (MH)"},
                {id = 32838, name = "Warglaive of Azzinoth (OH)"},
                {id = 34334, name = "Thori'dal, the Stars' Fury"},
                {id = 46017, name = "Val'anyr, Hammer of Ancient Kings"},
                {id = 49623, name = "Shadowmourne"},
                {id = 71086, name = "Dragonwrath, Tarecgosa's Rest"},
            },
        },
    },

    -- ========================================================================
    -- CONSUMABLES
    -- ========================================================================
    Consumables = {
        category = "Consumables",
        icon = "Interface\\Icons\\INV_Potion_54",
        subcategories = {
            ["Legion Flasks"] = {
                {id = 127847, name = "Flask of the Whispered Pact"},
                {id = 127848, name = "Flask of the Seventh Demon"},
                {id = 127849, name = "Flask of the Countless Armies"},
                {id = 127850, name = "Flask of Ten Thousand Scars"},
            },
            ["Legion Potions"] = {
                {id = 127843, name = "Potion of Prolonged Power"},
                {id = 127844, name = "Potion of the Old War"},
                {id = 127845, name = "Potion of Deadly Grace"},
                {id = 127846, name = "Unbending Potion"},
            },
        },
    },

    -- ========================================================================
    -- TRANSMOG: ICONIC WEAPONS
    -- ========================================================================
    TransmogWeapons = {
        category = "Transmog: Weapons",
        icon = "Interface\\Icons\\INV_Sword_39",
        subcategories = {
            ["Classic Raids"] = {
                {id = 19364, name = "Ashkandi, Greatsword of the Brotherhood"},
                {id = 18832, name = "Vis'kag the Bloodletter"},
                {id = 18208, name = "Brutality Blade"},
                {id = 17193, name = "Sulfuron Hammer"},
                {id = 19323, name = "Staff of the Shadow Flame"},
                {id = 17103, name = "Azuresong Mageblade"},
                {id = 11684, name = "Ironfoe"},
                {id = 18805, name = "Core Hound Tooth"},
                {id = 18816, name = "Perdition's Blade"},
                {id = 13080, name = "Dal'Rend's Sacred Charge"},
                {id = 13062, name = "Dal'Rend's Tribal Guardian"},
                {id = 19352, name = "Zin'rokh, Destroyer of Worlds"},
            },
            ["TBC Raids"] = {
                {id = 32837, name = "Warglaive of Azzinoth (MH)"},
                {id = 32838, name = "Warglaive of Azzinoth (OH)"},
                {id = 34334, name = "Thori'dal, the Stars' Fury"},
                {id = 30901, name = "Zhar'doom, Greatstaff of the Devourer"},
                {id = 28433, name = "Gressil, Dawn of Ruin"},
                {id = 28430, name = "Talon of Azzinoth"},
            },
            ["WotLK Raids"] = {
                {id = 49623, name = "Shadowmourne"},
                {id = 46017, name = "Val'anyr, Hammer of Ancient Kings"},
                {id = 50730, name = "Trauma"},
                {id = 47477, name = "Death's Bite"},
                {id = 40188, name = "Inevitable Defeat"},
                {id = 40384, name = "Last Laugh"},
            },
            ["Cata & MoP"] = {
                {id = 71086, name = "Dragonwrath, Tarecgosa's Rest"},
                {id = 77188, name = "Gurthalak, Voice of the Deeps"},
                {id = 78484, name = "Rathrak, the Poisonous Mind"},
            },
            ["All Legendaries"] = {
                {id = 17182, name = "Sulfuras, Hand of Ragnaros"},
                {id = 19019, name = "Thunderfury, Blessed Blade of the Windseeker"},
                {id = 22589, name = "Atiesh, Greatstaff of the Guardian"},
                {id = 32837, name = "Warglaive of Azzinoth (MH)"},
                {id = 32838, name = "Warglaive of Azzinoth (OH)"},
                {id = 34334, name = "Thori'dal, the Stars' Fury"},
                {id = 46017, name = "Val'anyr, Hammer of Ancient Kings"},
                {id = 49623, name = "Shadowmourne"},
                {id = 71086, name = "Dragonwrath, Tarecgosa's Rest"},
            },
        },
    },

    -- ========================================================================
    -- LEGION RAID GEAR
    -- One entry per item — same item ID regardless of difficulty.
    -- Use the Bonus ID row in the UI to control quality:
    --   None      = base ilvl (normal quality)
    --   Heroic    = bonus 569
    --   Mythic    = bonus 561
    --   Epic TF   = 561:3337  (mythic + titanforged = purple epic)
    -- Custom combos: e.g.  561:3337:40  (mythic + TF + socket)
    -- Reference: .add <itemID> <qty> <bonusID1>:<bonusID2>:...
    -- ========================================================================
    LegionRaidGear = {
        category = "Legion Raid Gear",
        icon = "Interface\\Icons\\Achievement_Dungeon_AntorNormal",
        subcategories = {

            -- ----------------------------------------------------------------
            -- EMERALD NIGHTMARE (EN, 7.0) - Verified IDs from WarcraftDB
            -- ----------------------------------------------------------------
            ["EN: Early Bosses"] = {
                -- Nythendra (Boss 1)
                {id = 139321, name = "Swarming Plaguehive (Nythendra)"},
                {id = 139320, name = "Ravaged Seed Pod (Nythendra)"},
                {id = 139250, name = "Unwaking Slumber (Nythendra)"},
                {id = 139249, name = "Shaladrassil's Blossom (Nythendra)"},
                {id = 139252, name = "Preserved Worldseed (Nythendra)"},
                {id = 139251, name = "Despoiled Dragonscale (Nythendra)"},
                {id = 139212, name = "Creeping String of Larva (Nythendra)"},
                {id = 139236, name = "Grubby Silver Ring (Nythendra)"},
                -- Il'gynoth (Boss 2)
                {id = 139259, name = "Cube of Malice (Il'gynoth)"},
                {id = 139324, name = "Goblet of Nightmarish Ichor (Il'gynoth)"},
                {id = 139258, name = "Radiating Metallic Shard (Il'gynoth)"},
                {id = 139256, name = "Sloshing Core of Hatred (Il'gynoth)"},
                {id = 139257, name = "Gore-Drenched Fetish (Il'gynoth)"},
                {id = 139326, name = "Wriggling Sinew (Il'gynoth)"},
                {id = 139325, name = "Spontaneous Appendages (Il'gynoth)"},
                {id = 139237, name = "Dreadful Cyclopean Signet (Il'gynoth)"},
                -- Elerethe Renferal (Boss 3)
                {id = 139253, name = "Fel-Bloated Venom Sac (Elerethe)"},
                {id = 139322, name = "Cocoon of Enforced Solitude (Elerethe)"},
                {id = 139254, name = "Shrieking Bloodstone (Elerethe)"},
                {id = 139255, name = "Scything Quill (Elerethe)"},
                {id = 139323, name = "Twisting Wind (Elerethe)"},
                {id = 138221, name = "Gossamer-Spun Greatcloak (Elerethe)"},
                -- Ursoc (Boss 4)
                {id = 139260, name = "Bloodied Bear Fang (Ursoc)"},
                {id = 139261, name = "Tuft of Ironfur (Ursoc)"},
                {id = 139327, name = "Unbridled Fury (Ursoc)"},
                {id = 139329, name = "Bloodthirsty Instinct (Ursoc)"},
                {id = 139328, name = "Ursoc's Rending Paw (Ursoc)"},
                {id = 139330, name = "Heightened Senses (Ursoc)"},
                {id = 139239, name = "Cursed Beartooth Necklace (Ursoc)"},
            },
            ["EN: Cenarius + Xavius"] = {
                -- Dragons of Nightmare (Boss 5)
                {id = 138225, name = "Phantasmal Echo (Dragons)"},
                {id = 138227, name = "Entrancing Stone (Dragons)"},
                {id = 138228, name = "Bioluminescent Mushroom (Dragons)"},
                {id = 138226, name = "Nightmare Engulfed Jewel (Dragons)"},
                {id = 138222, name = "Vial of Nightmare Fog (Dragons)"},
                {id = 138224, name = "Unstable Horrorslime (Dragons)"},
                {id = 138220, name = "Mindrend Band (Dragons)"},
                -- Cenarius (Boss 6)
                {id = 139333, name = "Horn of Cenarius (Cenarius)"},
                {id = 139334, name = "Nature's Call (Cenarius)"},
                {id = 139263, name = "Blessing of Cenarius (Cenarius)"},
                {id = 139264, name = "Uplifting Emerald (Cenarius)"},
                {id = 139265, name = "Radiant Dragon Egg (Cenarius)"},
                {id = 139248, name = "Evergreen Vinewrap Drape (Cenarius)"},
                {id = 139211, name = "Laughing Sister's Pouch-Chain (Cenarius)"},
                -- Xavius (Boss 7 - Final)
                {id = 139335, name = "Grotesque Statuette (Xavius)"},
                {id = 139269, name = "Crystallized Drop of Eternity (Xavius)"},
                {id = 139266, name = "Fragment of Eternal Spite (Xavius)"},
                {id = 139267, name = "Azsharan Councillor's Clasp (Xavius)"},
                {id = 139238, name = "Twice-Warped Azsharan Signet (Xavius)"},
                {id = 139332, name = "Blackened Portalstone Necklace (Xavius)"},
                {id = 139336, name = "Bough of Corruption (Xavius)"},
                {id = 139268, name = "Nightmarish Elm Branch (Xavius)"},
            },

            -- ----------------------------------------------------------------
            -- TRIAL OF VALOR (ToV, 7.1) - Verified IDs from WarcraftDB
            -- ----------------------------------------------------------------
            ["ToV: Odyn + Guarm"] = {
                -- Odyn (Boss 1)
                {id = 142519, name = "Favor of the Prime Designate (Odyn)"},
                {id = 142511, name = "Unforged Titansteel (Odyn)"},
                {id = 142508, name = "Chains of the Valorous (Odyn)"},
                {id = 142514, name = "Ravens' Sight (Odyn)"},
                {id = 142520, name = "Ring of Ascended Glory (Odyn)"},
                -- Guarm (Boss 2)
                {id = 142512, name = "Accursed Cuspid (Guarm)"},
                {id = 142516, name = "Sizzling Fang (Guarm)"},
                {id = 142515, name = "Chilled Incisor (Guarm)"},
                {id = 142506, name = "Eye of Guarm (Guarm)"},
            },
            ["ToV: Helya (Final)"] = {
                {id = 142507, name = "Brinewater Slime in a Bottle"},
                {id = 142513, name = "Token of the Lightning Keeper"},
                {id = 142510, name = "Phylactery of Unwilling Servitude"},
                {id = 142518, name = "Fury of the Sea"},
                {id = 142517, name = "Swell of the Tides"},
                {id = 142521, name = "Drape of the Unworthy"},
                {id = 142416, name = "Strand of Whelk Shells"},
                {id = 142428, name = "Sea Fan Pendant"},
            },

            -- ----------------------------------------------------------------
            -- NIGHTHOLD (NH, 7.1.5) - Verified IDs from Wowhead/WarcraftDB
            -- Trinkets, rings, necks, cloaks organized by boss
            -- ----------------------------------------------------------------
            ["NH: Skorpyron-Trilliax"] = {
                -- Skorpyron (Boss 1)
                {id = 140789, name = "Animated Exoskeleton (Skorpyron)"},
                {id = 140790, name = "Claw of the Crystalline Scorpid (Skorpyron)"},
                {id = 140898, name = "Radiant String of Scorpid Eyes (Skorpyron)"},
                -- Chronomatic Anomaly (Boss 2)
                {id = 140791, name = "Royal Dagger Haft (Chrono Anomaly)"},
                {id = 140792, name = "Erratic Metronome (Chrono Anomaly)"},
                {id = 140821, name = "Precipice of Eternity (Chrono Anomaly)"},
                {id = 140831, name = "Suspended Nightwell Droplet (Chrono Anomaly)"},
                {id = 140843, name = "Flickering Timespark (Chrono Anomaly)"},
                {id = 140894, name = "Zealous Timestone Pendant (Chrono Anomaly)"},
                -- Trilliax (Boss 3)
                {id = 140793, name = "Perfectly Preserved Cake (Trilliax)"},
                {id = 140794, name = "Arcanogolem Digit (Trilliax)"},
                {id = 140812, name = "Soggy Manascrubber Brush (Trilliax)"},
                {id = 140818, name = "Foreign Contaminant (Trilliax)"},
                {id = 140838, name = "Construct Personality Sphere (Trilliax)"},
            },
            ["NH: Aluriel-Elisande"] = {
                -- Spellblade Aluriel (Boss 4)
                {id = 140795, name = "Aluriel's Mirror (Spellblade Aluriel)"},
                {id = 140796, name = "Entwined Elemental Foci (Aluriel)"},
                {id = 140813, name = "Arcana Crux (Spellblade Aluriel)"},
                {id = 140832, name = "Heart of Frost (Spellblade Aluriel)"},
                {id = 140834, name = "Soul of Flame (Spellblade Aluriel)"},
                {id = 140895, name = "Spellblade's Gemmed Signet (Aluriel)"},
                -- High Botanist Tel'arn (Boss 5)
                {id = 140801, name = "Fury of the Burning Sky (High Botanist)"},
                {id = 140802, name = "Nightblooming Frond (High Botanist)"},
                {id = 140822, name = "Breath of Dusk (High Botanist)"},
                {id = 140836, name = "Sunflare Coal (High Botanist)"},
                {id = 140839, name = "Parasitic Spore (High Botanist)"},
                {id = 140896, name = "Ring of Braided Stems (High Botanist)"},
                -- Tichondrius (Boss 6)
                {id = 140797, name = "Fang of Tichondrius (Tichondrius)"},
                {id = 140798, name = "Icon of Rot (Tichondrius)"},
                {id = 140819, name = "Vampiric Fetish (Tichondrius)"},
                {id = 140824, name = "Writ of Subjugation (Tichondrius)"},
                {id = 140844, name = "Archaic Nathrezim Keepsake (Tichondrius)"},
                {id = 140906, name = "Ring of Exclusive Servitude (Tichondrius)"},
                -- Krosus (Boss 7)
                {id = 140799, name = "Might of Krosus (Krosus)"},
                {id = 140800, name = "Pharamere's Forbidden Grimoire (Krosus)"},
                {id = 140899, name = "Beleron's Choker of Misery (Krosus)"},
                -- Star Augur Etraeus (Boss 8)
                {id = 140803, name = "Etraeus' Celestial Map (Star Augur)"},
                {id = 140804, name = "Star Gate (Star Augur)"},
                {id = 140900, name = "Brooch of the Astral Scryer (Star Augur)"},
                {id = 140909, name = "Astromancer's Greatcloak (Star Augur)"},
                -- Grand Magistrix Elisande (Boss 9)
                {id = 140805, name = "Ephemeral Paradox (Elisande)"},
                {id = 140806, name = "Convergence of Fates (Elisande)"},
                {id = 140810, name = "Farsight Spiritjewel (Elisande)"},
            },
            ["NH: Gul'dan (Final)"] = {
                {id = 140807, name = "Infernal Contract"},
                {id = 140808, name = "Draught of Souls"},
                {id = 140809, name = "Whispers in the Dark"},
                {id = 140817, name = "Lionshead Lapel Clasp"},
                {id = 140897, name = "Ring of the Scoured Clan"},
                {id = 140919, name = "High Shadow Councilor's Wrap"},
                {id = 137574, name = "Living Infernal Core (Mount)"},
            },

            -- ----------------------------------------------------------------
            -- TOMB OF SARGERAS (ToS, 7.2.5) - Verified IDs from WarcraftDB
            -- ----------------------------------------------------------------
            ["ToS: Early Bosses"] = {
                -- Goroth (Boss 1)
                {id = 147009, name = "Infernal Cinders (Goroth)"},
                {id = 147022, name = "Feverish Carapace (Goroth)"},
                {id = 147076, name = "Charred Hymnal of the Moon (Goroth)"},
                {id = 147084, name = "Imploding Infernal Star (Goroth)"},
                {id = 147104, name = "Icon of Perverse Animation (Goroth)"},
                {id = 147108, name = "Brand of Relentless Agony (Goroth)"},
                {id = 147112, name = "Felsoul Vortex (Goroth)"},
                {id = 146984, name = "Cloak of Stifling Brimstone (Goroth)"},
                -- Demonic Inquisition (Boss 2)
                {id = 147003, name = "Barbaric Mindslaver (Demonic Inquisition)"},
                {id = 147010, name = "Cradle of Anguish (Demonic Inquisition)"},
                {id = 147077, name = "Inexorable Truth Serum (Demonic Inquisition)"},
                {id = 147080, name = "Blood of the Unworthy (Demonic Inquisition)"},
                {id = 147088, name = "Smoldering Thumbscrews (Demonic Inquisition)"},
                {id = 147096, name = "Inquisition's Master Key (Demonic Inquisition)"},
                {id = 147013, name = "String of Extracted Incisors (Demonic Inquisition)"},
                -- Harjatan (Boss 3)
                {id = 147002, name = "Charm of the Rising Tide (Harjatan)"},
                {id = 147092, name = "Ice-Threaded Conch (Harjatan)"},
                {id = 147100, name = "Calcified Barnacle (Harjatan)"},
                {id = 147109, name = "Harjatan's Leering Eye (Harjatan)"},
                {id = 147020, name = "Scaled Band of Servitude (Harjatan)"},
                -- Mistress Sassz'ine (Boss 4)
                {id = 147004, name = "Sea Star of the Depthmother (Sassz'ine)"},
                {id = 147011, name = "Vial of Ceaseless Toxins (Sassz'ine)"},
                {id = 147023, name = "Leviathan's Hunger (Sassz'ine)"},
                {id = 147081, name = "Pungent Chum (Sassz'ine)"},
                {id = 147085, name = "Mutated Nautilus (Sassz'ine)"},
                {id = 147093, name = "Globe of Frothing Eddies (Sassz'ine)"},
                {id = 147113, name = "Flawless Hurricane Pearl (Sassz'ine)"},
                {id = 146985, name = "Shroud of the Drowned Adherent (Sassz'ine)"},
            },
            ["ToS: Final Bosses"] = {
                -- Sisters of the Moon (Boss 5)
                {id = 147005, name = "Chalice of Moonlight (Sisters)"},
                {id = 147012, name = "Umbral Moonglaives (Sisters)"},
                {id = 147017, name = "Tarnished Sentinel Medallion (Sisters)"},
                {id = 147078, name = "Mote of Astral Suffusion (Sisters)"},
                {id = 147089, name = "Ferocity of the Devout (Sisters)"},
                {id = 147097, name = "Blessing of the White Lady (Sisters)"},
                {id = 147101, name = "Chiseled Starlight (Sisters)"},
                {id = 147114, name = "Preserved Starlight Incense (Sisters)"},
                {id = 147021, name = "Yathae's Thumb Ring (Sisters)"},
                -- The Desolate Host (Boss 6)
                {id = 147018, name = "Spectral Thurible (Desolate Host)"},
                {id = 147024, name = "Reliquary of the Damned (Desolate Host)"},
                {id = 147086, name = "Befouled Effigy of Elune (Desolate Host)"},
                {id = 147106, name = "Glowing Prayer Candle (Desolate Host)"},
                {id = 147014, name = "Locket of Splintered Souls (Desolate Host)"},
                -- Maiden of Vigilance (Boss 7)
                {id = 147015, name = "Engine of Eradication (Maiden)"},
                {id = 147025, name = "Recompiled Guardian Module (Maiden)"},
                {id = 147090, name = "Stabilized Extinction Protocol (Maiden)"},
                {id = 147094, name = "Virus of Lethargy (Maiden)"},
                {id = 147098, name = "Fragment of Grace (Maiden)"},
                {id = 147115, name = "Unfurling Origination (Maiden)"},
                {id = 147194, name = "Band of Rescinded Truths (Maiden)"},
                -- Fallen Avatar (Boss 8)
                {id = 147006, name = "Archive of Faith (Fallen Avatar)"},
                {id = 147091, name = "Cleansing Ignition Catalyst (Fallen Avatar)"},
                {id = 147107, name = "Valorous Spark of Hope (Fallen Avatar)"},
                {id = 147193, name = "Cape of Mindless Fury (Fallen Avatar)"},
                -- Kil'jaeden (Boss 9)
                {id = 147007, name = "The Deceiver's Grand Design (Kil'jaeden)"},
                {id = 147019, name = "Tome of Unraveling Sanity (Kil'jaeden)"},
                {id = 147026, name = "Shifting Cosmic Sliver (Kil'jaeden)"},
                {id = 147082, name = "Man'ari Blood Pact (Kil'jaeden)"},
                {id = 147087, name = "Ruinous Ashes (Kil'jaeden)"},
                {id = 147095, name = "Sphere of Entropy (Kil'jaeden)"},
                {id = 147099, name = "Boon of the Prophet (Kil'jaeden)"},
                {id = 147195, name = "Seal of the Second Duumvirate (Kil'jaeden)"},
            },

            -- ----------------------------------------------------------------
            -- ANTORUS THE BURNING THRONE (ABT, 7.3) - Verified IDs
            -- ----------------------------------------------------------------
            ["ABT: Early Bosses"] = {
                -- Garothi Worldbreaker (Boss 1)
                {id = 151956, name = "Garothi Feedback Conduit (Garothi)"},
                {id = 152028, name = "Spurting Reaver Heart (Garothi)"},
                {id = 152031, name = "Doomfire Dynamo (Garothi)"},
                {id = 152036, name = "Hellfire Ignition Switch (Garothi)"},
                {id = 152039, name = "Viscous Reaver-Coolant (Garothi)"},
                {id = 151937, name = "Cloak of the Burning Vanguard (Garothi)"},
                -- Felhounds of Sargeras (Boss 2)
                {id = 152027, name = "Gravitational Condensate (Felhounds)"},
                {id = 152056, name = "Corrupting Dewclaw (Felhounds)"},
                -- Antoran High Command (Boss 3)
                {id = 151957, name = "Ishkar's Felshield Emitter (High Command)"},
                {id = 151969, name = "Terminus Signaling Beacon (High Command)"},
                {id = 152043, name = "Lightshield Amplifier (High Command)"},
                {id = 152295, name = "Svirax's Grim Trophy (High Command)"},
                -- Portal Keeper Hasabel (Boss 4)
                {id = 151958, name = "Tarratus Keystone (Portal Keeper)"},
                {id = 152035, name = "Blazing Dreadsteed Horseshoe (Portal Keeper)"},
                {id = 152041, name = "Sublimating Portal Frost (Portal Keeper)"},
                {id = 152049, name = "Fel-Engraved Handbell (Portal Keeper)"},
                {id = 152057, name = "Crepuscular Skitterer Egg (Portal Keeper)"},
                {id = 152063, name = "Seal of the Portalmaster (Portal Keeper)"},
                {id = 151965, name = "Vulcanarcore Pendant (Portal Keeper)"},
                -- Eonar the Life-Binder (Boss 5)
                {id = 151970, name = "Vitality Resonator (Eonar)"},
                {id = 152044, name = "Spark of Everburning Light (Eonar)"},
                {id = 152047, name = "Ironvine Thorn (Eonar)"},
                {id = 152054, name = "Unwavering Soul Essence (Eonar)"},
                {id = 152061, name = "Droplets of the Cleansing Storm (Eonar)"},
                {id = 152688, name = "Loop of the Life-Binder (Eonar)"},
                -- Imonar the Soulhunter (Boss 6)
                {id = 152024, name = "Fallen Magi's Seerstone (Imonar)"},
                {id = 152042, name = "Hoarfrost-Beast Talon (Imonar)"},
                {id = 152045, name = "Venerated Puresoul Idol (Imonar)"},
                {id = 152050, name = "Mysterious Petrified Egg (Imonar)"},
                -- Kin'garoth (Boss 7)
                {id = 151955, name = "Acrid Catalyst Injector (Kin'garoth)"},
                {id = 152034, name = "Obliterator Propellant (Kin'garoth)"},
                {id = 152048, name = "Decimator Crankshaft (Kin'garoth)"},
                {id = 152051, name = "Eidolon of Life (Kin'garoth)"},
                {id = 152055, name = "Kin'garoth's Oil-Sump (Kin'garoth)"},
                {id = 152064, name = "Band of the Sargerite Smith (Kin'garoth)"},
            },
            ["ABT: Varimathras-Aggramar"] = {
                -- Varimathras (Boss 8)
                {id = 151960, name = "Carafe of Searing Light (Varimathras)"},
                {id = 152025, name = "Thu'rayan Lash (Varimathras)"},
                {id = 152037, name = "Tormentor's Brand (Varimathras)"},
                {id = 152060, name = "Neuroshock Electrode (Varimathras)"},
                {id = 152092, name = "Nathrezim Incisor (Varimathras)"},
                {id = 151964, name = "Seeping Scourgewing (Varimathras)"},
                {id = 151966, name = "Riveted Choker of Delirium (Varimathras)"},
                -- Coven of Shivarra (Boss 9)
                {id = 152040, name = "Frigid Gloomstone (Coven of Shivarra)"},
                {id = 152046, name = "Coven Prayer Bead (Coven of Shivarra)"},
                {id = 152058, name = "Stormcaller's Fury (Coven of Shivarra)"},
                {id = 152289, name = "Highfather's Machination (Coven of Shivarra)"},
                {id = 152284, name = "Zealous Tormentor's Ring (Coven of Shivarra)"},
                -- Aggramar (Boss 10)
                {id = 152026, name = "Prototype Titan-Disc (Aggramar)"},
                {id = 152033, name = "Sliver of Corruption (Aggramar)"},
                {id = 152038, name = "Pyretic Bronze Clasp (Aggramar)"},
                {id = 152052, name = "Spolemound Seedling (Aggramar)"},
                {id = 152062, name = "Greatcloak of the Dark Pantheon (Aggramar)"},
                {id = 152093, name = "Gorshalach's Legacy (Aggramar - Fire Sword)"},
                {id = 152094, name = "Taeshalach (Aggramar - 2H Fire Sword)"},
            },
            ["ABT: Argus (Final)"] = {
                -- Pantheon Trinkets (one per spec role)
                {id = 154172, name = "Aman'Thul's Vision"},
                {id = 154173, name = "Aggramar's Conviction"},
                {id = 154174, name = "Golganneth's Vitality"},
                {id = 154175, name = "Eonar's Compassion"},
                {id = 154176, name = "Khaz'goroth's Courage"},
                {id = 154177, name = "Norgannon's Prowess"},
                -- Other drops
                {id = 151972, name = "Sullied Seal of the Pantheon"},
                {id = 152283, name = "Chain of the Unmaker"},
                {id = 153115, name = "Scythe of the Unmaker (Polearm)"},
            },
        },
    },
}

-- Create a flat searchable index
-- catKey is stored so tabs can scope their searches to their own categories only.
GMC_SearchIndex = {}

local function BuildSearchIndex()
    for catKey, catData in pairs(GMC_ItemDB) do
        if catData.subcategories then
            for subCatName, items in pairs(catData.subcategories) do
                for _, item in ipairs(items) do
                    table.insert(GMC_SearchIndex, {
                        id         = item.id,
                        name       = item.name,
                        category   = catData.category,
                        catKey     = catKey,
                        subcategory = subCatName,
                        searchName = string.lower(item.name),
                    })
                end
            end
        end
    end
    print("|cff00ccff[GM Commander]|r Indexed " .. #GMC_SearchIndex .. " items")
end

BuildSearchIndex()
