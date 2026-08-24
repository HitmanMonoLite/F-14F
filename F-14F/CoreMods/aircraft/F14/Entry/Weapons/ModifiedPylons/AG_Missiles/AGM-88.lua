local function lau_118_f14(clsid, weapon_info, left, right, bottom, attach_offset)
    local lau_118_mass = 61
    local lvl2 = weapon_info.level2
    if type(weapon_info.wsType)=="table" then
        lvl2 = weapon_info.wsType[2]
    end
    local ret = {
        category            = weapon_info.category,
        CLSID               = clsid,
        Picture             = weapon_info.picture,
        attribute           = {wsType_Weapon, lvl2, wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil              = 0.001,
        Elements            = {}
    }
    if type(weapon_info.wsType)=="table" and weapon_info.wsType[4] ~= nil then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    if type(weapon_info.wsType)=="string" then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName = "lau-118a", IsAdapter = true }
    local sz = 0
    if left then
        sz = sz + 1
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name = "Point01"}
        if (attach_offset ~= nil) then
            ret.Elements[#ret.Elements].attach_point_position = attach_offset
        end
    end
    if right then
        sz = sz + 1
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name = "Point01"}
        if (attach_offset ~= nil) then
            ret.Elements[#ret.Elements].attach_point_position = attach_offset
        end
    end
    if bottom then
        sz = sz + 1
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name = "Point01"}
        if (attach_offset ~= nil) then
            ret.Elements[#ret.Elements].attach_point_position = attach_offset
        end
    end

    ret.Count  = sz
    ret.Weight = lau_118_mass + sz * weapon_info.mass
    ret.Cx_pil = ret.Cx_pil + sz * weapon_info.Cx

    if sz > 1 then
        ret.displayName = sz .. " " .. weapon_info.name
    else
        ret.displayName = weapon_info.name
    end
    declare_loadout(ret)
    return ret
end

local function harm_adapter_nested(clsid, nested_loadout, position_offset, rotation_offset)
    local harm_adapter_mass = 0.001
    local ret = {
        category            = nested_loadout.category,
        CLSID               = clsid,
        Picture             = nested_loadout.Picture,
        attribute           = {wsType_Weapon, nested_loadout.attribute[2], wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil              = 0.001,
        JettisonSubmunitionOnly = true,
        Elements            = {}
    }
    if nested_loadout.wsTypeOfWeapon ~= nil then
        ret.wsTypeOfWeapon = nested_loadout.wsTypeOfWeapon
    end
    if (position_offset == nil) then
        position_offset = {0, -0.085, 0}
    end
    if (rotation_offset == nil) then
        rotation_offset = {0, 0, 1.6}
    end
    
    ret.Elements[#ret.Elements + 1] = { ShapeName = "HB_F14_EXT_LANTIRN_PYLON", IsAdapter = true }
    ret.Elements[#ret.Elements + 1] = {payload_CLSID = nested_loadout.CLSID, Position = position_offset, Rotation = rotation_offset}
    ret.Count  = nested_loadout.Count
    ret.Weight = harm_adapter_mass + nested_loadout.Weight
    ret.Cx_pil = ret.Cx_pil + nested_loadout.Cx_pil
    ret.displayName = nested_loadout.displayName
    declare_loadout(ret)
    return ret
end

local f14_agm88 = {
    category = CAT_MISSILES,
    level2 = wsType_Missile,
    name = "AGM-88 HARM",
    payload_CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C9C}",
    mass = 361,
    wsType = {wsType_Weapon, wsType_Missile, wsType_AS_Missile, 65},
    Cx = 4 / 4096.0,
    ShapeName = "agm-88",
    picture = "agm88.png"
}

harm_adapter_nested("{SHOULDER_AGM_88}", lau_118_f14("{LAU_118_HARM_F14}", f14_agm88, true, false, false))