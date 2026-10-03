local KtsToMPS = 0.51444;
local FtToM = 0.3048;
local InToM = 0.0254;
local LbfToN = 4.44822;
local LbToKg = 0.453592;

local pylon_1A,pylon_1B,pylon_2,pylon_3,pylon_4,pylon_5,pylon_6,pylon_7,pylon_8B,pylon_8A = 1,2,3,4,5,6,7,8,9,10

function add_f14b_weapons(pylons)

    if pylons[pylon_1A] and pylons[pylon_1A].Launchers then

        local launchers = pylons[pylon_1A].Launchers
        local new_weapons = {

            { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, -- AIM-9X
            { CLSID = "{AIM-132_ASRAAM}", attach_point_position = {-0.14, 0, 0} }, -- AIM-132 ASRAAM
            { CLSID = "{A-DARTER}", attach_point_position = {-0.5, 0, 0} }, -- A-DARTER
            { CLSID = "{IRIS-T_IR}", attach_point_position = {-0.22, 0, 0} }, -- IRIS-T IR

        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end

    end

    if pylons[pylon_1B] and pylons[pylon_1B].Launchers then

        local launchers = pylons[pylon_1B].Launchers
        local new_weapons = {

            --{ CLSID = "DIS_LD-10_DUAL_L",connector="WEP_Fuel_Pylon_L" }, -- LD-10_2
            { CLSID = "{SHOULDER AIM-174B}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.25, 0.01, -0.011} }, -- AIM-174B
            { CLSID = "{SHOULDER AIM-152HRM}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.25, 0.01, -0.011} }, -- AIM-152_HRM
            { CLSID = "{SHOULDER AIM-152GDW}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.245, -0.40, 0.005} }, -- AIM-152_GDW
            { CLSID = "{SHOULDER AIM-152GDW IR}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.245, -0.40, 0.005} }, -- AIM-152_GDW-IR
            { CLSID = "{AIM260Ax4}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.1, -0.04, 0.01} }, -- AIM-260a

            { CLSID = "{SHOULDER_AGM_84D}", connector = "WEP_PhoenixWingPylon_L" }, -- AGM-84D

            { CLSID = "{LAU-131x3 - 7 AGR-20 M282}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {0.44, 0, 0.005} }, -- APKWS
            { CLSID = "{SHOULDER_BRIMSTONE_6x}", connector = "WEP_PhoenixWingPylon_L"}, -- BRIMSTONE
            { CLSID = "{SHOULDER_LAU_117_AGM_65E}", connector = "WEP_PhoenixWingPylon_L"}, -- AGM-65E
            { CLSID = "{SHOULDER_LAU_88_AGM_65E_R}", connector = "WEP_PhoenixWingPylon_L"}, -- AGM-65L*2
            { CLSID = "{SHOULDER_LAU_88_AGM_65E}", connector = "WEP_PhoenixWingPylon_L"}, -- AGM-65L*3

            -- { CLSID = "GBU-12x6", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.44, 0.2, 0.005} }, -- GBU-12x6
            { CLSID = "{PHXBRU3242_GBU-12 LS}", connector = "WEP_PhoenixWingPylon_L"}, -- GBU-12*2
            { CLSID = "{PHXBRU3242_3*GBU-12 AS}", connector = "WEP_PhoenixWingPylon_L"}, -- GBU-12*3
            { CLSID = "{PHXBRU3242_3*GBU-24 AS}", connector = "WEP_PhoenixWingPylon_L"}, -- GBU-24*3

            { CLSID = "{GBU-39-ARB}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.44, 0.2, 0.005} }, -- GBU-39

            { CLSID = "{SHOULDER_AGM_88}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {-0.245, -0.03, 0.005} }, -- HARM
            { CLSID = "{KH31PD*2L}", connector = "WEP_PhoenixWingPylon_L", attach_point_position = {0.54, 0.1, 0.005}, forbidden = {

                {station = pylon_7, loadout = {"{F14-950gal-empty}"}},
                {station = pylon_7, loadout = {"{F14-950gal}"}},
                {station = pylon_7, loadout = {"{F14-300gal-empty}"}},
                {station = pylon_7, loadout = {"{F14-300gal}"}},
                {station = pylon_7, loadout = {"{F14-2400gal-empty}"}},
                {station = pylon_7, loadout = {"{F14-2400gal}"}},
                {station = pylon_2, loadout = {"{F14-950gal-empty}"}},
                {station = pylon_2, loadout = {"{F14-950gal}"}},
                {station = pylon_2, loadout = {"{F14-300gal-empty}"}},
                {station = pylon_2, loadout = {"{F14-300gal}"}},
                {station = pylon_2, loadout = {"{F14-2400gal-empty}"}},
                {station = pylon_2, loadout = {"{F14-2400gal}"}},
                
            }}, -- KH-31P
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end

    end

    if pylons[pylon_2] and pylons[pylon_2].Launchers then

        local launchers = pylons[pylon_2].Launchers
        local new_tanks = {

            { CLSID = "{F14-950gal}", 

                forbidden = {
                    {station = pylon_7, loadout = {"{KH31PD*2L}"}},
                },
                required = {
                    {station = pylon_7,loadout = {"{F14-950gal}"}},
                },

            },
            { CLSID = "{F14-2400gal}",

                forbidden = {
                    {station = pylon_7, loadout = {"{KH31PD*2L}"}},
                },
                required = {
                    {station = pylon_7,loadout = {"{F14-2400gal}"}},
                },

            },
        }

        for _, tank in ipairs(new_tanks) do
            table.insert(launchers, tank)
        end

    end

    if pylons[pylon_3] and pylons[pylon_3].Launchers then

        local launchers = pylons[pylon_3].Launchers
        local new_weapons = {

            { CLSID = "{AGM_84D}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- AGM-84D
            { CLSID = "{KH31PD}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- KH-31

            { CLSID = "{LAU-131x3 - 7 AGR-20 M282}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- APKWS
            { CLSID = "LAU_117_AGM_65L", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- AGM_65L
            { CLSID = "LAU_88_AGM_65L_3", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- AGM_65L*3
            { CLSID = "{BRIMSTONE}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- BRIMSTONE

            { CLSID = "{GBU-39-ARB}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- GBU-39

            { CLSID = "{RN-24}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- RN-24

            { CLSID = "BRU-42_3*GBU-12", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- GBU-12*3
            { CLSID = "{BRU33_2X_GBU-12}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- GBU-12*2
            { CLSID = "{PHXBRU3242_GBU-24 LS}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- GBU-24*2

            { CLSID = "{AIM260Ax4}", arg = 601, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_L", Cx_gain = 0.57 }, -- AIM-260A
            {
                CLSID = "{BELLY_AIM-174B_LEFT}",
                arg = 601,
                arg_value = 0,
                connector = "WEP_Phoenix_FrontPallette_L",
                attach_point_position = {0,-0.2,0},
                Cx_gain = 0.125,
            },
            {
                CLSID = "{BELLY_AIM-152HRM_LEFT}",
                arg = 601,
                arg_value = 0,
                connector = "WEP_Phoenix_FrontPallette_L",
                attach_point_position = {0,-0.2,0},
                Cx_gain = 0.125,
                forbidden = {
                    {station = pylon_4, loadout = {"{BELLY REAR AIM-152GDW}"}},
                    {station = pylon_5, loadout = {"{BELLY REAR AIM-152GDW}"}},
                    {station = pylon_6, loadout = {"{BELLY AIM-152GDW}"}}
                }
            },
            {
                CLSID = "{BELLY AIM-152GDW}",
                arg = 600,
                arg_value = 1,
                Type = 0,
                connector = "WEP_PhoenixRails_Front",
                attach_point_position = {-0.5, 0.19, -0.375},
                forbidden = {
                    {station = pylon_4, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_5, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_6, loadout = {"{BELLY AIM-152HRM}"}},
                }
            },
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end

    end

    if pylons[pylon_4] and pylons[pylon_4].Launchers then

        local launchers = pylons[pylon_4].Launchers
        local new_weapons = {

            { CLSID = "{AGM_84D}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- AGM-84D
            { CLSID = "{KH31PD}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- KH-31

            -- { CLSID = "{LAU-131x3 - 7 AGR-20 M282}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- APKWS
            -- { CLSID = "LAU_117_AGM_65L", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- AGM_65L
            -- { CLSID = "LAU_88_AGM_65L_3", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- AGM_65L*3
            { CLSID = "{BRIMSTONE}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- BRIMSTONE

            { CLSID = "{GBU-39-ARB}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- GBU-39

            { CLSID = "{RN-24}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- RN-24

            { CLSID = "BRU-42_3*GBU-12", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- GBU-12*3
            { CLSID = "{BRU33_2X_GBU-12}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- GBU-12*2
            { CLSID = "{PHXBRU3242_GBU-24 LS}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57 }, -- GBU-24*2


            { CLSID = "{AIM260Ax6}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_RearPallette_L", Cx_gain = 0.57, attach_point_position = {-1.1,0,0} }, -- AIM-260A
            {
                CLSID = "{BELLY_AIM-174B_LEFT}",
                arg = 603,
                arg_value = 0,
                connector = "WEP_Phoenix_RearPallette_L",
                attach_point_position = {-0.5,-0.2,0},
                Cx_gain = 0.7,
            },
            {
                CLSID = "{BELLY_AIM-152HRM_LEFT}",
                arg = 603,
                arg_value = 0,
                connector = "WEP_Phoenix_RearPallette_L",
                attach_point_position = {0,-0.2,0},
                Cx_gain = 0.7,
                forbidden = {
                    {station = pylon_3, loadout = {"{BELLY AIM-152GDW}"}},
                    {station = pylon_5, loadout = {"{BELLY REAR AIM-152GDW}"}},
                    {station = pylon_6, loadout = {"{BELLY AIM-152GDW}"}}
                }
            },
            {
                CLSID = "{BELLY REAR AIM-152GDW}",
                arg = 600,
                arg_value = 1,
                Type = 0,
                connector = "WEP_PhoenixRails_Rear",
                attach_point_position = {0.1, 0.15, -0.375},
                forbidden = {
                    {station = pylon_3, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_5, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_6, loadout = {"{BELLY AIM-152HRM}"}}
                }
            },
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end

    end

    if pylons[pylon_5] and pylons[pylon_5].Launchers then

        local launchers = pylons[pylon_5].Launchers
        local new_weapons = {

            { CLSID = "{AGM_84D}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- AGM-84D
            { CLSID = "{KH31PD}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- KH-31

            -- { CLSID = "{LAU-131x3 - 7 AGR-20 M282}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- APKWS
            -- { CLSID = "LAU_117_AGM_65L", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- AGM_65L
            -- { CLSID = "LAU_88_AGM-65L_2_R", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- AGM_65L*2
            { CLSID = "{BRIMSTONE}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- BRIMSTONE

            { CLSID = "{GBU-39-ARB}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- GBU-39

            { CLSID = "{RN-24}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- RN-24

            { CLSID = "BRU-42_3*GBU-12", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- GBU-12*3
            { CLSID = "{BRU33_2X_GBU-12}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- GBU-12*2
            { CLSID = "{PHXBRU3242_GBU-24 RS}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57 }, -- GBU-24*3


            { CLSID = "{AIM260Ax6}", arg = 604, arg_value = 0, connector = "WEP_Phoenix_RearPallette_R", Cx_gain = 0.57, attach_point_position = {-1.1,0,0} }, -- AIM-260A
            {
                CLSID = "{BELLY_AIM-174B_RIGHT}",
                arg = 604,
                arg_value = 0,
                connector = "WEP_Phoenix_RearPallette_R",
                attach_point_position = {-0.5,-0.2,0},
                Cx_gain = 0.7,
            },
            {
                CLSID = "{BELLY_AIM-152HRM_RIGHT}",
                arg = 604,
                arg_value = 0,
                connector = "WEP_Phoenix_RearPallette_R",
                attach_point_position = {0,-0.2,0},
                Cx_gain = 0.7,
                forbidden = {
                    {station = pylon_3, loadout = {"{BELLY AIM-152GDW}"}},
                    {station = pylon_4, loadout = {"{BELLY REAR AIM-152GDW}"}},
                    {station = pylon_6, loadout = {"{BELLY AIM-152GDW}"}}
                }
            },
            {
                CLSID = "{BELLY REAR AIM-152GDW}",
                arg = 600,
                arg_value = 1,
                Type = 0,
                connector = "WEP_PhoenixRails_Rear",
                attach_point_position = {0.1, 0.15, 0.375},
                forbidden = {
                    {station = pylon_3, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_4, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_6, loadout = {"{BELLY AIM-152HRM}"}}
                }
            },
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end

    end

    if pylons[pylon_6] and pylons[pylon_6].Launchers then

        local launchers = pylons[pylon_6].Launchers
        local new_weapons = {

            { CLSID = "{AGM_84D}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- AGM-84D
            { CLSID = "{KH31PD}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- KH-31

            { CLSID = "{LAU-131x3 - 7 AGR-20 M282}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- APKWS
            { CLSID = "LAU_117_AGM_65L", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- AGM_65L
            { CLSID = "LAU_88_AGM-65L_2_R", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- AGM_65L*2
            { CLSID = "{BRIMSTONE}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- BRIMSTONE

            { CLSID = "{GBU-39-ARB}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- GBU-39

            { CLSID = "{RN-24}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- RN-24

            { CLSID = "BRU-42_3*GBU-12", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- GBU-12*3
            { CLSID = "{BRU33_2X_GBU-12}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- GBU-12*2
            { CLSID = "{PHXBRU3242_GBU-24 RS}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- GBU-24*3

            { CLSID = "{AIM260Ax4}", arg = 602, arg_value = 0, connector = "WEP_Phoenix_FrontPallette_R", Cx_gain = 0.57 }, -- AIM-260A
            {
                CLSID = "{BELLY_AIM-174B_RIGHT}",
                arg = 602,
                arg_value = 0,
                connector = "WEP_Phoenix_FrontPallette_R",
                attach_point_position = {0,-0.2,0},
                Cx_gain = 0.125,
            },
            {
                CLSID = "{BELLY_AIM-152HRM_RIGHT}",
                arg = 602,
                arg_value = 0,
                connector = "WEP_Phoenix_FrontPallette_R",
                attach_point_position = {0,-0.2,0},
                Cx_gain = 0.125,
                forbidden = {
                    {station = pylon_3, loadout = {"{BELLY AIM-152GDW}"}},
                    {station = pylon_4, loadout = {"{BELLY REAR AIM-152GDW}"}},
                    {station = pylon_5, loadout = {"{BELLY REAR AIM-152GDW}"}}
                }
            },
            {
                CLSID = "{BELLY AIM-152GDW}",
                arg = 600,
                arg_value = 1,
                Type = 0,
                connector = "WEP_PhoenixRails_Front",
                attach_point_position = {-0.5, 0.19, 0.375},
                forbidden = {
                    {station = pylon_3, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_4, loadout = {"{BELLY AIM-152HRM}"}},
                    {station = pylon_5, loadout = {"{BELLY AIM-152HRM}"}}
                }
            },
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end
    end

    if pylons[pylon_7] and pylons[pylon_7].Launchers then

        local launchers = pylons[pylon_7].Launchers
        local new_tanks = {

            { CLSID = "{F14-950gal}", 

                forbidden = {
                    {station = pylon_2, loadout = {"{KH31PD*2R}"}},
                },
                required = {
                    {station = pylon_2,loadout = {"{F14-950gal}"}},
                },

            }, -- Fuel tank 950 gal

            { CLSID = "{F14-2400gal}",

                forbidden = {
                    {station = pylon_2, loadout = {"{KH31PD*2R}"}},
                },
                required = {
                    {station = pylon_2,loadout = {"{F14-2400gal}"}},
                },

            }, -- Fuel tank 2400 gal

        }

        for _, tank in ipairs(new_tanks) do
            table.insert(launchers, tank)
        end
    end

    if pylons[pylon_8B] and pylons[pylon_8B].Launchers then

        local launchers = pylons[pylon_8B].Launchers
        local new_weapons = {

            { CLSID = "{SHOULDER AIM-174B}", connector = "WEP_Shoulder_Sparrow_R", attach_point_position = {-0.015, 0, 0} }, -- AIM-174B
            { CLSID = "{SHOULDER AIM-152HRM}", connector = "WEP_Shoulder_Sparrow_R", attach_point_position = {-0.015, 0, 0} }, -- AIM-152_HRM
            { CLSID = "{SHOULDER AIM-152GDW}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {-0.245, -0.40, 0.005} }, -- AIM-152_GDW
            { CLSID = "{SHOULDER AIM-152GDW IR}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {-0.245, -0.40, 0.005} }, -- AIM-152_GDW-IR
            { CLSID = "{AIM260Ax4}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {-0.1, -0.04, 0.01} }, -- AIM-260a
            
            { CLSID = "{SHOULDER_AGM_84D}", connector = "WEP_PhoenixWingPylon_R" }, -- AGM-84D

            { CLSID = "{LAU-131x3 - 7 AGR-20 M282}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {0.44, 0, 0.005} }, -- APKWS
            { CLSID = "{SHOULDER_BRIMSTONE_6x}", connector = "WEP_PhoenixWingPylon_R"}, -- BRIMSTONE
            { CLSID = "{SHOULDER_LAU_117_AGM_65E}", connector = "WEP_PhoenixWingPylon_R"}, -- AGM-65E
            { CLSID = "{SHOULDER_LAU_88_AGM_65E_L}", connector = "WEP_PhoenixWingPylon_R"}, -- AGM-65L*2
            { CLSID = "{SHOULDER_LAU_88_AGM_65E}", connector = "WEP_PhoenixWingPylon_R"}, -- AGM-65L*3

            -- { CLSID = "GBU-12x6", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {-0.44, 0.2, 0.005} }, -- GBU-12x6
            { CLSID = "{PHXBRU3242_GBU-12 RS}", connector = "WEP_PhoenixWingPylon_R"}, -- GBU-12*2
            { CLSID = "{PHXBRU3242_3*GBU-12 AS}", connector = "WEP_PhoenixWingPylon_R"}, -- GBU-12*3
            { CLSID = "{PHXBRU3242_3*GBU-24 AS}", connector = "WEP_PhoenixWingPylon_R"}, -- GBU-24*3

            { CLSID = "{GBU-39-ARB}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {-0.44, 0.2, 0.005} }, -- GBU-39

            { CLSID = "{SHOULDER_AGM_88}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {-0.245, -0.03, 0.005} }, -- HARM
            { CLSID = "{KH31PD*2R}", connector = "WEP_PhoenixWingPylon_R", attach_point_position = {0.54, 0.1, 0.005}, forbidden = {

                {station = pylon_7, loadout = {"{F14-950gal-empty}"}},
                {station = pylon_7, loadout = {"{F14-950gal}"}},
                {station = pylon_7, loadout = {"{F14-300gal-empty}"}},
                {station = pylon_7, loadout = {"{F14-300gal}"}},
                {station = pylon_7, loadout = {"{F14-2400gal-empty}"}},
                {station = pylon_7, loadout = {"{F14-2400gal}"}},
                {station = pylon_2, loadout = {"{F14-950gal-empty}"}},
                {station = pylon_2, loadout = {"{F14-950gal}"}},
                {station = pylon_2, loadout = {"{F14-300gal-empty}"}},
                {station = pylon_2, loadout = {"{F14-300gal}"}},
                {station = pylon_2, loadout = {"{F14-2400gal-empty}"}},
                {station = pylon_2, loadout = {"{F14-2400gal}"}},

            }}, -- KH-31P
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end

    end

    if pylons[pylon_8A] and pylons[pylon_8A].Launchers then

        local launchers = pylons[pylon_8A].Launchers
        local new_weapons = {

            { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, -- AIM-9X
            { CLSID = "{AIM-132_ASRAAM}", attach_point_position = {-0.14, 0, 0} }, -- AIM-132 ASRAAM
            { CLSID = "{A-DARTER}", attach_point_position = {-0.5, 0, 0} }, -- A-DARTER
            { CLSID = "{IRIS-T_IR}", attach_point_position = {-0.22, 0, 0} }, -- IRIS-T IR
            
        }

        for _, weapon in ipairs(new_weapons) do
            table.insert(launchers, weapon)
        end
        
    end

    return pylons
end