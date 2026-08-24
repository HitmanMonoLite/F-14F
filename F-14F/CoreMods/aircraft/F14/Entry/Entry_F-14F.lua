--------------------------------------------------------- NEW TEXTURES -> WEAPONS

mount_vfs_texture_path(current_mod_path.."/Textures/aim-152_textures")
mount_vfs_texture_path(current_mod_path.."/Textures/JAS39_AA_Weapons")
mount_vfs_texture_path(current_mod_path.."/Textures/JAS39_AG_Weapons")
mount_vfs_texture_path(current_mod_path.."/Textures/AIM-260")
mount_vfs_texture_path(current_mod_path.."/Textures/AIM-174B")
mount_vfs_texture_path(current_mod_path.."/Textures/weapons_textures")

--------------------------------------------------------- END NEW TEXTURES -> WEAPONS

dofile(current_mod_path.."/Entry/Weapons/AddonWeapons/Entry_AddonWeapon.lua")
dofile(current_mod_path.."/Entry/Weapons/ModifiedPylons/Entry_ModifiedPylons.lua")


-- dofile(current_mod_path.."/Entry/F-14F.lua")
dofile(current_mod_path.."/Entry/F-14B_Pylons.lua")
dofile(current_mod_path.."/Entry/F-14BU_Pylons.lua")