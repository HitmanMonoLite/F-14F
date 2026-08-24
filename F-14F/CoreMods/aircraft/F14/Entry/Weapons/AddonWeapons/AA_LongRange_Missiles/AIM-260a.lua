
function make_aim260a(missile)

	local shape_name = "AIM-260".."_"..missile.name

	local aim260a_name = 'AIM-260B JATM - AAALRM'
	local aim260a_mass = 189.2

	local aim260a_warhead = enhanced_a2a_warhead(9, 178)

	local aim260a_AA = {
	    category        = CAT_AIR_TO_AIR,
	    name            = shape_name,
	    model           = 'AIM-260',
	    user_name       = _(aim260a_name),
		wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
		attribute		=	{4,	4,	32,	WSTYPE_PLACEHOLDER},
	    mass            = aim260a_mass,

	    shape_table_data = {
	        {
	            name     = shape_name,
	            file     = 'AIM-260',
	            life     = 1,
	            fire     = {0, 1},
	            username = "260B",		--Shortened name for cockpit displays
	            index    = WSTYPE_PLACEHOLDER,
	        },
	    },

		Escort 			= 0,
	    Head_Type 		= 2,
		sigma 			= {5, 5, 5},
	    M 				= aim260a_mass,
	    H_max 			= 26000.0,
	    H_min 			= 1.0,
	    Diam			= 178.0,
	    Cx_pil 			= 2.5,
	    D_max 			= 44000.0,
	    D_min 			= 700.0,
	    Head_Form 		= 1,
	    Life_Time 		= 200.0,
	    Nr_max 			= 30,
	    v_min 			= 140.0,
	    v_mid 			= 700.0,
	    Mach_max 		= 4.8,
	    t_b 			= 0.0,
	    t_acc 			= 0.0,
	    t_marsh 		= 15.0,
	    Range_max 		= 240000.0,
	    H_min_t 		= 1.0,
	    Fi_start 		= 0.5,
	    Fi_rak 			= 3.14152,
	    Fi_excort 		= 1.05,
	    Fi_search 		= 1.05,
	    warhead         = aim260a_warhead,
	    warhead_air     = aim260a_warhead,
	    OmViz_max 		= 0.52,
	    exhaust 		= {0.8, 0.8, 0.8, 0.7 };
	    X_back 			= -1.98,
	    Y_back 			= -0.1,
	    Z_back 			= 0.0,
	    Reflection 		= 0.84,
	    KillDistance 	= 28.0,
		loft 			= 1,
		hoj 			= 1,
		ccm_k0 			= 0.05,
		loft_factor 	= 4.7,
		loft_angle 		= 58.18,

		active_radar_lock_dist	= 21000.0,
		go_active_by_default	= 1,
		
		SeekerGen = 4,  -- Seeker generation
	  	PN_gain = 4,

		PN_coeffs = {4, 				-- Number of Entries	
					15000.0 ,1.0,		-- Less 5 km to target Pn = 1
					25000.0, 0.5,		-- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
					40000.0, 0.25,
					60000.0, 0.10};		-- Between 15 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 15 km Pn = 0.2.

		ModelData = {   58 ,  -- model params count
						0.4 ,   -- characteristic square (характеристическая площадь)
						
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
						
						0.5 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
						0.0, --угловая скорость создаваймая моментом газовых рулей
						
					-- Engine data. Time, fuel flow, thrust.	
					--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
						-1.0,		-1.0,	54.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
						 0.0,		0.0,	1.5,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
						 0.0,		0.0,	9300.0,		0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
					
						 1.0e9, -- таймер самоликвидации, сек
						 280.0, -- время работы энергосистемы, сек
						 0, -- абсолютная высота самоликвидации, м
						 missile.time_wait, -- время задержки включения управления (маневр отлета, безопасности), сек
						 40000, --40000 -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
						 45000, --40000 -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
						 0.52356,--0.17, -- синус угла возвышения траектории набора горки
						 50.0, -- продольное ускорения взведения взрывателя
						 missile.module_boost, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
						 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
						 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
						 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

						  -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
						 21.0, 
						 -23.0, 
						 -3.0, 
						 100000, 
						 30000, 
						 130000,
						 50000, 
						 75000, 
						 15000, 
						 6000, 
						 0.4, 
						 -0.015, 
						 0.5,	
	    },
	}

	return aim260a_AA
end

local aim260a_Droper = {
	name = "Drop",
	module_boost = 0.0,
	time_wait = 1.0,
}

local aim260a_Booster = {
	name = "Boost",
	module_boost = 58.8,
	time_wait = 0.0,
}

local aim260a_AA_DropeModule = make_aim260a(aim260a_Droper)
local aim260a_AA_BoostModule = make_aim260a(aim260a_Booster)

declare_weapon(aim260a_AA_DropeModule)
declare_weapon(aim260a_AA_BoostModule)

declare_loadout({
	category		=	CAT_AIR_TO_AIR,
	CLSID			= 	"{AIM260Ax4}",
	Picture			=	"AIM-260A.png",
	wsTypeOfWeapon	=	aim260a_AA_BoostModule.wsTypeOfWeapon,
	displayName		=	"AIM-260B JATM x 4",
	attribute		=	aim260a_AA_BoostModule.attribute,
	Count			=	4,
	Weight			=	(189.2*4) + 64.9,
	Elements		=	
	{	
		{
			ShapeName	   =	"M299",
			IsAdapter  	   =   true,
		},

		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{0,	-0.25,	0.137}, --1
			ShapeName	=	"AIM-260_Boost",
			Rotation = {0,0,0},
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{0,	0.05,	0.16}, --2
			ShapeName	=	"AIM-260_Boost",
			Rotation = {0,0,0},
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{0,	-0.25, -0.137}, --3
			ShapeName	=	"AIM-260_Boost",
			Rotation = {0,0,0},
		},		
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{0,	0.05, -0.16}, --4
			ShapeName	=	"AIM-260_Boost",
			Rotation = {0,0,0},
		},

	},

	JettisonSubmunitionOnly = false,

})

declare_loadout({
	category		=	CAT_AIR_TO_AIR,
	CLSID			= 	"{AIM260Ax6}",
	Picture			=	"AIM-260A.png",
	wsTypeOfWeapon	=	aim260a_AA_DropeModule.wsTypeOfWeapon,
	displayName		=	"AIM-260B JATM x 6",
	attribute		=	aim260a_AA_DropeModule.attribute,
	Count			=	6,
	Weight			=	(189.2*6) + 121,
	Elements		=	
	{	
		{
			ShapeName	   =	"HB_ORD_MER",
			IsAdapter  	   =   true,
		},

		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{2,	-0.09,	0.2}, --1
			ShapeName	=	"AIM-260_Drop",
			Rotation = {0,0,0},
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{2,	-0.09,	-0.2}, --2
			ShapeName	=	"AIM-260_Drop",
			Rotation = {0,0,0},
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{2,	-0.36, 0.0}, --3
			ShapeName	=	"AIM-260_Drop",
			Rotation = {0,0,0},
		},		
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-1.7,	-0.09, 0.2}, --4
			ShapeName	=	"AIM-260_Drop",
			Rotation = {0,0,0},
		},

		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-1.7,	-0.09, -0.2}, --5
			ShapeName	=	"AIM-260_Drop",
			Rotation = {0,0,0},
		},		
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-1.7,	-0.36, 0.0}, --6
			ShapeName	=	"AIM-260_Drop",
			Rotation = {0,0,0},
		},

	},

	JettisonSubmunitionOnly = false,

})