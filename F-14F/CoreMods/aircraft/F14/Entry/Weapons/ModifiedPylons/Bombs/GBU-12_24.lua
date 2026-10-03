-- Store drag index -> DCS Cx. Index 12 matches the original AIM-54 station value (5/4096).
-- Cx_pil = drag of the whole loaded station, Cx_item = per-item delta subtracted on release.
local function drag_index_to_Cx(index)
    return (index / 12.0) * (5.0 / 4096.0)
end

declare_loadout(
{
    category = CAT_BOMBS,
    CLSID   =   "{BRU33_2X_GBU-12}",
    Picture =   "GBU12.png",
    displayName =   _("GBU-12*2"),
    Weight_Empty = 57.38,   -- 100lbs+26.5lbs
    Weight  = 57.38 + 275,  -- see db_weapons_data.lua
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_12},
    attribute      = {wsType_Weapon,wsType_Bomb,wsType_Container,WSTYPE_PLACEHOLDER},
    Count = 1,
    Cx_pil = 0.00002,
    Cx_item = 0.000569, -- see bombs_data.lua

    Elements    =
    {
        { ShapeName = "HB_F14_EXT_BRU34" ,IsAdapter  =   true  },  -- combination ADU-703 & BRU-32
        {
            ShapeName   =   "GBU-12",
            connector_name =  "WEP_BRU-34_MK82",
            --use_full_connector_position = true,
        },
    }, -- end of Elements
})

-- declare_loadout(
-- {
--     category = CAT_BOMBS,
--     CLSID   =   "{BRU-32 GBU-12}",
--     Picture =   "GBU12.png",
--     displayName =   _("GBU-12"),
--     Weight_Empty = 57.38,   -- 100lbs+26.5lbs
--     Weight  = 57.38 + 275,  -- see db_weapons_data.lua
--     wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_12},
--     attribute      = {wsType_Weapon,wsType_Bomb,wsType_Container,WSTYPE_PLACEHOLDER},
--     Count = 1,
--     Cx_pil = drag_index_to_Cx(8), -- est. (Mk-82 = 6 + Paveway II kit)
--     Cx_item = drag_index_to_Cx(6),
--     settings = Get_Combined_GUISettings_Preset("Paveway_II"),

--     Elements    =
--     {
--         { ShapeName = "HB_F14_EXT_BRU34" ,IsAdapter  =   true  },  -- combination ADU-703 & BRU-32
--         {
--             ShapeName   =   "GBU-12",
--             connector_name =  "WEP_BRU-34_MK82",
--             --use_full_connector_position = true,
--         },
--     }, -- end of Elements
-- })

local gbu12_bomb = {
    category        = CAT_BOMBS,
    payload_CLSID   = "{BRU-32 GBU-12}",
    picture         = "GBU12.png",
    name            = "GBU-12",
    mass            = 227,
    Weight_Empty    = 57.38,
    Weight          = 57.38 + 275,
    wsType          = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_12},
    attribute       = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
    Cx              = 0.00002,
    ShapeName       = "GBU12",
}

local gbu24_bomb = {
    category        = CAT_BOMBS,
    payload_CLSID   = "{BRU-32 GBU-24}",
    picture         = "GBU27.png", -- TODO: need GBU24.png ?
    name            = "GBU-24",
    mass            = 934,
    Weight_Empty    = 57.38,
    Weight          = 57.38 + 1050,
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_24},
    attribute       = {wsType_Weapon,wsType_Bomb,wsType_Container,WSTYPE_PLACEHOLDER},
    Cx              = 0.000027,
    ShapeName       = "GBU-24",
}

local function bru_42_3x_bomb(clsid,weapon_info,left,right,bottom,attach_offset)

    local bru_42_mass = 128
    local lvl2 = weapon_info.level2
    if type(weapon_info.wsType)=="table" then
      lvl2 = weapon_info.wsType[2]
    end
    local ret = {
        category            =   weapon_info.category,
        CLSID               =   clsid,
        Picture             =   weapon_info.picture,
        attribute           =   {wsType_Weapon, lvl2,   wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil              =   0.0005,
        Elements            = { },
        settings = weapon_info.settings
    }
    if weapon_info.ejectVelocity then
        ret.ejectVelocity = weapon_info.ejectVelocity
    end
    if weapon_info.ejectDirection then
        ret.ejectDirection = weapon_info.ejectDirection
    end
    if weapon_info.ejectPitchRate then
        ret.ejectPitchRate = weapon_info.ejectPitchRate
    end
    if type(weapon_info.wsType)=="table" and weapon_info.wsType[4] ~= nil then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    if type(weapon_info.wsType)=="string" then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName   = "HB_F14_EXT_BRU42",IsAdapter  =   true}
    local sz = 0
    if left then
        sz = sz + 1
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name =  "BRU-42_LEFT"}
        if (attach_offset ~= nil) then
          ret.Elements[#ret.Elements].attach_point_position = attach_offset
        end
    end
    if right then
        sz = sz + 1
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name =  "BRU-42_RIGHT"}
        if (attach_offset ~= nil) then
          ret.Elements[#ret.Elements].attach_point_position = attach_offset
        end
    end
    if bottom then
        sz = sz + 1
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name =  "BRU-42_LOWER"}
        if (attach_offset ~= nil) then
          ret.Elements[#ret.Elements].attach_point_position = attach_offset
        end
    end

    ret.Count  = sz
    ret.Weight = bru_42_mass +  sz * weapon_info.mass

    ret.Cx_pil = ret.Cx_pil + sz * weapon_info.Cx

    if sz > 1 then
        ret.displayName =   sz.." "..weapon_info.name
    else
        ret.displayName =   weapon_info.name
    end
    declare_loadout(ret)
    return ret
end

local function bru_32_nested(clsid,nested_loadout)
    local adu_703_bru_32_mass = 57.38

    local lvl2 = wsType_Missile
    if type(nested_loadout.attribute)=="table" then
      lvl2 = nested_loadout.attribute[2]
    end
    local ret = {
        category            =   nested_loadout.category,
        CLSID               =   clsid,
        Picture             =   nested_loadout.Picture,
        attribute           =   {wsType_Weapon, lvl2,   wsType_Container,   WSTYPE_PLACEHOLDER},
        Cx_pil              =   0.00002, -- TODO: what is reasonable?
        JettisonSubmunitionOnly = true,
        Elements            = { },
        settings = nested_loadout.settings
    }
    if nested_loadout.ejectVelocity then
        ret.ejectVelocity = nested_loadout.ejectVelocity
    end
    if nested_loadout.ejectDirection then
        ret.ejectDirection = nested_loadout.ejectDirection
    end
    if nested_loadout.ejectPitchRate then
        ret.ejectPitchRate = nested_loadout.ejectPitchRate
    end
    if nested_loadout.wsTypeOfWeapon ~= nil then
        ret.wsTypeOfWeapon = nested_loadout.wsTypeOfWeapon
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName   = "HB_F14_EXT_BRU34", IsAdapter  =   true  }
    ret.Elements[#ret.Elements + 1] = {payload_CLSID = nested_loadout.CLSID, connector_name = "WEP_BRU-34_BRU-42"}
    ret.Count  = nested_loadout.Count
    ret.Weight = adu_703_bru_32_mass + nested_loadout.Weight

    ret.Cx_pil = ret.Cx_pil + nested_loadout.Cx_pil

    --ret.displayName = _("BRU-32 ")..nested_loadout.displayName
    ret.displayName =   nested_loadout.displayName
    declare_loadout(ret)
    return ret
end

local function phx_adapter_nested(clsid,nested_loadout)
    local phx_adapter_mass = 0 -- TODO
    local ret = {
        category            =   nested_loadout.category,
        CLSID               =   clsid,
        Picture             =   nested_loadout.Picture,
        attribute           =   {wsType_Weapon, nested_loadout.attribute[2],    wsType_Container,   WSTYPE_PLACEHOLDER},
        Cx_pil              =   0.0001, -- TODO: what is reasonable?
        JettisonSubmunitionOnly = true,
        Elements            = {
        },
        settings = nested_loadout.settings
    }
    if nested_loadout.wsTypeOfWeapon ~= nil then
        ret.wsTypeOfWeapon      =   nested_loadout.wsTypeOfWeapon
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName   = "HB_F14_EXT_SHOULDER_PHX_L", IsAdapter  =   true  }
    ret.Elements[#ret.Elements + 1] = {payload_CLSID = nested_loadout.CLSID, connector_name = "WEP_Phoenix_Connector"}
    ret.Count  = nested_loadout.Count
    ret.Weight = phx_adapter_mass + nested_loadout.Weight


    ret.Cx_pil = ret.Cx_pil + nested_loadout.Cx_pil

    --ret.displayName = _("PHX ")..nested_loadout.displayName
    ret.displayName =   nested_loadout.displayName
    declare_loadout(ret)
    return ret
end

-- GBU-12 на BRU-42
phx_adapter_nested("{PHXBRU3242_GBU-12 RS}", bru_32_nested("{BRU3242_GBU-12 RS}", bru_42_3x_bomb("{BRU42_GBU-12 RS}", gbu12_bomb, false, true, true)))
phx_adapter_nested("{PHXBRU3242_GBU-12 LS}", bru_32_nested("{BRU3242_GBU-12 LS}", bru_42_3x_bomb("{BRU42_GBU-12 LS}", gbu12_bomb, true, false, true)))
phx_adapter_nested("{PHXBRU3242_3*GBU-12 AS}", bru_32_nested("{BRU3242_3*GBU-12 AS}", bru_42_3x_bomb("{BRU42_3*GBU-12 AS}", gbu12_bomb, true, true, true)))
phx_adapter_nested("{PHXBRU3242_3*GBU-24 AS}", bru_32_nested("{BRU3242_3*GBU-24 AS}", bru_42_3x_bomb("{BRU42_3*GBU-24 AS}", gbu24_bomb, true, true, true)))
-- phx_adapter_nested("{PHXBRU3242_3*GBU-12 LS}", bru_32_nested("{BRU3242_3*GBU-12 LS}", bru_42_3x_bomb("{BRU42_3*GBU-12 LS}", gbu12_bomb, true, true, true)))