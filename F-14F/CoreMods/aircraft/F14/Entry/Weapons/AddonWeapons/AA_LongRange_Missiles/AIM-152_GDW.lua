local aim152_gdw_mass = 172
local aim152_gdw_pylon_mass = 1

local AIM152_GDW = {
  category = CAT_AIR_TO_AIR,
  name = "AIM-152_GDW",
  displayName = _("AIM-152 AAAM GD/W"),
  user_name = _("AIM-152 GDW"),
  model = "aim-152_gdw",
  wsTypeOfWeapon = {
    wsType_Weapon,
    wsType_Missile,
    wsType_AA_Missile,
    WSTYPE_PLACEHOLDER
  },

  mass = aim152_gdw_mass,
  shape_table_data = {
    {
      file = "aim-152_gdw",
      life = 1,
      fire = {0, 1},
      name = "AIM-152_GDW",
      username = _("AIM-152 GDW"),
      index = WSTYPE_PLACEHOLDER
    }
  },

  Escort = 0,
  Head_Type = 2,
  sigma = {4, 4, 4},
  M = aim152_gdw_mass,
  H_max = 75000,
  H_min = 1,
  Diam = 140,
  Cx_pil = 2.5,
  D_max = 115000,
  D_min = 1000,
  Head_Form = 1,
  Life_Time = 240,
  Nr_max = 35,
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
  exhaust1 = {0.8, 0.8, 0.8, 0.08},
  X_back = -0.3,
  Y_back = 0,
  Z_back = 0,
  exhaust2 = {0.8, 0.8, 0.8, 0.08},
  X_back_acc = -1.7,
  Y_back_acc = 0,
  Z_back_acc = 0,
  tail_scale = 0.275,
  Reflection = 0.05,
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
    15000,  1,
    25000,  0.85,
    40000,  0.65,
    100000, 0.3,
  },
  
  supersonic_A_coef_skew = 0.1, -- наклон прямой коэффициента отвала поляры на сверхзвуке
  nozzle_exit_area = 0.011, -- площадь выходного сечения сопла

  ModelData = { 58,
                0.35, -- characteristic square (характеристическая площадь)

                -- параметры зависимости Сx
                0.015, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
                0.05, -- Cx_k1 высота пика волнового кризиса
                0.012, -- Cx_k2 крутизна фронта на подходе к волновому кризису
                0.004, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
                1.2, -- Cx_k4 крутизна спада за волновым кризисом 
                0.9, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))

                -- параметры зависимости Cy
                2.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
                0.75, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
                1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом 

                0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
                0.28, --угловая скорость создаваймая моментом газовых рулей  

              -- Engine data. Time, fuel flow, thrust.
              --  t_start     t_b     t_accel     t_march     t_inertial      t_break     t_end           -- Stage
                -1,           -1,     11,         20,         0,              0,          1.0e9,          -- time of stage, sec
                0,             0,     4,          0.4,        0,              0,          0,              -- fuel flow rate in second, kg/sec(ÑÐµÐºÑÐ½Ð´Ð½ÑÐ¹ ÑÐ°ÑÑÐ¾Ð´ Ð¼Ð°ÑÑÑ ÑÐ¾Ð¿Ð»Ð¸Ð²Ð° ÐºÐ³/ÑÐµÐº)
                0,             0,     12000,      1300,       0,              0,          0,              -- thrust, newtons

                1.0e9, -- таймер самоликвидации, сек
                470, -- время работы энергосистемы, сек
                0, -- абсолютная высота самоликвидации, м
                0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
                1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                0.45,  -- синус угла возвышения траектории набора горки
                50, -- продольное ускорения взведения взрывателя
                20, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                1.0,  -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                2.0,  -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления

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
  warhead = enhanced_a2a_warhead(18, 140),
  warhead_air = enhanced_a2a_warhead(18, 140)
}

declare_weapon(AIM152_GDW)

declare_loadout({
  category = CAT_AIR_TO_AIR,
  CLSID = "AIM152_GDW",
  Picture = "AIM-152_GDW.png",
  displayName = AIM152_GDW.displayName,
  attribute = AIM152_GDW.wsTypeOfWeapon,
  Count = 1,
  Weight = 172,
  Elements = {
    {
      DrawArgs = {
        [1] = {1, 1},
        [2] = {2, 1}
      },
      ShapeName = "aim-152_gdw"
    }
  }
})

local function shoulder_AIM_152GDW(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "AIM-152_GDW.png",
    wsTypeOfWeapon = AIM152_GDW.wsTypeOfWeapon,
    attribute = {
      4,
      4,
      32,
      WSTYPE_PLACEHOLDER
    },
    Count = 3,
    Weight = (172*3)+41,
    JettisonSubmunitionOnly = true,
    Elements = {
      [1] = {
        Position = {
          -0.2,
          0,
          0
        },
        ShapeName = "AIM-152_GDW_launcher_shoulder",
        IsAdapter = true
      },
      [2] = {
        connector_name = "Attachpoint01",
        ShapeName = "AIM-152_GDW"
      },
      [3] = {
        connector_name = "Attachpoint02",
        ShapeName = "AIM-152_GDW"
      },
      [4] = {
        connector_name = "Attachpoint03",
        ShapeName = "AIM-152_GDW"
      }
    }
  }
  ret.displayName = element.user_name

  declare_loadout(ret)

end

shoulder_AIM_152GDW("{SHOULDER AIM-152GDW}", AIM152_GDW, "{AIM152_GDW}")

local function belly_AIM_152GDW(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "AIM-152_GDW.png",
    wsTypeOfWeapon = AIM152_GDW.wsTypeOfWeapon,
    attribute = {
      4,
      4,
      32,
      WSTYPE_PLACEHOLDER
    },
    Count = 3,
    Weight = (172*3)+41,
    JettisonSubmunitionOnly = true,
    Elements = {
      [1] = {
        Position = {
          -0.2,
          0,
          0
        },
        ShapeName = "AIM-152_GDW_launcher_belly",
        IsAdapter = true
      },
      [2] = {
        connector_name = "Attachpoint01",
        ShapeName = "AIM-152_GDW"
      },
      [3] = {
        connector_name = "Attachpoint02",
        ShapeName = "AIM-152_GDW"
      },
      [4] = {
        connector_name = "Attachpoint03",
        ShapeName = "AIM-152_GDW"
      }
    }
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

belly_AIM_152GDW("{BELLY AIM-152GDW}", AIM152_GDW, "{AIM152_GDW}")

local function belly_rear_AIM_152GDW(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "AIM-152_GDW.png",
    wsTypeOfWeapon = AIM152_GDW.wsTypeOfWeapon,
    attribute = {
      4,
      4,
      32,
      WSTYPE_PLACEHOLDER
    },
    Count = 3,
    Weight = (172*3)+41,
    JettisonSubmunitionOnly = true,
    Elements = {
      [1] = {
        Position = {
          -0.2,
          0,
          0
        },
        ShapeName = "AIM-152_GDW_launcher_belly_rear",
        IsAdapter = true
      },
      [2] = {
        connector_name = "Attachpoint01",
        ShapeName = "AIM-152_GDW"
      },
      [3] = {
        connector_name = "Attachpoint02",
        ShapeName = "AIM-152_GDW"
      },
      [4] = {
        connector_name = "Attachpoint03",
        ShapeName = "AIM-152_GDW"
      }
    }
  }
  ret.displayName = element.user_name

  declare_loadout(ret)

end

belly_rear_AIM_152GDW("{BELLY REAR AIM-152GDW}", AIM152_GDW, "{AIM152_GDW}")