
-- compat contains an assortment of old decorative craig_server_game nodes
-- stripped of their functionality

-- [areas markers]
-- markers:mark (Area Marker)
-- markers:stone (Area Editing Stone)
dofile(minetest.get_modpath("compat").."/markers.lua")

-- [fake fire]
-- fake_fire:chimney_top_stone (Stone chimney top)
-- fake_fire:chimney_top_sandstone (Sandstone chimney top)
dofile(minetest.get_modpath("compat").."/fake_fire.lua")

-- [more chests]
-- more_chests:cobble (Cobble Chest)
-- more_chests:dropbox (Dropbox)
-- more_chests:wifi (Wifi Chest)
-- more_chests:secret (Secret Chest)
-- more_chests:shared (Shared Chest)
dofile(minetest.get_modpath("compat").."/more_chests.lua")

-- [bitchange]
-- bitchange:shop (Shop)
-- bitchange:donationbox (Donation box)
-- bitchange:bitcoin_block (BitBlock)
dofile(minetest.get_modpath("compat").."/bitchange.lua")

-- [nyancat]
-- nyancat:nyancat (Nyan Cat)
-- nyancat:nyancat_rainbow (Nyan Cat Rainbow)
dofile(minetest.get_modpath("compat").."/nyancat.lua")

-- [itemframes]
-- itemframes:pedestal (Pedestal)
dofile(minetest.get_modpath("compat").."/itemframes.lua")

-- [currency]
-- currency:safe (Safe)
-- currency:barter (Barter Table)
-- currency:shop (Shop)
-- currency:shop_empty (Shop (out of stock))
dofile(minetest.get_modpath("compat").."/currency.lua")

-- [beds]
-- beds:bed (Simple Bed)
-- beds:fancy_bed (Fancy Bed)
dofile(minetest.get_modpath("compat").."/beds.lua")

-- [streets]
-- streets:delineator (Delineator)
-- streets:constructionfence_bottom / top (Construction fence)
-- streets:manhole (Simple manhole)
-- streets:manhole_adv_closed / open (Advanced manhole)
-- streets:pole_bottom / top (Pole)
-- streets:bigpole (Pole)
-- streets:bigpole_edge (Pole)
-- streets:bigpole_tjunction (Pole)
-- streets:signworkshop (Sign workshop)
-- streets:sign_blank (Empty sign)
-- streets:sign_lava (Warning sign (lava))
-- streets:sign_water (Warning sign (water))
-- streets:sign_construction (Warning sign (Construction area))
-- streets:sign_mine (Warning sign (Public Mine Ahead))
-- streets:sign_shop (Warning sign (Shop/Mall Ahead))
-- streets:sign_workshop (Warning sign (Public Workshop Ahead))
-- streets:sign_grasswalk (Warning sign (No walking on the grass))
-- streets:streetlamp_basic_bottom / middle / top (Street lamp)
-- streets:rw_asphalt_solid (Solid line (yellow))
-- streets:rw_asphalt_dashed (Dashed line (yellow))
-- streets:rw_cross (Cross (yellow))
-- streets:rw_outer_edge (Outer edge (yellow))
-- streets:rw_parking (Parking (yellow))
-- streets:rw_alldirs (Arrow (yellow))
-- streets:rw_left (Arrow (yellow))
-- streets:rw_right (Arrow (yellow))
-- streets:rw_straight_right (Arrow (yellow))
-- streets:rw_straight_left (Arrow (yellow))
-- streets:rw_straight (Arrow (yellow))
-- streets:rw_sideline (Sideline (yellow))
-- streets:asphalt_sideline (Asphalt with sideline)
-- streets:asphalt_solid_line (Asphalt with solid line)
-- streets:asphalt_dashed_line (Asphalt with dashed line)
-- streets:asphalt_outer_edge (Asphalt with outer edge)
-- streets:asphalt_arrow_straight (Asphalt with arrow)
-- streets:asphalt_parking (Asphalt with parking label)
-- streets:asphalt_arrow_left (Asphalt with arrow (left))
-- streets:asphalt_arrow_right (Asphalt with arrow (right))
-- streets:asphalt_arrow_straight_left (Asphalt with arrow (straight left))
-- streets:asphalt_arrow_straight_right (Asphalt with arrow (straight right))
-- streets:asphalt_arrow_alldirs (Asphalt with arrow (all directions))
-- streets:asphalt_side_stair_l (Asphalt stair)
-- streets:asphalt_side_slab_l (Asphalt slab)
-- streets:asphalt_side_slab_r (Asphalt slab)
-- streets:asphalt_side_stair_r (Asphalt stair)
-- streets:concrete_wall (Concrete wall)
-- streets:concrete_wall_flat (Concrete wall)
dofile(minetest.get_modpath("compat").."/streets.lua")

-- [farming]
-- farming:seed_wheat (Wheat Seed)
-- farming:wheat / _(1,8) (Wheat)
-- farming:seed_cotton (Cotton Seed)
-- farming:cotton / _(1,8) (Cotton)
-- farming:soil (Soil)
-- farming:soil_wet (Wet Soil)
-- farming:dry_soil (Savanna Soil)
-- farming:dry_soil_wet (Wet Savanna Soil)
-- farming:desert_sand_soil (Desert Sand Soil)
-- farming:desert_sand_soil_wet (Wet Desert Sand Soil)
-- farming:straw (Straw)
-- farming:cotton_wild (Wild Cotton)
dofile(minetest.get_modpath("compat").."/farming.lua")

-- [carts]
-- carts:rail (Rail)
-- carts:powerrail (Powered Rail)
-- carts:brakerail (Brake Rail)
dofile(minetest.get_modpath("compat").."/carts.lua")

-- [travelnet]
-- travelnet:travelnet (Travelnet-Box)
-- travelnet:elevator (Elevator)
-- travelnet:elevator_door_steel_closed / _open (elevator door)
-- travelnet:elevator_door_glass_closed / _open (elevator door)
-- travelnet:elevator_door_tin_closed / _open (elevator door)
dofile(minetest.get_modpath("compat").."/travelnet.lua")

-- [darkage]
-- darkage:schist (Schist)
-- darkage:shale (Shale)
-- darkage:silt (Silt)
-- darkage:gneiss (Gneiss)
-- darkage:gneiss_cobble (Gneiss Cobble)
-- darkage:straw (Straw)
-- darkage:straw_bale (Straw Bale)
-- darkage:slate_tile (Slate Tile)
-- darkage:adobe (Adobe)
-- darkage:lamp (Lamp)
-- darkage:cobble_with_plaster (Cobblestone With Plaster)
-- darkage:wood_shelves (Wooden Shelves)
-- darkage:glow_glass (Medieval Glow Glass)
-- darkage:reinforced_wood (Reinforced Wood)
-- darkage:reinforced_wood_left (Reinforced Wood Left)
-- darkage:reinforced_wood_right (Reinforced Wood Right)
-- darkage:wood_frame (Wooden Frame)
dofile(minetest.get_modpath("compat").."/darkage.lua")

dofile(minetest.get_modpath("compat").."/default.lua")