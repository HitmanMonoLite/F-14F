local function drag_index_to_Cx(index)
    return (index / 12.0) * (5.0 / 4096.0)
end

declare_loadout({
    category        = CAT_BOMBS,
    CLSID           = "{BRU-32 GBU_31_V_2B}",
    Picture         = "GBU31.png",
    displayName     = _("GBU-31(V)2/B - JDAM, 2000lb GPS Guided Bomb"),
    Weight_Empty    = 57.38,
    Weight          = 57.38 + 934,
    wsTypeOfWeapon  = "weapons.bombs.GBU_31_V_2B",
    attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
    Count           = 1,
    Cx_pil          = drag_index_to_Cx(12),
    Cx_item         = drag_index_to_Cx(10),
    settings        = Get_Combined_GUISettings_Preset("MDRN_B_A_PGM_TWINWELL_USN"),
    Elements = {
        { ShapeName = "HB_F14_EXT_BRU34", IsAdapter = true },
        { ShapeName = "GBU-31", connector_name = "WEP_BRU-34_MK84" },
    },
})

declare_loadout({
    category        = CAT_BOMBS,
    CLSID           = "{BRU-32 GBU_31_V_4B}",
    Picture         = "GBU-31V3B.png",
    displayName     = _("GBU-31(V)4/B - JDAM, 2000lb GPS Guided Penetrator Bomb"),
    Weight_Empty    = 57.38,
    Weight          = 57.38 + 970,
    wsTypeOfWeapon  = "weapons.bombs.GBU_31_V_4B",
    attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
    Count           = 1,
    Cx_pil          = drag_index_to_Cx(12),
    Cx_item         = drag_index_to_Cx(10),
    settings        = Get_Combined_GUISettings_Preset("MDRN_B_A_PGM_HTP_USN"),
    Elements = {
        { ShapeName = "HB_F14_EXT_BRU34", IsAdapter = true },
        { ShapeName = "GBU31_V_3B_BLU109", connector_name = "WEP_BRU-34_MK84" },
    },
})

local BOMB_TYPES = {
    {
        key      = "S",
        name     = "GBU-31(V)2/B",
        picture  = "GBU31.png",
        mass     = 934,
        shape    = "GBU-31",
        wsType   = "weapons.bombs.GBU_31_V_2B",
        settings = "MDRN_B_A_PGM_TWINWELL_USN",
    },
    {
        key      = "P",
        name     = "GBU-31(V)4/B",
        picture  = "GBU-31V3B.png",
        mass     = 970,
        shape    = "GBU31_V_3B_BLU109",
        wsType   = "weapons.bombs.GBU_31_V_4B",
        settings = "MDRN_B_A_PGM_HTP_USN",
    },
}

local CONFIGS = {
    { key = "RS", connectors = { "BRU-42_LEFT", "BRU-42_RIGHT", "BRU-42_LOWER" } },
    { key = "LS", connectors = { "BRU-42_LEFT", "BRU-42_LOWER" } },
}

local BRU42_MASS = 128
local BRU34_MASS = 57.38
local BRU42_CX   = 0.0005
local BRU34_CX   = 0.00002
local PHX_CX     = 0.0001
local CX_ITEM    = drag_index_to_Cx(10)

for _, bomb in ipairs(BOMB_TYPES) do
    for _, cfg in ipairs(CONFIGS) do
        local n         = #cfg.connectors
        local disp      = n .. " " .. bomb.name
        local bru42_cls = "{BRU42_GBU-31" .. bomb.key .. " " .. cfg.key .. "}"
        local bru34_cls = "{BRU3242_GBU-31" .. bomb.key .. " " .. cfg.key .. "}"
        local phx_cls   = "{PHXBRU3242_GBU-31" .. bomb.key .. " " .. cfg.key .. "}"

        local elements42 = { { ShapeName = "HB_F14_EXT_BRU42", IsAdapter = true } }
        for _, conn in ipairs(cfg.connectors) do
            elements42[#elements42 + 1] = { ShapeName = bomb.shape, connector_name = conn }
        end

        declare_loadout({
            category        = CAT_BOMBS,
            CLSID           = bru42_cls,
            Picture         = bomb.picture,
            displayName     = disp,
            Weight_Empty    = BRU42_MASS,
            Weight          = BRU42_MASS + n * bomb.mass,
            wsTypeOfWeapon  = bomb.wsType,
            attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
            Count           = n,
            Cx_pil          = BRU42_CX + n * CX_ITEM,
            Cx_item         = CX_ITEM,
            settings        = Get_Combined_GUISettings_Preset(bomb.settings),
            Elements        = elements42,
        })

        declare_loadout({
            category        = CAT_BOMBS,
            CLSID           = bru34_cls,
            Picture         = bomb.picture,
            displayName     = disp,
            Weight          = BRU34_MASS + BRU42_MASS + n * bomb.mass,
            wsTypeOfWeapon  = bomb.wsType,
            attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
            Count           = n,
            Cx_pil          = BRU34_CX + BRU42_CX + n * CX_ITEM,
            Cx_item         = CX_ITEM,
            JettisonSubmunitionOnly = true,
            settings        = Get_Combined_GUISettings_Preset(bomb.settings),
            Elements = {
                { ShapeName = "HB_F14_EXT_BRU34", IsAdapter = true },
                { payload_CLSID = bru42_cls, connector_name = "WEP_BRU-34_BRU-42" },
            },
        })

        declare_loadout({
            category        = CAT_BOMBS,
            CLSID           = phx_cls,
            Picture         = bomb.picture,
            displayName     = disp,
            Weight          = BRU34_MASS + BRU42_MASS + n * bomb.mass,
            wsTypeOfWeapon  = bomb.wsType,
            attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
            Count           = n,
            Cx_pil          = PHX_CX + BRU34_CX + BRU42_CX + n * CX_ITEM,
            Cx_item         = CX_ITEM,
            JettisonSubmunitionOnly = true,
            settings        = Get_Combined_GUISettings_Preset(bomb.settings),
            Elements = {
                { ShapeName = "HB_F14_EXT_SHOULDER_PHX_L", IsAdapter = true },
                { payload_CLSID = bru34_cls, connector_name = "WEP_Phoenix_Connector" },
            },
        })
    end
end