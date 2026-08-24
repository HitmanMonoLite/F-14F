local pylon_1A,pylon_1B,pylon_2,pylon_3,pylon_4,pylon_5,pylon_6,pylon_7,pylon_8B,pylon_8A = 1,2,3,4,5,6,7,8,9,10

local unitPayloads = {
	["name"] = "F-14B",
	["payloads"] = {
		[1] = {
			["displayName"] = "A=G | Kh-31*8 + AIM-132*6 |",
			["name"] = "A=G | Kh-31*8 + AIM-132*6 |",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 10,
				},
				[2] = {
					["CLSID"] = "{KH31PD*2R}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{KH31PD}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{KH31PD}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{KH31PD}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{KH31PD}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{KH31PD*2L}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 1,
				},
			},
			["tasks"] = {
				[1] = 10,
			},
		},
		[2] = {
			["displayName"] = "A=G | GBU-39B*24 + AIM-260*8 + AIM-132*6 |",
			["name"] = "A=G | GBU-39B*24 + AIM-260*8 + AIM-132*6 |",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 10,
				},
				[2] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{GBU-39-ARB}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{GBU-39-ARB}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{GBU-39-ARB}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{GBU-39-ARB}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 1,
				},
			},
			["tasks"] = {
				[1] = 10,
			},
		},
		[3] = {
			["displayName"] = "A=G | Brimstone*24 + AIM-260*4 + AIM-132*6 |",
			["name"] = "A=G | Brimstone*24 + AIM-260*4 + AIM-132*6 |",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 10,
				},
				[2] = {
					["CLSID"] = "{F14-LANTIRN-TP}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{BRIMSTONE}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRIMSTONE}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRIMSTONE}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{BRIMSTONE}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 1,
				},
			},
			["tasks"] = {
				[1] = 10,
			},
		},
		[4] = {
			["displayName"] = "A=G | GBU-12*6 + AGM-65*5 + AIM-260*4 + AIM-132*6 |",
			["name"] = "A=G | GBU-12*6 + AGM-65*5 + AIM-260*4 + AIM-132*6 |",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 10,
				},
				[2] = {
					["CLSID"] = "{F14-LANTIRN-TP}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "LAU_88_AGM-65L_2_R",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "BRU-42_3*GBU-12",
					["num"] = 6,
					["settings"] = {
						["01_prfx_arm_delay_ctrl_FMU139CB_LD"] = 4,
						["01_prfx_function_delay_ctrl_FMU139CB_LD"] = 0,
						["NFP_PRESID"] = "Paveway_II",
						["NFP_PRESVER"] = 2,
						["NFP_VIS_DrawArgNo_57"] = 0,
						["NFP_fuze_type_tail"] = "FMU139CB_LD",
						["laser_code"] = 1688,
					},
				},
				[5] = {
					["CLSID"] = "BRU-42_3*GBU-12",
					["num"] = 5,
					["settings"] = {
						["01_prfx_arm_delay_ctrl_FMU139CB_LD"] = 4,
						["01_prfx_function_delay_ctrl_FMU139CB_LD"] = 0,
						["NFP_PRESID"] = "Paveway_II",
						["NFP_PRESVER"] = 2,
						["NFP_VIS_DrawArgNo_57"] = 0,
						["NFP_fuze_type_tail"] = "FMU139CB_LD",
						["laser_code"] = 1688,
					},
				},
				[6] = {
					["CLSID"] = "LAU_88_AGM_65L_3",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 1,
				},
			},
			["tasks"] = {
				[1] = 10,
			},
		},
		[5] = {
			["displayName"] = "A=A | AIM-260*28 + AIM-132*6 |",
			["name"] = "A=A | AIM-260*28 + AIM-132*6 |",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 10,
				},
				[2] = {
					["CLSID"] = "{AIM-132_ASRAAM}",
					["num"] = 1,
				},
				[3] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 9,
				},
				[5] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 7,
				},
				[6] = {
					["CLSID"] = "{AIM260Ax4}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{AIM260Ax6}",
					["num"] = 5,
				},
				[8] = {
					["CLSID"] = "{AIM260Ax6}",
					["num"] = 6,
				},
			},
			["tasks"] = {
				[1] = 10,
			},
		},
	},
}
return unitPayloads
