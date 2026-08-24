local adarter_name = 'A-Darter IR AAM'
local adarter_mass = 89
local pylon_mass = 1.0

ADARTER_AA = {
    category        = CAT_AIR_TO_AIR,
    name            = adarter_name,
    user_name       = _(adarter_name),
    wsTypeOfWeapon  = {4,4,7,WSTYPE_PLACEHOLDER},
    Escort          = 0,
    Head_Type       = 1,
    sigma           = {2, 2, 2},
    M               = adarter_mass,
    H_max = 20000.0, 
    H_min = -1,
    Diam = 166.0,
    Cx_pil = 1.2,
    D_max = 17500.0,
    D_min = 200.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 100,
    v_min = 140.0,
    v_mid = 400.0,
    Mach_max = 3.0,
    t_b = 0.0,
    t_acc = 8.0,
    t_marsh = 0.0,
    Range_max = 22000.0,
    H_min_t = 1.0,
    Fi_start = 3.14152,
    Fi_rak = 3.14152,
    Fi_excort = 3.14152, 
    Fi_search = 0.09, 
    OmViz_max = 1.10, 
	warhead = enhanced_a2a_warhead(17),       
    exhaust = { 0.84, 0.66, 0.43, 0.08 };				
	X_back = -1.35,
    Y_back = -0.1,
    Z_back = 0.0,
    Reflection = 0.035,
    KillDistance = 8.0,

    --seeker sensivity params
    SeekerGen = 4,  -- Seeker generation
    SeekerSensivityDistance = 25000, -- The range of target with IR value = 1. In meters.
    ccm_k0        = 0.018,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled  = true, -- True is cooled seeker and false is not cooled seeker.
    x_wing_anim = -1,
    PN_gain = 6,
    SeekerGen = 4,

    shape_table_data = {
        {
            name     = adarter_name,
            file     = 'A-DARTER',
            life     = 1,
            fire     = {0, 1},
            username = "ADARTER",
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    upersonic_A_coef_skew = 0.3, -- наклон прямой коэффициента отвала поляры на сверхзвуке
    nozzle_exit_area =  0.0068, -- площадь выходного сечения сопла

    ModelData = {
        58 ,  -- model params count
        0.42 ,   -- characteristic square (характеристическая площадь)
        
        -- параметры зависимости Сx
        0.040 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
        0.080 , -- Cx_k1 высота пика волнового кризиса
        0.020 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
        0.050, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
        1.0 , -- Cx_k4 крутизна спада за волновым кризисом 
        0.8 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
        
        -- параметры зависимости Cy
        0.9 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
        0.8     , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
        1.2  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
        
        0.7 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
        0.85, --угловая скорость создаваймая моментом газовых рулей
        
        -- Engine data. Time, fuel flow, thrust.    
        --    t_statr        t_b        t_accel        t_march        t_inertial        t_break        t_end            -- Stage
        -1.0,        -1.0,    6,          0.0,        0.0,            0.0,        1.0e9,         -- time of stage, sec
         0.0,        0.0,    5.0,        0.0,        0.0,            0.0,        0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
         0.0,        0.0,    12500.0,    0.0,    0.0,            0.0,        0.0,           -- thrust, newtons
    
         1.0e9, -- таймер самоликвидации, сек
         60.0, -- время работы энергосистемы, сек
         0, -- абсолютная высота самоликвидации, м
         0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
         1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
         1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
         0.0,  -- синус угла возвышения траектории набора горки
         50.0, -- продольное ускорения взведения взрывателя
         0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
         1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
         1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
         2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

          -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
		14.0, 
		-15.0, 
		-2.5, 
		13400, 
		4600, 
		22000,
		8600, 
		9100, 
		2600, 
		1500, 
		0.5, 
		-0.01, 
		0.5,
    },
}

declare_weapon(ADARTER_AA)
ADARTER_AA.shape_table_data.index = ADARTER_AA.wsTypeOfWeapon[4]

declare_loadout({
    category     = CAT_AIR_TO_AIR,
    CLSID        = "A-DARTER_IR",
    Picture      = 'a-darter.png',
    attribute    = ADARTER_AA.wsTypeOfWeapon,
    displayName  = _(adarter_name),
    Cx_pil       = 0.00057,
    Count        = 1,
    Weight       = 89,
    Elements     = {
        [1] =
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = 'A-DARTER',
        },
    }, -- end of Elements
})

local function lau_7_ADARTER(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "a-darter.png",
    wsTypeOfWeapon = ADARTER_AA.wsTypeOfWeapon,
    attribute = {4, 4,  32, WSTYPE_PLACEHOLDER},
    Count = 3,
    Weight = 89*3+28,
    JettisonSubmunitionOnly = true,
    Elements = {
      [1] = {
        Position = {-0.2,   0,  0},
        ShapeName = "AAM_triple_rack",
        IsAdapter = true
      },
      [2] = {
        DrawArgs = {[1] = {1,1},[2] = {2,1},},
        Position    =   {-0.15, -0.22,  0.25}, --1
        connector_name = "Attachpoint01",
        ShapeName = "A-DARTER"
      },
      [3] = {
        DrawArgs = {[1] = {1,1},[2] = {2,1},},
        Position    =   {-0.15, -0.22,  -0.25}, --2
        connector_name = "Attachpoint02",
        ShapeName = "A-DARTER"
      },
      [4] = {
        DrawArgs = {[1] = {1,1},[2] = {2,1},},
        Position    =   {-0.15, -0.30, 0.0}, --3
        connector_name = "Attachpoint03",
        ShapeName = "A-DARTER"
      }
    }
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

lau_7_ADARTER("{A-DARTER}", ADARTER_AA, "A-DARTER")