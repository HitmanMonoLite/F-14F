----- Fuel tanks GROUND MOD
local GALLON_TO_KG = 3.785 * 0.8
declare_loadout(
{
    category        = CAT_FUEL_TANKS,
    CLSID           = "{F14-2400gal-empty}",
    attribute       =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
    Picture =   "Fuel_tanker.png",
    Weight_Empty    = 50,
    Weight          = 70, --20 eunusable or something
    Capacity = 2550*GALLON_TO_KG,
    --attribute =   {1, 3,  43, 12},
    shape_table_data =
    {
        {
            name    = "HB_F14_EXT_DROPTANK_EMPTY";
            file    = "HB_F14_EXT_DROPTANK";
            life    = 1;
            fire    = { 0, 1};
            username    = "Fuel tank 2550 gal GROUND MOD";
            index   = WSTYPE_PLACEHOLDER;
        },
    },
    Elements    =
    {
        [1] =
        {
            Position    =   {0, 0,  0},
            ShapeName   =   "HB_F14_EXT_DROPTANK_EMPTY",
        },
    }, -- end of Elements
    displayName =   _("Fuel tank 2550 gal GROUND MOD (empty)"),
    Cx_pil = 0.0011,
})

declare_loadout(
{
    category        = CAT_FUEL_TANKS,
    CLSID           = "{F14-2400gal}",
    attribute       =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
    Picture =   "Fuel_tanker.png",
    Weight_Empty    = 50,
    Weight          = 50 + 2550 * GALLON_TO_KG,
    Capacity = 2550*GALLON_TO_KG,
    --attribute =   {1, 3,  43, 12},
    shape_table_data =
    {
        {
            name    = "HB_F14_EXT_DROPTANK";
            file    = "HB_F14_EXT_DROPTANK";
            life    = 1;
            fire    = { 0, 1};
            username    = "Fuel tank 2550 gal GROUND MOD";
            index   = WSTYPE_PLACEHOLDER;
        },
    },
    Elements    =
    {
        [1] =
        {
            Position    =   {0, 0,  0},
            ShapeName   =   "HB_F14_EXT_DROPTANK",
        },
    }, -- end of Elements
    displayName =   _("Fuel tank 2550 gal GROUND MOD"),
    Cx_pil = 0.0011,
})

----- Fuel tanks CARRIER MOD

declare_loadout(
{
    category        = CAT_FUEL_TANKS,
    CLSID           = "{F14-950gal-empty}",
    attribute       =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
    Picture =   "Fuel_tanker.png",
    Weight_Empty    = 50,
    Weight          = 70, --20 eunusable or something
    Capacity = 950*GALLON_TO_KG,
    --attribute =   {1, 3,  43, 12},
    shape_table_data =
    {
        {
            name    = "HB_F14_EXT_DROPTANK_EMPTY";
            file    = "HB_F14_EXT_DROPTANK";
            life    = 1;
            fire    = { 0, 1};
            username    = "Fuel tank 950 gal CARRIER MOD";
            index   = WSTYPE_PLACEHOLDER;
        },
    },
    Elements    =
    {
        [1] =
        {
            Position    =   {0, 0,  0},
            ShapeName   =   "HB_F14_EXT_DROPTANK_EMPTY",
        },
    }, -- end of Elements
    displayName =   _("Fuel tank 950 gal CARRIER MOD (empty)"),
    Cx_pil = 0.0011,
})

declare_loadout(
{
    category        = CAT_FUEL_TANKS,
    CLSID           = "{F14-950gal}",
    attribute       =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
    Picture =   "Fuel_tanker.png",
    Weight_Empty    = 50,
    Weight          = 50 + 950 * GALLON_TO_KG,
    Capacity = 950*GALLON_TO_KG,
    --attribute =   {1, 3,  43, 12},
    shape_table_data =
    {
        {
            name    = "HB_F14_EXT_DROPTANK";
            file    = "HB_F14_EXT_DROPTANK";
            life    = 1;
            fire    = { 0, 1};
            username    = "Fuel tank 950 gal CARRIER MOD";
            index   = WSTYPE_PLACEHOLDER;
        },
    },
    Elements    =
    {
        [1] =
        {
            Position    =   {0, 0,  0},
            ShapeName   =   "HB_F14_EXT_DROPTANK",
        },
    }, -- end of Elements
    displayName =   _("Fuel tank 950 gal CARRIER MOD"),
    Cx_pil = 0.0011,
})