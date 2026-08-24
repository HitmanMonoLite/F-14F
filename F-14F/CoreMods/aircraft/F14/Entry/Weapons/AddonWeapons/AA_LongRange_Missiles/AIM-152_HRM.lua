local aim152_hrm_mass = 300
local aim152_hrm_pylon_mass = 1

local AIM152_HRM = {
  category = CAT_AIR_TO_AIR,
  name        = "AIM_152",
  displayName = _("AIM-152 AAAM H/R/M"),
  user_name   = _("AIM-152 AAAM HRM"),
  model       = "aim-152_hrm",
  wsTypeOfWeapon = {
    wsType_Weapon,
    wsType_Missile,
    wsType_AA_Missile,
    WSTYPE_PLACEHOLDER
  },
  mass = aim152_hrm_mass,
  shape_table_data =
    {
        {
            name   = "AIM_152";
            file  = "HB_F14_EXT_AIM152";
            life  = 1;
            fire  = { 0, 1};
            username = "AIM-152";
            index = WSTYPE_PLACEHOLDER,
        },
    },
  Escort = 0,
  Head_Type = 2,
  sigma = {4, 4, 4},
  M = aim152_hrm_mass,
  H_max = 25000,
  H_min = 1,
  Diam = 231,
  Cx_pil = 3,
  D_max = 115000,
  D_min = 1000,
  Head_Form = 1,
  Life_Time = 240,
  Nr_max = 30,
  v_min = 140,
  v_mid = 2575,
  Mach_max = 4.5,
  t_b = 0,
  t_acc = 6,
  t_marsh = 50,
  Range_max = 230000,
  H_min_t = 1,
  Fi_start = 0.78,
  Fi_rak = 3.14152,
  Fi_excort = 1.0472,
  Fi_search = 1.05,
  OmViz_max = 0.6981,
  exhaust = {0.8, 0.8, 0.8, 0.03},
  X_back = -2.09,
  Y_back = 0,
  Z_back = 0,
  Reflection = 0.08,
  KillDistance = 15,
  loft = 1,
  hoj = 1,
  ccm_k0 = 0.15,
  rad_correction = 1,
  loft_factor = 1.5,
  loft_angle = 0.17,
  guidance = {
    k0 = 36,
    k1 = 7.8,
    w_cutoff = 1
  },
  active_radar_lock_dist = 120500,
  go_active_by_default = 1,

  SeekerGen = 4,  -- Seeker generation
  PN_gain = 4,

  PN_coeffs = {
    4,
    15000, 1, 
    25000, 0.85,
    40000, 0.65,
    100000, 0.3,
  },

  supersonic_A_coef_skew = 0.1, -- наклон прямой коэффициента отвала поляры на сверхзвуке
  nozzle_exit_area = 0.011, -- площадь выходного сечения сопла

  ModelData = { 58,
                0.4, -- characteristic square (характеристическая площадь)

                -- параметры зависимости Сx
                0.015, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
                0.05, -- Cx_k1 высота пика волнового кризиса
                0.012, -- Cx_k2 крутизна фронта на подходе к волновому кризису
                0.004, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
                1.2, -- Cx_k4 крутизна спада за волновым кризисом 
                0.9, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))

                -- параметры зависимости Cy
                0.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
                0.75, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
                1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом 
                
                0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
                0, --угловая скорость создаваймая моментом газовых рулей

              -- Engine data. Time, fuel flow, thrust.
              --  t_start     t_b     t_accel     t_march     t_inertial      t_break     t_end           -- Stage
                -1,           -1,     8,          45,         0,              0,          1.0e9,          -- time of stage, sec
                0,            0,      6,          0.4,        0,              0,          0,              -- fuel flow rate in second, kg/sec(ÑÐµÐºÑÐ½Ð´Ð½ÑÐ¹ ÑÐ°ÑÑÐ¾Ð´ Ð¼Ð°ÑÑÑ ÑÐ¾Ð¿Ð»Ð¸Ð²Ð° ÐºÐ³/ÑÐµÐº)
                0,            0,      21500,      300,        0,              0,          0,              -- thrust, newtons

                1.0e9, -- таймер самоликвидации, сек
                470, -- время работы энергосистемы, сек
                0, -- абсолютная высота самоликвидации, м
                0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
                30000, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                30000, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                0.17,  -- синус угла возвышения траектории набора горки
                50, -- продольное ускорения взведения взрывателя
                0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                1,  -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                2,  -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления
                
                -- DLZ data. Use numbers below for your implemetation. --From Denis Alekseev
                -- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
                21, -- производная дальности по скорости носителя на высоте 1км, ППС
                -23, -- производная дальности по скорости цели на высоте 1км, ЗПС
                -3, -- производная по высоте производной дальности по скорости цели, ЗПС
                91000, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
                31000, -- дальность ракурс 180(в догон) град, Н=5000м, V=900км/ч, м
                210000, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
                56000, -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
                65000, -- дальность ракурс 180 град, Н=1000м, V=900км/ч, м
                19000, -- дальность ракурс 180(в догон) град, Н=1000м, V=900км/ч, м
                10000, -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в нижнюю полусферу. Уменьшение дальности при стрельбе вниз
                0.4, -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в верхнюю полусферу. Увеличение дальности при стрельбе вверх.
                -0.015, -- Вертикальная плоскость. Угол перегиба кривой разрешенной дальности, верхняя - нижняя полусфера.
                0.5 -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя
  },
  warhead = enhanced_a2a_warhead(24, 231),
  warhead_air = enhanced_a2a_warhead(24, 231)
}
declare_weapon(AIM152_HRM)

declare_loadout({
  category = CAT_AIR_TO_AIR,
  CLSID = "{AIM152_HRM}",
  Picture = "aim-152.png",
  displayName = AIM152_HRM.displayName,
  attribute = AIM152_HRM.wsTypeOfWeapon,
  Count = 1,
  Weight = 300,
  Elements = {
    {
      DrawArgs = {
        [1] = {1, 1},
        [2] = {2, 1}
      },
      ShapeName = "aim-152_hrm"
    }
  }
})

local function shoulder_AIM_152HRM(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "aim-152.png",
    wsTypeOfWeapon = AIM152_HRM.wsTypeOfWeapon,
    attribute = {4,4,32,WSTYPE_PLACEHOLDER},
    Count = 1,
    Weight = (300*1)+41,
    JettisonSubmunitionOnly = true,
    Elements = {
      {
        ShapeName = "HB_F14_EXT_SPARROW_PYLON",
        IsAdapter = true
      },
      {
        ShapeName = "aim-152_hrm",
        Position = {0.175,-0.12,0.025}
      }
    }
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

shoulder_AIM_152HRM("{SHOULDER AIM-152HRM}", AIM152_HRM, "{AIM152_HRM}")

local function belly_AIM_152HRM_left(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "aim-152.png",
    user_name     = _('2 x ' .. AIM152_HRM.displayName),
    wsTypeOfWeapon = AIM152_HRM.wsTypeOfWeapon,
    attribute = {4,4,32,WSTYPE_PLACEHOLDER},
    Count = 3,
    Weight = (300*3)+18,
    JettisonSubmunitionOnly = true,

    --[[Elements = {
      {
        ShapeName = "aim-152_hrm",
        Position = {0,0,0.1},
        Rotation = {45,0,0}
      }
    }]]--

    Elements = {
    
        {
            ShapeName   =   "HB_F14_EXT_BRU42",
            IsAdapter = true
        },
        
        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, -0.2, 0}, --1
            ShapeName   =   "aim-152_hrm",
            Rotation = {0,0,0},
        },
        
        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, 0.09, -0.16}, --2
            ShapeName   =   "aim-152_hrm",
            Rotation = {45,0,0},
        },

        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, 0.09, 0.16}, --2
            ShapeName   =   "aim-152_hrm",
            Rotation = {-45,0,0},
        },
    },
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

local function belly_AIM_152HRM_right(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "aim-152.png",
    user_name     = _('2 x ' .. AIM152_HRM.displayName),
    wsTypeOfWeapon = AIM152_HRM.wsTypeOfWeapon,
    attribute = {4,4,32,WSTYPE_PLACEHOLDER},
    Count = 2,
    Weight = (300*2)+18,
    JettisonSubmunitionOnly = true,

    --[[Elements = {
      {
        ShapeName = "aim-152_hrm",
        Position = {0,0,0.1},
        Rotation = {45,0,0}
      }
    }]]--

    Elements = {
    
        {
            ShapeName   =   "HB_F14_EXT_BRU42",
            IsAdapter = true
        },
        
        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, -0.2, 0}, --1
            ShapeName   =   "aim-152_hrm",
            Rotation = {0,0,0},
        },
        
        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, 0.09, 0.16}, --2
            ShapeName   =   "aim-152_hrm",
            Rotation = {-45,0,0},
        },
    },
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

belly_AIM_152HRM_left("{BELLY_AIM-152HRM_LEFT}", AIM152_HRM, "{AIM152_HRM}")
belly_AIM_152HRM_right("{BELLY_AIM-152HRM_RIGHT}", AIM152_HRM, "{AIM152_HRM}")