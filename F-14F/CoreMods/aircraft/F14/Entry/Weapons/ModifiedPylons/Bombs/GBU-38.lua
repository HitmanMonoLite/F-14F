-- Store drag index -> DCS Cx. Index 12 matches the original AIM-54 station value (5/4096).
-- Cx_pil = drag of the whole loaded station, Cx_item = per-item delta subtracted on release.
local function drag_index_to_Cx(index)
    return (index / 12.0) * (5.0 / 4096.0)
end

declare_loadout(
{
    category = CAT_BOMBS,
    CLSID   =   "{BRU-32 GBU-38}",
    Picture =   "GBU38.png",
    displayName     = _("GBU-38(V)1/B - JDAM, 500lb GPS Guided Bomb"),
    Weight_Empty = 57.38,   -- 100lbs+26.5lbs
    Weight  = 57.38 + 241,  -- see jdam.lua
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_38},
    attribute      = {wsType_Weapon,wsType_Bomb,wsType_Container,WSTYPE_PLACEHOLDER},
    Count = 1,
    Cx_pil = drag_index_to_Cx(7), -- est. (Mk-82 = 6 + JDAM kit)
    Cx_item = drag_index_to_Cx(5),
    settings        = Get_Combined_GUISettings_Preset("MDRN_B_A_PGM_TWINWELL"),

    Elements    =
    {
        { ShapeName = "HB_F14_EXT_BRU34" ,IsAdapter  =   true  },  -- combination ADU-703 & BRU-32
        {
            ShapeName   =   "GBU-38",
            connector_name =  "WEP_BRU-34_MK82",
            --use_full_connector_position = true,
        },
    }, -- end of Elements
})

local gbu38_connectors = {
    "POINT_PYLON_06",
    "POINT_PYLON_01",
    "POINT_PYLON_04",
    "POINT_PYLON_02",
    "POINT_PYLON_05",
    "POINT_PYLON_03"
}

local gbu38_elements = {
    { ShapeName = "HB_ORD_MER", IsAdapter = true }
}
for _, conn in ipairs(gbu38_connectors) do
    table.insert(gbu38_elements, {
        DrawArgs = {[1] = {1,1}, [2] = {2,1}},
        connector_name = conn,
        ShapeName = "GBU-38"
    })
end

declare_loadout({
    category        = CAT_BOMBS,
    CLSID           = "{GBU-38_MER_6x}",
    Picture         = "GBU38.png",
    displayName     = _("GBU-38(V)6/B - JDAM, 500lb GPS Guided Bomb"),
    Weight_Empty    = 57.38,
    Weight          = 57.38 + 241,
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_38},
    attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
    Count           = 6,
    Cx_pil          = drag_index_to_Cx(7),
    Cx_item         = drag_index_to_Cx(5),
    settings        = Get_Combined_GUISettings_Preset("MDRN_B_A_PGM_TWINWELL"),
    Elements        = gbu38_elements,
})