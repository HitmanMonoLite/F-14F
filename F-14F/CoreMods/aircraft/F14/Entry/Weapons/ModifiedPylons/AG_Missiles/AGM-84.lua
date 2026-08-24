local f14_agm_84d = {
    category        = CAT_MISSILES,
    level2          = wsType_Missile,
    name            = "AGM-84D Harpoon Anti-Ship Missile",
    payload_CLSID   = "{AGM_84D}",
    mass            = 540,
    wsType          = "weapons.missiles.AGM_84D",
    Cx              = 8.0/4096.0,
    picture         = "agm84d.png",
    ShapeName       = "agm-84d",
}

local function bru_32_single(clsid, weapon_info, attach_offset)
    local bru_32_mass = 57.38
    local lvl2 = weapon_info.level2
    if type(weapon_info.wsType)=="table" then
        lvl2 = weapon_info.wsType[2]
    end
    local ret = {
        category            = weapon_info.category,
        CLSID               = clsid,
        Picture             = weapon_info.picture,
        attribute           = {wsType_Weapon, lvl2, wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil              = 0.00002,
        Elements            = {}
    }
    if type(weapon_info.wsType)=="table" and weapon_info.wsType[4] ~= nil then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    if type(weapon_info.wsType)=="string" then
        ret.wsTypeOfWeapon = weapon_info.wsType
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName = "HB_F14_EXT_BRU34", IsAdapter = true }
    if (attach_offset == nil) then
        attach_offset = {0.0, 0.0, 0}
    end
    local sz = 1
    if (sz == 1) then
        ret.Elements[#ret.Elements + 1] = {ShapeName = weapon_info.ShapeName, connector_name = "WEP_BRU-34_MK84", attach_point_position = attach_offset}
    end

    ret.Count  = sz
    ret.Weight = bru_32_mass + sz * weapon_info.mass
    ret.displayName = "BRU-32 with " .. weapon_info.name
    declare_loadout(ret)
    return ret
end

local function phx_adapter_nested(clsid, nested_loadout)
    local phx_adapter_mass = 0
    local ret = {
        category            = nested_loadout.category,
        CLSID               = clsid,
        Picture             = nested_loadout.Picture,
        attribute           = {wsType_Weapon, nested_loadout.attribute[2], wsType_Container, WSTYPE_PLACEHOLDER},
        Cx_pil              = 0.0001,
        JettisonSubmunitionOnly = true,
        Elements            = {}
    }
    if nested_loadout.wsTypeOfWeapon ~= nil then
        ret.wsTypeOfWeapon = nested_loadout.wsTypeOfWeapon
    end
    ret.Elements[#ret.Elements + 1] = { ShapeName = "HB_F14_EXT_SHOULDER_PHX_L", IsAdapter = true }
    ret.Elements[#ret.Elements + 1] = {payload_CLSID = nested_loadout.CLSID, connector_name = "WEP_Phoenix_Connector"}
    ret.Count  = nested_loadout.Count
    ret.Weight = phx_adapter_mass + nested_loadout.Weight
    ret.Cx_pil = ret.Cx_pil + nested_loadout.Cx_pil
    ret.displayName = nested_loadout.displayName
    declare_loadout(ret)
    return ret
end

phx_adapter_nested("{SHOULDER_AGM_84D}", bru_32_single("{BRU32_AGM_84D}", f14_agm_84d, nil))