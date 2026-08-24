local gbu_39_warhead =
{
    mass                 = 280.3, 
    caliber              = 410,
    expl_mass            = 280,
    piercing_mass        = 280*1.2,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 0.0,
    obj_factors          = { 1.0, 1.0 },
    cumulative_factor    = 285.0,
    cumulative_thickness = 282.0, 
}

local gbu_39_name  = "GBU-39 ARB Anti-Radiation Bomb"
local gbu_39_mass  = 120
local gbu_39_model = "GBU-39"

GBU_39_BOMB =
{
	category        = CAT_MISSILES,
    name            = gbu_39_name,
    user_name       = _(gbu_39_name),
    mass            = gbu_39_mass,
	class_name		= "wAmmunitionSelfHoming",
	scheme			= "KH-25MP",
	model           = gbu_39_model,    
	wsTypeOfWeapon  = {wsType_Weapon, wsType_Missile, wsType_AS_Missile, WSTYPE_PLACEHOLDER},
	
	mass = gbu_39_mass,
	Escort = 0,
    Head_Type = 3,
	sigma = {2, 2, 2},
    M = gbu_39_mass,
    H_max = 15000.0,
    H_min = -1,
    Diam = 180.0,
    Cx_pil = 2,
    D_max = 140000.0,
    D_min = 500.0,
    Head_Form = 0,
    Life_Time = 500,
    Nr_max = 25,
    v_min = 50.0,
    v_mid = 320.0,
    Mach_max = 2.0,
    t_b = 0.0,
    t_acc = 1.0,
    t_marsh = 9999.0,
    Range_max = 140000.0,
    H_min_t = 0.0,
    Fi_start = 0.5,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 99.9,
    OmViz_max = 99.9,
	exhaust	= {1.0, 1.0, 1.0, 0.1},
	X_back	= -0.9,
	Y_back	= -0.15,
	Z_back 	= 0.0,
	Reflection	= 0.012,
	KillDistance= 710,	
	
	manualWeaponFlag = 1,
		
	LaunchDistData =
	{
		24,		8,

				100,	150,	200,	250,	300,	350,	400,	450,		
		100,	9220,	9220,	9220,	9220,	9220,	27180,	28080,	28890,	
		200,	15520,	15520,	15520,	15520,	15520,	27330,	28230,	29040,	
		300,	17040,	17040,	17040,	17040,	17040,	27470,	28370,	29180,	
		400,	18240,	18240,	18240,	18240,	18240,	27610,	28500,	29300,	
		500,	19180,	19180,	19180,	19180,	19180,	27740,	28630,	29450,	
		600,	19980,	19980,	19980,	19980,	19980,	27870,	28760,	29600,	
		700,	20640,	20640,	20640,	20640,	20640,	27990,	28910,	29750,	
		800,	21225,	21225,	21225,	21225,	21225,	28100,	29050,	29875,	
		900,	21725,	21725,	21725,	21725,	21725,	28250,	29175,	30025,	
		1000,	22950,	24175,	25300,	26325,	27325,	28375,	29300,	30150,	
		2000,	24350,	25425,	26450,	27450,	28525,	29600,	30575,	31425,	
		3000,	25250,	26300,	26550,	26550,	26700,	30700,	31450,	31500,	
		4000,	26050,	27150,	28200,	29250,	30600,	31500,	31550,	31600,	
		5000,	26700,	27900,	29000,	30100,	30800,	30900,	30900,	31700,	
		6000,	26750,	27500,	28500,	30250,	30500,	31500,	32250,	32750,	
		7000,	27750,	28500,	29500,	30750,	31750,	32500,	33500,	34250,	
		8000,	28500,	29500,	30750,	32000,	33000,	33750,	34750,	35500,	
		9000,	29750,	30750,	31500,	33000,	34000,	35000,	36000,	37000,	
		10000,	30500,	31500,	32500,	34000,	35250,	36250,	37250,	38250,	
		11000,	31000,	32500,	33500,	35000,	36000,	37000,	38000,	39500,	
		12000,	32000,	33500,	34500,	36000,	37500,	38500,	39500,	40500,	
		13000,	33000,	34000,	35500,	37500,	38500,	39500,	40500,	41500,	
		14000,	33500,	35000,	37000,	38500,	39500,	41000,	42000,	43000,	
		15000,	34500,	36000,	38000,	39500,	41000,	42000,	43000,	44500,	
	},

	MinLaunchDistData =
	{
		24,		8,

				100,	150,	200,	250,	300,	350,	400,	450,		
		100,	3560,	3560,	3560,	3560,	3560,	5180,	5260,	5330,	
		200,	4130,	4130,	4130,	4130,	4130,	5190,	5270,	5350,	
		300,	4270,	4270,	4270,	4270,	4270,	5210,	5290,	5360,	
		400,	4380,	4380,	4380,	4380,	4380,	5220,	5300,	5370,	
		500,	4460,	4460,	4460,	4460,	4460,	5230,	5310,	5480,	
		600,	4530,	4530,	4530,	4530,	4530,	5240,	5340,	5680,	
		700,	4590,	4590,	4590,	4590,	4590,	5250,	5530,	5870,	
		800,	4650,	4650,	4650,	4650,	4650,	5275,	5700,	6050,	
		900,	4700,	4700,	4700,	4700,	4700,	5375,	5875,	6225,	
		1000,	4800,	4925,	5025,	5100,	5200,	5525,	6025,	6375,	
		2000,	4925,	5025,	5125,	5200,	6000,	6725,	7300,	7825,	
		3000,	5000,	5100,	5150,	5150,	6500,	7700,	8400,	8900,	
		4000,	5100,	5200,	5350,	5600,	7700,	8750,	9450,	9950,	
		5000,	5200,	5400,	5700,	6200,	8600,	9600,	8900,	11000,	
		6000,	5250,	5250,	5500,	7000,	9750,	10750,	11500,	12000,	
		7000,	5250,	5500,	5500,	9000,	10750,	11750,	12500,	13000,	
		8000,	5500,	5500,	5500,	10000,	11750,	12750,	13500,	14000,	
		9000,	5500,	5500,	5750,	11250,	12500,	13500,	14500,	15000,	
		10000,	5500,	5750,	6000,	12250,	13500,	14500,	15500,	16000,	
		11000,	5500,	6000,	10000,	13500,	14500,	15500,	16500,	17500,	
		12000,	6000,	6000,	11500,	14000,	15500,	17000,	17500,	18000,	
		13000,	6000,	6000,	12500,	15000,	16500,	18000,	19000,	19500,	
		14000,	6000,	7000,	14000,	16000,	18000,	19000,	20000,	21000,	
		15000,	6500,	8000,	15000,	17000,	19000,	20500,	21500,	22500,	
	},

	shape_table_data =
	{
		{
			name     = gbu_39_name,
			file     = gbu_39_model,
			life     = 1,
			fire     = {0, 1},
			username = gbu_39_model,
			index    = WSTYPE_PLACEHOLDER,
		},
	},

	controller = {
           boost_start = 2,
		   march_start = 4,
		   --suppres_march = 1.0,
        },
	
	fm = {
		mass				= 275,  
		caliber				= 0.857,  
		wind_sigma			= 0.0,
		wind_time			= 0.0,
		tail_first			= 1,
		fins_part_val		= 0,
		rotated_fins_inp	= 0,
		delta_max			= math.rad(15),
		draw_fins_conv		= {math.rad(90),1,1},
		L					= 4.37,
		S					= 0.059,
		Ix					= 4.8,
		Iy					= 207,
		Iz					= 207,
		
		Mxd					= 0.04 * 57.3 / 9.6,
		Mxw					= -15.8 / 9.6,

		table_scale	= 0.2,
		table_degree_values = 1,
	--	Mach	  | 0.0		0.2		0.4		0.6		0.8		1.0		1.2		1.4		1.6		1.8		2.0		2.2	  |
		Cx0 	= {	0.02,	0.02,	0.02,	0.02,	0.06,	0.08,	0.11,	0.12,	0.13,	0.12,	0.12,	0.11 },
		CxB 	= {	0.034,	0.034,	0.034,	0.034,	0.04,	0.188,	0.188,	0.142,	0.112,	0.091,	0.076,	0.076 },
		K1		= { 0.00041,0.00041,0.00041,0.00041,0.00041,0.00052,0.00044,0.00042,0.0004,0.0003,0.0002,0.00015 },
		K2		= {-0.00024,-0.00024,-0.00024,-0.00024,-0.00018,0.00005,0.0001,0.0001,0.0001,0.0001,0.0001,0.0001 },
		Cya		= { 0.357,	0.357,	0.357,	0.357,	0.357,	0.378,	0.347,	0.34,	0.332,	0.325,	0.315,	0.307 },
		Cza		= { 0.357,	0.357,	0.357,	0.357,	0.357,	0.378,	0.347,	0.34,	0.332,	0.325,	0.315,	0.307 },
		Mya		= {-0.0023,	-0.0023, -0.0023, -0.0023, -0.0023,	-0.0031,	-0.012,	-0.015,	-0.017,	-0.018,	-0.019,	-0.02 },
		Mza		= {-0.0023,	-0.0023, -0.0023, -0.0023, -0.0023,	-0.0031,	-0.012,	-0.015,	-0.017,	-0.018,	-0.019,	-0.02 },
		Myw		= {-0.169, -0.169, -0.169, -0.177, -0.214, -0.213, -0.213, -0.211, -0.204, -0.204, -0.195, -0.176 },
		Mzw		= {-0.169, -0.169, -0.169, -0.177, -0.214, -0.213, -0.213, -0.211, -0.204, -0.204, -0.195, -0.176 },
		A1trim	= { 147.91,	147.91,	147.91,	147.91,	147.91,	123.68,	21.93,	15.64,	9,	7,	6.3,	6.3 },
		A2trim	= { 147.91,	147.91,	147.91,	147.91,	147.91,	123.68,	21.93,	15.64,	9,	7,	6.3,	6.3 },
		
		model_roll = math.rad(45),
		fins_stall = 0,
	},

	seeker = {
		delay					= 1.5,
		op_time					= 1000000,
		FOV						= math.rad(120),
		max_w_LOS				= math.rad(20),
		sens_near_dist			= 100,
		sens_far_dist			= 70000,

		keep_aim_time		= 4,
		pos_memory_time		= 400000,
		err_correct_time	= 0.8,
		calc_aim_dist		= 500000,
		blind_rad_val		= 0.2,
		aim_y_offset		= 2.0,		-- set 0.0 in tests
		aim_sigma 			= 4,

		ang_err_val			= math.rad(0.02),
		abs_err_val			= 0.4,

		lock_manual_target_types_only = 0,
		filter_ignore_strings = {"EWR", "ewr"},
	},
	
	gimbal = {
		delay				= 0,
		op_time				= 200,
		pitch_max			= math.rad(30),
		yaw_max				= math.rad(30),
		max_tracking_rate	= math.rad(7),
		tracking_gain		= 10,
		lock_time			= 0,
	},

	fuze_proximity = {
		ignore_inp_armed = 0,
	},

	autopilot = {
		delay				= 1.0,
		op_time				= 2000000,
		delay_roll			= 0.4,
		delay_guidance		= 1,
		have_switching_delay= false,
		null_roll			= math.rad(45),
		fins_limit			= math.rad(15),
		fins_limit_x		= math.rad(19),
		Fi_fix_angle_req	= math.rad(-12),
		n_limit				= 7,
		K_roll				= 1,
		K_Fi				= 0.6,
		K_fins				= 1,
		K_fins_x			= 0.4,
		K_Eloc				= -0.003, 
		K_Eloc_x			= 0.0001,
		K_n1				= 0.018,
		K_n2				= 0.001,
		K_LOS_omega			= 6.2,
		Ki_LOS_omega		= 2.4,
		Ki_dG				= -0.02,
		n_req				= 0.6,
		min_loft_time		= 2.4,
	},

	actuator = {
		Tf					= 0.005,
		D					= 250.0,
		T1					= 0.002,
		T2					= 0.006,
		max_omega			= math.rad(400),
		max_delta			= math.rad(15),
		fin_stall			= 0,
		sim_count			= 4,
	},

	boost = {	--	air launch - no booster
		impulse								= 25,
		fuel_mass							= 10,
		work_time							= 2,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{0, 0.1, 0}},
		nozzle_orientationXYZ				= {{0, 0, 0}},
		tail_width							= 0,
		smoke_color							= {0.0, 0.0, 0.0},
		smoke_transparency					= 0.8,
		custom_smoke_dissipation_factor		= 0.0,						
	},
	
	march = {
		impulse								= 120 * 2,
		fuel_mass							= 77.5,
		work_time							= 13,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{0, 0.1, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {0.55, 0.55, 0.55},
		smoke_transparency					= 0.8,
		custom_smoke_dissipation_factor		= 0.2,
	},

	-----------------------------
	wcs_emulator = {
		delay 				= 0.005,
		los_roll			= 0.8,
		K_loft 				= 1.002025,
	},
	
	warhead = gbu_39_warhead,
	warhead_air = gbu_39_warhead,
	
}

declare_weapon(GBU_39_BOMB)
GBU_39_BOMB.shape_table_data.index = GBU_39_BOMB.wsTypeOfWeapon[4]

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = "BU-39-ARB",
    Picture      = "gbu_39.png",
    attribute    = {4, 4, 32, WSTYPE_PLACEHOLDER},
  	displayName  = _('1 x ' .. gbu_39_name),
    Cx_pil       = 0.00057,
    Count        = 1,
    Weight       = gbu_39_mass + 90,
    -- ejectImpulse = -440,
    Elements     = {
        [1] =
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = 'GBU-39',
        },
    }, -- end of Elements
})

local function lau_7_GBU39(clsid, element, elem_CLSID)
  local ret = {
    category = CAT_MISSILES,
    CLSID = clsid,
    Picture = "gbu_39.png",
    wsTypeOfWeapon = GBU_39_BOMB.wsTypeOfWeapon,
    attribute = {4, 4,  32, WSTYPE_PLACEHOLDER},
    Count = 6,
    Weight          = gbu_39_mass * 6 + 90,
    JettisonSubmunitionOnly = true,
    -- ejectImpulse    = 100,
    Elements = {
	
		{
			ShapeName	=	"HB_ORD_MER",
			IsAdapter = true,
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{1.4,	-0.285,	0.285}, --1
			ShapeName	=	"GBU-39",
			Rotation = {-45,0,0},
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{1.4,	-0.285,	-0.285}, --2
			ShapeName	=	"GBU-39",
			Rotation = {45,0,0},
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{1.4,	-0.58, 0.0}, --3
			ShapeName	=	"GBU-39",
			Rotation = {0,0,0},
		},		
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-1,	-0.285, 0.285}, --4
			ShapeName	=	"GBU-39",
			Rotation = {-45,0,0},
		},

		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-1,	-0.285, -0.285}, --5
			ShapeName	=	"GBU-39",
			Rotation = {45,0,0},
		},

		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-1,	-0.58, 0.0}, --6
			ShapeName	=	"GBU-39",
			Rotation = {0,0,0},
		},
		
	},
  }
  ret.displayName = element.user_name
  declare_loadout(ret)
end

lau_7_GBU39("{GBU-39-ARB}", GBU_39_BOMB, "{GBU-39}")