local KtsToMPS = 0.51444;
local FtToM = 0.3048;
local InToM = 0.0254;
local LbfToN = 4.44822;
local LbToKg = 0.453592;

local pylon_1A,pylon_1B,pylon_2,pylon_3,pylon_4,pylon_5,pylon_6,pylon_7,pylon_8B,pylon_8A = 1,2,3,4,5,6,7,8,9,10

function add_f14bu_weapons(pylons)

    if pylons[pylon_3] and pylons[pylon_3].Launchers then

        local launchers = pylons[pylon_3].Launchers
        local gbu38_mer = {

            CLSID = "{GBU-38_MER_6x}", arg = 601, arg_value = 0.5, connector = "WEP_BRU-34_F_L",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"<CLEAN>"}}

            }
            
        }

        local gbu31p_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31P LS}", arg = 601, arg_value = 0.5, connector = "WEP_BRU-34_F_L",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"<CLEAN>"}}

            }
            
        }

        local gbu31s_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31S LS}", arg = 601, arg_value = 0.5, connector = "WEP_BRU-34_F_L",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"<CLEAN>"}}

            }
            
        }

        local gbu54_rbu = {

            CLSID = "{SDB_GBU-39}", arg = 601, arg_value = 0.5, connector = "WEP_BRU-34_F_L",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"<CLEAN>"}}

            }

        }

        local gbu54_mer = {

            CLSID = "{GBU-54_MER_6x}", arg = 601, arg_value = 0.5, connector = "WEP_BRU-34_F_L",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_6, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_6, loadout = {"<CLEAN>"}}

            }

        }

        local bu_only_index = nil
        for i, weapon in ipairs(launchers) do

            if weapon.CLSID == "{BRU-32 GBU-38}" then
                bu_only_index = i
                break
            end

        end

        if bu_only_index then

            table.insert(launchers, bu_only_index + 1, gbu38_mer)
            table.insert(launchers, bu_only_index + 1, gbu31p_bru42)
            table.insert(launchers, bu_only_index + 1, gbu31s_bru42)
            table.insert(launchers, bu_only_index + 2, gbu54_rbu)
            table.insert(launchers, bu_only_index + 3, gbu54_mer)

        end

    end

    if pylons[pylon_4] and pylons[pylon_4].Launchers then

        local launchers = pylons[pylon_4].Launchers
        local gbu38_mer = {

            CLSID = "{GBU-38_MER_6x}", arg = 603, arg_value = 0.5, connector = "WEP_BRU-34_R_L",
            forbidden = {

                {station = pylon_3, loadout = {"{MAK79_MK83 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK83AIR 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK20 2L}"}},
                {station = pylon_3, loadout = {"{MAK79_CBU99 2L}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_5, loadout = {"<CLEAN>"}}

            }

        }

        local gbu31p_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31P LS}", arg = 603, arg_value = 0.5, connector = "WEP_BRU-34_R_L",
            forbidden = {

                {station = pylon_3, loadout = {"{MAK79_MK83 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK83AIR 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK20 2L}"}},
                {station = pylon_3, loadout = {"{MAK79_CBU99 2L}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_5, loadout = {"<CLEAN>"}}

            }

        }

        local gbu31s_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31S LS}", arg = 603, arg_value = 0.5, connector = "WEP_BRU-34_R_L",
            forbidden = {

                {station = pylon_3, loadout = {"{MAK79_MK83 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK83AIR 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK20 2L}"}},
                {station = pylon_3, loadout = {"{MAK79_CBU99 2L}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_5, loadout = {"<CLEAN>"}}

            }

        }

        local gbu54_rbu = {

            CLSID = "{SDB_GBU-39}", arg = 603, arg_value = 0.5, connector = "WEP_BRU-34_R_L",
            forbidden = {

                {station = pylon_3, loadout = {"{MAK79_MK83 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK83AIR 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK20 2L}"}},
                {station = pylon_3, loadout = {"{MAK79_CBU99 2L}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_5, loadout = {"<CLEAN>"}}

            }

        }

        local gbu54_mer = {

            CLSID = "{GBU-54_MER_6x}", arg = 603, arg_value = 0.5, connector = "WEP_BRU-34_R_L",
            forbidden = {

                {station = pylon_3, loadout = {"{MAK79_MK83 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK83AIR 3L}"}},
                {station = pylon_3, loadout = {"{MAK79_MK20 2L}"}},
                {station = pylon_3, loadout = {"{MAK79_CBU99 2L}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_5, loadout = {"<CLEAN>"}}

            }

        }

        local bu_only_index = nil
        for i, weapon in ipairs(launchers) do

            if weapon.CLSID == "{BRU-32 GBU-38}" then
                bu_only_index = i
                break

            end

        end

        if bu_only_index then

            table.insert(launchers, bu_only_index + 1, gbu38_mer)
            table.insert(launchers, bu_only_index + 1, gbu31p_bru42)
            table.insert(launchers, bu_only_index + 1, gbu31s_bru42)
            table.insert(launchers, bu_only_index + 2, gbu54_rbu)
            table.insert(launchers, bu_only_index + 3, gbu54_mer)

        end

    end

    if pylons[pylon_5] and pylons[pylon_5].Launchers then

        local launchers = pylons[pylon_5].Launchers
        local gbu38_mer = {

            CLSID = "{GBU-38_MER_6x}", arg = 604, arg_value = 0.5, connector = "WEP_BRU-34_R_R",
            forbidden = {

                {station = pylon_4, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_4, loadout = {"<CLEAN>"}},
                {station = pylon_6, loadout = {"{MAK79_MK83 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK83AIR 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK20 2R}"}},
                {station = pylon_6, loadout = {"{MAK79_CBU99 2R}"}}

            }

        }

        local gbu31p_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31P RS}", arg = 604, arg_value = 0.5, connector = "WEP_BRU-34_R_R",
            forbidden = {

                {station = pylon_4, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_4, loadout = {"<CLEAN>"}},
                {station = pylon_6, loadout = {"{MAK79_MK83 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK83AIR 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK20 2R}"}},
                {station = pylon_6, loadout = {"{MAK79_CBU99 2R}"}}

            }

        }

        local gbu31s_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31S RS}", arg = 604, arg_value = 0.5, connector = "WEP_BRU-34_R_R",
            forbidden = {

                {station = pylon_4, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_4, loadout = {"<CLEAN>"}},
                {station = pylon_6, loadout = {"{MAK79_MK83 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK83AIR 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK20 2R}"}},
                {station = pylon_6, loadout = {"{MAK79_CBU99 2R}"}}

            }

        }

        local gbu54_rbu = {

            CLSID = "{SDB_GBU-39}", arg = 604, arg_value = 0.5, connector = "WEP_BRU-34_R_R",
            forbidden = {

                {station = pylon_4, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_4, loadout = {"<CLEAN>"}},
                {station = pylon_6, loadout = {"{MAK79_MK83 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK83AIR 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK20 2R}"}},
                {station = pylon_6, loadout = {"{MAK79_CBU99 2R}"}}

            }

        }
        local gbu54_mer = {

            CLSID = "{GBU-54_MER_6x}", arg = 604, arg_value = 0.5, connector = "WEP_BRU-34_R_R",
            forbidden = {

                {station = pylon_4, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_4, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_4, loadout = {"<CLEAN>"}},
                {station = pylon_6, loadout = {"{MAK79_MK83 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK83AIR 3R}"}},
                {station = pylon_6, loadout = {"{MAK79_MK20 2R}"}},
                {station = pylon_6, loadout = {"{MAK79_CBU99 2R}"}}

            }

        }

        local bu_only_index = nil
        for i, weapon in ipairs(launchers) do

            if weapon.CLSID == "{BRU-32 GBU-38}" then
                bu_only_index = i
                break

            end

        end

        if bu_only_index then

            table.insert(launchers, bu_only_index + 1, gbu38_mer)
            table.insert(launchers, bu_only_index + 1, gbu31p_bru42)
            table.insert(launchers, bu_only_index + 1, gbu31s_bru42)
            table.insert(launchers, bu_only_index + 2, gbu54_rbu)
            table.insert(launchers, bu_only_index + 3, gbu54_mer)

        end

    end

    if pylons[pylon_6] and pylons[pylon_6].Launchers then

        local launchers = pylons[pylon_6].Launchers
        local gbu38_mer = {

            CLSID = "{GBU-38_MER_6x}", arg = 602, arg_value = 0.5, connector = "WEP_BRU-34_F_R",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BRU3242_2*LAU10 R}"}},
                {station = pylon_3, loadout = {"<CLEAN>"}}

            }

        }

        local gbu31p_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31P RS}", arg = 602, arg_value = 0.5, connector = "WEP_BRU-34_F_R",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BRU3242_2*LAU10 R}"}},
                {station = pylon_3, loadout = {"<CLEAN>"}}

            }

        }

        local gbu31s_bru42 = {

            CLSID = "{PHXBRU3242_GBU-31S RS}", arg = 602, arg_value = 0.5, connector = "WEP_BRU-34_F_R",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BRU3242_2*LAU10 R}"}},
                {station = pylon_3, loadout = {"<CLEAN>"}}

            }

        }

        local gbu54_rbu = {

            CLSID = "{SDB_GBU-39}", arg = 602, arg_value = 0.5, connector = "WEP_BRU-34_F_R",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BRU3242_2*LAU10 R}"}},
                {station = pylon_3, loadout = {"<CLEAN>"}}

            }

        }

        local gbu54_mer = {

            CLSID = "{GBU-54_MER_6x}", arg = 602, arg_value = 0.5, connector = "WEP_BRU-34_F_R",
            forbidden = {

                {station = pylon_5, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_5, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7E}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7F}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7M}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7MH}"}},
                {station = pylon_3, loadout = {"{BELLY AIM-7P}"}},
                {station = pylon_3, loadout = {"{BRU3242_2*LAU10 R}"}},
                {station = pylon_3, loadout = {"<CLEAN>"}}

            }

        }

        local bu_only_index = nil
        for i, weapon in ipairs(launchers) do

            if weapon.CLSID == "{BRU-32 GBU-38}" then
                bu_only_index = i
                break

            end

        end

        if bu_only_index then

            table.insert(launchers, bu_only_index + 1, gbu38_mer)
            table.insert(launchers, bu_only_index + 1, gbu31p_bru42)
            table.insert(launchers, bu_only_index + 1, gbu31s_bru42)
            table.insert(launchers, bu_only_index + 2, gbu54_rbu)
            table.insert(launchers, bu_only_index + 3, gbu54_mer)

        end

    end

    return pylons

end