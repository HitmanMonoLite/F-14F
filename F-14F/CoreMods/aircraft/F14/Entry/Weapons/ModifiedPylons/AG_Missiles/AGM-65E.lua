local f14_agm65e = {
    category = CAT_MISSILES,
    level2 = wsType_Missile,
    name = "AGM-65E - Maverick E (Laser ASM - Lg Whd)",
    payload_CLSID = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EF}",
    mass = 292.0,
    wsType = "weapons.missiles.AGM_65E",
    Cx = 4 / 4096.0, -- bombs_data.lua
--  Cx_pil = 4, -- bombs_data.lua
    ShapeName = "agm-65e",
    picture = "agm65.png"
}

local function lau_88_maverick_f14(clsid, weapon_info, position_offset, count, left)

    count = count or 1
    left = left or false
    
    local lau_88_mass = 53.0
    local lau_88_drag = 0.001
    local agm_65_drag_on_pilon = 1.7 / 4096  -- AGM_65_CX_PIL / 4096

    local lvl2 = weapon_info.level2
    if type(weapon_info.wsType) == "table" then
        lvl2 = weapon_info.wsType[2]
    end

    local ret = {
        category = weapon_info.category,
        CLSID = clsid,
        Picture = weapon_info.picture,
        attribute = {wsType_Weapon, lvl2, wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil = lau_88_drag + agm_65_drag_on_pilon * count,
        Cx_item = agm_65_drag_on_pilon,
        Count = count,
        Weight = lau_88_mass + count * weapon_info.mass,
        displayName = string.format("LAU-88 - %d x %s", count, weapon_info.name),
        Elements = { { ShapeName = "LAU-88" } }
    }

    if type(weapon_info.wsType) == "table" and weapon_info.wsType[4] ~= nil then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    if type(weapon_info.wsType) == "string" then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end

    local positions = {
        {0.29, -0.31, 0},
        {0.29, -0.085, 0.275},
        {0.29, -0.085, -0.275}
    }
    local rotations = {
        {0, 0, 0},
        {-90, 0, 0},
        {90, 0, 0}
    }

    local use_left = left and count == 2
    for i = 1, count do
        local j = i
        if i == 2 and use_left then
            j = 3
        end
        ret.Elements[#ret.Elements + 1] = {
            Position = positions[j],
            ShapeName = weapon_info.ShapeName,
            Rotation = rotations[j]
        }
    end

    declare_loadout(ret)
    return ret
end

local function lau_117_maverick_f14(clsid,weapon_info, position_offset)
    
    local lau_117_mass = 53.0
    local lvl2 = weapon_info.level2
    if type(weapon_info.wsType)=="table" then
      lvl2 = weapon_info.wsType[2]
    end
    local ret = {
        category            =   weapon_info.category,
        CLSID               =   clsid,
        Picture             =   weapon_info.picture,
        attribute           =   {wsType_Weapon, lvl2,   wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil              =   (0.00025 + 0.0009765625),
        Elements            = { }
    }
    if type(weapon_info.wsType)=="table" and weapon_info.wsType[4] ~= nil then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    if type(weapon_info.wsType)=="string" then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName   = "LAU-117",IsAdapter  =   true}
    local sz = 1
    if (position_offset == nil) then
        position_offset = {0.18,    -0.078, 0}
    end
    if (sz == 1) then
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, Position  =   position_offset}
    end

    ret.Count  = sz
    ret.Weight = lau_117_mass + sz * weapon_info.mass

    ret.displayName =   "LAU-117 with "..weapon_info.name
    declare_loadout(ret)
    return ret
end

local function phx_adapter_nested(clsid,nested_loadout)
    local phx_adapter_mass = 0
    local ret = {
        category            =   nested_loadout.category,
        CLSID               =   clsid,
        Picture             =   nested_loadout.Picture,
        attribute           =   {wsType_Weapon, nested_loadout.attribute[2],    wsType_Container,   WSTYPE_PLACEHOLDER},
        Cx_pil              =   0.0001,
        JettisonSubmunitionOnly = true,
        Elements            = {
        }
    }
    if nested_loadout.wsTypeOfWeapon ~= nil then
        ret.wsTypeOfWeapon      =   nested_loadout.wsTypeOfWeapon
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName   = "HB_F14_EXT_SHOULDER_PHX_L", IsAdapter  =   true,  }
    ret.Elements[#ret.Elements + 1] = {payload_CLSID = nested_loadout.CLSID, connector_name = "WEP_Phoenix_Connector",}
    ret.Count  = nested_loadout.Count
    ret.Weight = phx_adapter_mass + nested_loadout.Weight


    ret.Cx_pil = ret.Cx_pil + nested_loadout.Cx_pil

    --ret.displayName = _("PHX ")..nested_loadout.displayName
    ret.displayName =   nested_loadout.displayName
    declare_loadout(ret)
    return ret
end


lau_88_maverick_f14("LAU_88_AGM_65L_3", f14_agm65e, nil, 3, false)

phx_adapter_nested("{SHOULDER_LAU_117_AGM_65E}", lau_117_maverick_f14("{F14_LAU_117_AGM_65E}", f14_agm65e, nil))
phx_adapter_nested("{SHOULDER_LAU_88_AGM_65E}", lau_88_maverick_f14("LAU_88_AGM_65L_3", f14_agm65e, nil, 3, false))
phx_adapter_nested("{SHOULDER_LAU_88_AGM_65E_R}", lau_88_maverick_f14("LAU_88_AGM-65L_2_R", f14_agm65e, nil, 2, false))
phx_adapter_nested("{SHOULDER_LAU_88_AGM_65E_L}", lau_88_maverick_f14("LAU_88_AGM-65L_2_L", f14_agm65e, nil, 2, true))


-- lau_88_maverick_f14("LAU_88_AGM-65L_2_R", f14_agm65e, nil, 2, false)
-- lau_88_maverick_f14("LAU_88_AGM-65L_2_L", f14_agm65e, nil, 2, true)