local AIM_174B =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-174B",
	displayName		= _("AIM-174B AMRAAM - Active Rdr AAM"),		
	user_name		= _("AIM-174B"),		
	model			= "AIM-174B",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	
	shape_table_data =
	{
		{
			file  = "AIM-174B";
			life  = 1;
			fire  = {0, 1};
			name  	 = "AIM-174B";
			username = "AIM-174B";
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

 	Escort 				= 0, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type 		= 2, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing
	sigma 				= {5, 5, 5}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M 						= 850.0, -- Mass of the missile at launch
	H_max 				= 34000.0, -- Maximum target altitude
	H_min 				= 3.0, -- minimum target altitude
	Diam 					= 340.0, -- Missile diameter in cm
	Cx_pil 				= 1, -- "Cx like pendants" - Moment of inertia??
	D_max 				= 400000.0, -- Maximum range firing at low altitude, in meters
	D_min 				= 10000.0, -- minimum range in meters
	Head_Form 		= 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time 		= 720.0, -- Battery life
	Nr_max				= 35, -- Maximum g when turning
	v_min 				= 170.0, -- Minimum speed in m/s
	v_mid 				= 1200.0, -- average speed in m/s
	Mach_max 			= 4.2, -- maximum Mach of the missile
	t_b 					= 0.0, -- Motor start delay
	t_acc 				= 6.0, -- motor burn time
	t_marsh 			= 35.0, -- cruise time, 0.0 if not applicable
	Range_max 		= 400000.0, -- Max range in meters
	H_min_t 			= 3.0, -- minimum target height above the terrain, m.
	Fi_start 			= 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak 				= 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort 		= 2.0, -- tracking angle (sighting) of the target by the missile.
	Fi_search 		= 99.9, -- limit angle of free search
	OmViz_max 		= 99.9, -- line-of-sight speed limit
	exhaust 			= { 1, 1, 1, 1 },
	X_back 				= -2.49,
	Y_back 				= 0.0,
	Z_back 				= 0.0,
	Reflection 		= 0.15,
	KillDistance	= 28.0,
	loft 					= 1,
	hoj 					= 1,
	ccm_k0 				= 0.05,
	loft_factor 	= 1.7,
	loft_angle 		= 0.18,

	PN_gain = 6,
	
	active_radar_lock_dist = 40500,
  go_active_by_default = 1,

  SeekerGen = 4,  -- Seeker generation
  PN_gain = 4,

  PN_coeffs = {4, 				-- Number of Entries	
					15000.0 ,1.0,		-- Less 5 km to target Pn = 1
					25000.0, 0.5,		-- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
					40000.0, 0.25,
					60000.0, 0.10};		-- Between 15 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 15 km Pn = 0.2.

	supersonic_A_coef_skew = 0.1, 
	nozzle_exit_area =	0.02322576, 
		
	ModelData = {   58,  -- model params count
					1.2,   -- characteristic square (характеристическая площадь)
					
					-- параметры зависимости Сx
					0.029 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
					0.06 , -- Cx_k1 высота пика волнового кризиса
					0.01 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
					-0.245, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
					0.08 , -- Cx_k4 крутизна спада за волновым кризисом 
					0.7 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
					
					-- параметры зависимости Cy
					1.4 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
					0.6	 , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
					1.2  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
						
					0.7 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
					0.8, --угловая скорость создаваймая моментом газовых рулей
						
					-- Engine data. Time, fuel flow, thrust.	
					--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,		-1.0,	38.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
					0.0,		0.0,	8.41,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					0.0,		0.0,	51325.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					720.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					0.8, -- время задержки включения управления (маневр отлета, безопасности), сек
					25000, --40000 -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					15000, --40000 -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.52356,--0.17, -- синус угла возвышения траектории набора горки
					50.0, -- продольное ускорения взведения взрывателя
					0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					36.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					7.8, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					1.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					21.0, -- производная дальности по скорости носителя на высоте 1км, ППС
					-23.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
					-3.0, -- производная по высоте производной дальности по скорости цели, ЗПС
					150000.0, 
					50000.0, 
					280000.0,
					100000.0, 
					100000.0, 
					30000.0, 
					8000.0,
					0.4,
					-0.015,
					0.5,
				},
	
    warhead         = enhanced_a2a_warhead(64, 340),
    warhead_air     = enhanced_a2a_warhead(64, 340),
	
}

declare_weapon(AIM_174B)

declare_loadout({
  category = CAT_AIR_TO_AIR,
  CLSID = "AIM174B.png",
  Picture = "AIM174B.png",
  displayName = AIM_174B.displayName,
  attribute = AIM_174B.wsTypeOfWeapon,
  Count = 1,
  Weight = 850.0,
  Elements = {
    {
      DrawArgs = {
        [1] = {1, 1},
        [2] = {2, 1}
      },
      ShapeName = "AIM-174B"
    }
  }
})

local function shoulder_AIM_174B(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "AIM174B.png",
    wsTypeOfWeapon = AIM_174B.wsTypeOfWeapon,
    attribute = {4,4,32,WSTYPE_PLACEHOLDER},
    Count = 1,
    Weight = (850*1)+41,
    JettisonSubmunitionOnly = true,
    Elements = {
      {
        ShapeName = "HB_F14_EXT_SPARROW_PYLON",
        IsAdapter = true
      },
      {
        ShapeName = "AIM-174B",
        Position = {0.175,-0.12,0.025}
      }
    }
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

shoulder_AIM_174B("{SHOULDER AIM-174B}", AIM_174B, "{AIM_174B}")

local function belly_AIM_174B_left(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "AIM174B.png",
    user_name     = _('2 x ' .. AIM_174B.displayName),
    wsTypeOfWeapon = AIM_174B.wsTypeOfWeapon,
    attribute = {4,4,32,WSTYPE_PLACEHOLDER},
    Count = 3,
    Weight = (850*3)+18,
    JettisonSubmunitionOnly = true,

    --[[Elements = {
      {
        ShapeName = "AIM-174B",
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
            ShapeName   =   "AIM-174B",
            Rotation = {0,0,0},
        },
        
        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, 0.09, -0.16}, --2
            ShapeName   =   "AIM-174B",
            Rotation = {45,0,0},
        },

        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, 0.09, 0.16}, --2
            ShapeName   =   "AIM-174B",
            Rotation = {-45,0,0},
        },
    },
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

local function belly_AIM_174B_right(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_AIR_TO_AIR,
    CLSID = clsid,
    Picture = "AIM174B.png",
    user_name     = _('2 x ' .. AIM_174B.displayName),
    wsTypeOfWeapon = AIM_174B.wsTypeOfWeapon,
    attribute = {4,4,32,WSTYPE_PLACEHOLDER},
    Count = 2,
    Weight = (850*2)+18,
    JettisonSubmunitionOnly = true,

    --[[Elements = {
      {
        ShapeName = "AIM-174B",
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
            ShapeName   =   "AIM-174B",
            Rotation = {0,0,0},
        },
        
        {
            DrawArgs = {[1] = {1,1},[2] = {2,1},},
            Position    =   {0, 0.09, 0.16}, --2
            ShapeName   =   "AIM-174B",
            Rotation = {-45,0,0},
        },
    },
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

belly_AIM_174B_left("{BELLY_AIM-174B_LEFT}", AIM_174B, "{AIM_174B}")
belly_AIM_174B_right("{BELLY_AIM-174B_RIGHT}", AIM_174B, "{AIM_174B}")

declare_loadout({
  category = CAT_AIR_TO_AIR,
  CLSID = "{AIM_174B}",
  Picture = "AIM174B.png",
  displayName = AIM_174B.displayName,
  attribute = AIM_174B.wsTypeOfWeapon,
  Count = 1,
  Weight = 850.0,
  Elements = {
    {
      DrawArgs = {
        [1] = {1, 1},
        [2] = {2, 1}
      },
      ShapeName = "AIM-174B"
    }
  }
})