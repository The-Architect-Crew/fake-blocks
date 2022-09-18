streets	= {}

-- Hotfix #1; April 14, 2014; https://github.com/webdesigner97/streets/issues/11
minetest.register_alias("stairs:stair_asphalt","streets:stair_asphalt")

-- Hotfix #2; June 27, 2014; https://github.com/webdesigner97/streets/issues/25
minetest.register_alias("streets:asphalt_stair","streets:stair_asphalt")
minetest.register_alias("streets:asphalt_slab","streets:slab_asphalt")

-- More!
minetest.register_alias("streets:asphalt_side","streets:asphalt_sideline")
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")

minetest.register_alias("streets:asphalt_dashed_line_stair","streets:stair_asphalt_dashed_line")
minetest.register_alias("streets:asphalt_solid_line_stair","streets:stair_asphalt_solid_line")

minetest.register_alias("streets:asphalt_dashed_line_slab","streets:slab_asphalt_dashed_line")
minetest.register_alias("streets:asphalt_solid_line_slab","streets:slab_asphalt_solid_line")

-- Merge two concretes.
minetest.register_alias("concrete:concrete","streets:concrete")

-- Boilerplate to support localized strings if intllib mod is installed.
if minetest.get_modpath("intllib") then
	streets.S = intllib.Getter()
else
	streets.S = function(s) return s end
end

minetest.register_node("streets:delineator", {
	description = streets.S("Delineator (Deprecated)"),
	tiles = {"streets_delineator_top.png","streets_delineator.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=2},
	light_source = 8,
	sunlight_propagates = true,
	node_box = {
			type = "fixed",
			fixed = {
				{-0.1, -0.5, -0.1, 0.1, 0.5, 0.1},
			},
	}
})

minetest.register_node(":streets:constructionfence_bottom",{
	description = streets.S("Construction fence (Deprecated)"),
	tiles = {"streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_bottom.png","streets_fence_bottom.png"},
	groups = {not_in_creative_inventory = 1, cracky = 2},
	paramtype = "light",
	use_texture_alpha = "clip",
	inventory_image = "streets_fence_inv.png",
	wield_image = "streets_fence_inv.png",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.1,0.5,0.0,0.1},	-- lower part
			{-0.2,-0.0,-0.1,0.2,0.5,0.1}	-- thing in the middle
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.1,0.5,1.0,0.1}
		}
	},
	after_dig_node = function(pos,node,digger)
		pos.y = pos.y + 1
		minetest.remove_node(pos)
	end,
	after_place_node = function(pos,placer,itemstack)
		pos.y = pos.y + 1
		if minetest.get_node(pos).name == "air" then
			minetest.add_node(pos,{name = "streets:constructionfence_top", param2 = minetest.dir_to_facedir(placer:get_look_dir())})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough free space! A construction fence has a height of 2 blocks!")
		end
	end
})

minetest.register_node(":streets:constructionfence_top",{
	description = streets.S("Construction fence (Deprecated)"),
	tiles = {"streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_top.png","streets_fence_top.png"},
	groups = {not_in_creative_inventory = 1, cracky = 2, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	drawtype = "nodebox",
	drop = "streets:constructionfence_bottom",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.1,0.5,0.0,0.1}		-- upper part
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-1.5,-0.1,0.5,0.0,0.1}
		}
	},
	after_dig_node = function(pos,node,digger)
		pos.y = pos.y - 1
		minetest.remove_node(pos)
	end
})

minetest.register_node("streets:manhole",{
	description = streets.S("Simple manhole (Deprecated)"),
	tiles = {"streets_asphalt.png^streets_manhole.png","streets_asphalt.png"},
	groups = {not_in_creative_inventory = 1,cracky=1,level=2}
})

minetest.register_node("streets:manhole_adv_closed",{
	description = streets.S("Advanced manhole (Deprecated)"),
	tiles = {"streets_asphalt.png^streets_manhole_advanced.png","streets_asphalt.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			--Walls
			{-0.5,-0.5,-0.5,-0.3,0.5,0.5},
			{-0.5,-0.5,-0.5,0.5,0.5,-0.3},
			{0.3,-0.5,-0.5,0.5,0.5,0.5},
			{-0.5,-0.5,0.3,0.5,0.5,0.5},
			--Cover
			{-0.5,0.4,-0.1,0.5,0.5,0.1},
			{-0.1,0.4,-0.5,0.1,0.5,0.5},
			{-0.2,0.4,-0.2,0.2,0.5,0.2}
		}
	},
	selection_box = {
		type = "regular",
	},
	on_rightclick = function(pos,node,clicker)
		minetest.set_node(pos,{name="streets:manhole_adv_open"})
	end
})

minetest.register_node("streets:manhole_adv_open",{
	description = streets.S("Advanced manhole (Deprecated)"),
	tiles = {"streets_asphalt.png^streets_manhole_advanced.png","streets_asphalt.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_creative_inventory=1},
	drawtype = "nodebox",
	paramtype = "light",
	drop = "streets:manhole_adv_closed",
	climbable = true,
	walkable = false,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			--Walls
			{-0.5,-0.5,-0.5,-0.3,0.5,0.5},
			{-0.5,-0.5,-0.5,0.5,0.5,-0.3},
			{0.3,-0.5,-0.5,0.5,0.5,0.5},
			{-0.5,-0.5,0.3,0.5,0.5,0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			--Walls
			{-0.5,-0.5,-0.5,-0.3,0.5,0.5},
			{-0.5,-0.5,-0.5,0.5,0.5,-0.3},
			{0.3,-0.5,-0.5,0.5,0.5,0.5},
			{-0.5,-0.5,0.3,0.5,0.5,0.5},
		}
	},
	on_rightclick = function(pos,node,clicker)
		minetest.set_node(pos,{name="streets:manhole_adv_closed"})
	end
})

-- Simple pole
minetest.register_node("streets:pole_top",{
	description = streets.S("You cheater!"),
	tiles = {"streets_pole.png"},
	groups = {not_in_creative_inventory = 1, not_in_creative_inventory=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "",
	diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	}
})

minetest.register_node("streets:pole_bottom",{
	description = streets.S("Pole (Deprecated)"),
	tiles = {"streets_pole.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	inventory_image = "streets_pole_inv.png",
	wield_image = "streets_pole_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4},
			{-0.125,-0.5,-0.525,0.125,-0.3,-0.375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		pos.y = pos.y +1
		if minetest.get_node(pos).name == "air" then
			minetest.add_node(pos,{name = "streets:pole_top", param2 = minetest.dir_to_facedir(placer:get_look_dir())})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough free space! A pole has a height of 2 blocks!")
			pos.y = pos.y -1
			minetest.remove_node(pos)
		end
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos.y = pos.y +1
		if minetest.get_node(pos).name == "streets:pole_top" then
			minetest.remove_node(pos)
		end
	end
})

-- Big pole
minetest.register_node("streets:bigpole", {
	description = "Pole (Deprecated)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
		}
	},
	on_place = minetest.rotate_node,
})

minetest.register_node(":streets:bigpole_edge", {
	description = "Pole (Deprecated)",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.15,0.15},
			{-0.15,-0.15,-0.15,0.15,0.15,-0.5}
		}
	},
})

minetest.register_node("streets:bigpole_tjunction", {
	description = "Pole (Deprecated)",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.15, 0.15},
			{-0.15, -0.15, -0.5, 0.15, 0.15, 0.5}
		}
	},
})

-- signs
streets.workshop = {}
streets.workshop.register_sign  = function(nodename, desc, img)
	
	minetest.register_node(nodename, {
		description = desc,
		tiles = {img},
		inventory_image = img,
		wield_image = img,
		groups = {not_in_creative_inventory = 1, snappy = 1,attached_node = 1},
		drawtype = "nodebox",
		node_box = {
			type = "wallmounted",
			fixed = {
				{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
			}
		},
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "wallmounted"
		},
	})
end

minetest.register_node("streets:signworkshop",{
	description = streets.S("Sign workshop (Deprecated)"),
	tiles = {"streets_signworkshop_top.png","streets_signworkshop_bottom.png","streets_signworkshop_side.png","streets_signworkshop_side.png","streets_signworkshop_side.png","streets_signworkshop_front.png"},
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
	paramtype2 = "facedir",
})

streets.workshop.register_sign("streets:sign_blank", streets.S("Empty sign (Deprecated)"), "streets_sign_back.png", {"default:steel_ingot","","",""}, 3)
streets.workshop.register_sign("streets:sign_lava", streets.S("Warning sign (lava) (Deprecated)"), "streets_sign_lava.png", {"streets:sign_blank","bucket:bucket_lava","",""}, 5)
streets.workshop.register_sign("streets:sign_water", streets.S("Warning sign (water) (Deprecated)"), "streets_sign_water.png", {"streets:sign_blank","bucket:bucket_water","",""}, 5)
streets.workshop.register_sign("streets:sign_construction", streets.S("Warning sign (Construction area) (Deprecated)"), "streets_sign_construction.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_mine", streets.S("Notice sign (Public Mine Ahead) (Deprecated)"), "streets_sign_mine.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_shop", streets.S("Notice sign (Shop/Mall Ahead) (Deprecated)"), "streets_sign_construction.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_workshop", streets.S("Notice sign (Public Workshop Ahead) (Deprecated)"), "streets_sign_workshop.png", {"streets:sign_blank","default:dirt","",""}, 5)
streets.workshop.register_sign("streets:sign_grasswalk", streets.S("Warning sign (No walking on the grass) (Deprecated)"), "streets_sign_grasswalk.png", {"streets:sign_blank","default:dirt","",""}, 5)

-- steel support
minetest.register_node("streets:steel_support",{
	description = streets.S("Steel support (Deprecated)"),
	tiles = {"streets_support.png"},
	groups = {not_in_creative_inventory = 1, cracky = 1},
	drawtype = "glasslike_framed",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
})

-- streetlamp
minetest.register_node(":streets:streetlamp_basic_bottom",{
	drop = "",
	description = streets.S("Street lamp (Deprecated)"),
	tiles = {"streets_lamps_basic_bottom.png"},
	inventory_image = "streets_lamps_basic_inv.png",
	groups = {not_in_creative_inventory = 1, cracky = 1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.4,0.15},
			{-0.1,0.4,-0.1,0.1,0.5,0.1}
		}
	},
	pointable = false,
	after_place_node = function(pos,placer,itemstack)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "streets:streetlamp_basic_middle"})
		minetest.set_node({x = pos.x, y = pos.y + 2, z = pos.z},{name = "streets:streetlamp_basic_top_on"})
	end
})

minetest.register_node("streets:streetlamp_basic_middle",{
	drop = "",
	description = streets.S("You cheater!"),
	groups = {not_in_creative_inventory = 1, cracky = 1, not_in_creative_inventory = 1},
	tiles = {"streets_lamps_basic_middle.png"},
	paramtype = "light",
	drawtype = "nodebox",
	pointable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,0.5,0.1}
		}
	}
})

minetest.register_node(":streets:streetlamp_basic_top_on",{
	drop = "streets:streetlamp_basic_bottom (Deprecated)",
	description = streets.S("You cheater!"),
	groups = {not_in_creative_inventory = 1, cracky = 1, not_in_creative_inventory = 1},
	tiles = {"streets_lamps_basic_top_top.png","streets_lamps_basic_top_top.png","streets_lamps_basic_top.png","streets_lamps_basic_top.png","streets_lamps_basic_top.png","streets_lamps_basic_top.png"},
	paramtype = "light",
	drawtype = "nodebox",
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,-0.4,0.1},
			{-0.3,-0.4,-0.3,0.3,0.5,0.3}
		}
	},
	selection_box = 	{
		type = "fixed",
		fixed = {
			{-0.3,0.5,-0.3,0.3,-2.5,0.3},
		}
	},
	after_dig_node = function(pos)
		minetest.remove_node({x = pos.x, y = pos.y - 1, z = pos.z})
		minetest.remove_node({x = pos.x, y = pos.y - 2, z = pos.z})
	end
})

-- yellow
local box	= {-0.5,-0.5,-0.5,0.5,-0.45,0.5}

minetest.register_node("streets:rw_asphalt_solid",{
	description = streets.S("Solid line (yellow) (Deprecated)"),
	tiles = {"streets_rw_solid_line.png","streets_rw_solid_line_curve.png","streets_rw_solid_line_tjunction.png","streets_rw_solid_line_crossing.png"},
	drawtype = "raillike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_solid_line.png",
	wield_image = "streets_rw_solid_line.png",
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	}
})

minetest.register_node("streets:rw_asphalt_dashed",{
	description = streets.S("Dashed line (yellow) (Deprecated)"),
	tiles = {"streets_rw_dashed_line.png","streets_rw_dashed_line_curve.png","streets_rw_dashed_line_tjunction.png","streets_rw_dashed_line_crossing.png"},
	drawtype = "raillike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_dashed_line.png",
	wield_image = "streets_rw_dashed_line.png",
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	}
})

minetest.register_node("streets:rw_cross",{
	description = streets.S("Cross (yellow) (Deprecated)"),
	tiles = {"streets_rw_cross.png"},
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_cross.png",
	wield_image = "streets_rw_cross.png",
	selection_box = {
		type = "wallmounted"
	}
})

minetest.register_node("streets:rw_outer_edge",{
	description = streets.S("Outer edge (yellow) (Deprecated)"),
	tiles = {"streets_rw_outer_edge.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_outer_edge.png",
	wield_image = "streets_rw_outer_edge.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_parking",{
	description = streets.S("Parking (yellow) (Deprecated)"),
	tiles = {"streets_rw_parking.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_parking.png",
	wield_image = "streets_rw_parking.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_alldirs",{
	description = streets.S("Arrow (yellow) (Deprecated)"),
	tiles = {"streets_rw_arrow_alldirs.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_alldirs.png",
	wield_image = "streets_rw_arrow_alldirs.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_left",{
	description = streets.S("Arrow (yellow) (Deprecated)"),
	tiles = {"streets_rw_arrow_left.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_left.png",
	wield_image = "streets_rw_arrow_left.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_right",{
	description = streets.S("Arrow (yellow) (Deprecated)"),
	tiles = {"streets_rw_arrow_right.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_right.png",
	wield_image = "streets_rw_arrow_right.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_straight_right",{
	description = streets.S("Arrow (yellow) (Deprecated)"),
	tiles = {"streets_rw_arrow_straight_right.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_straight_right.png",
	wield_image = "streets_rw_arrow_straight_right.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_straight_left",{
	description = streets.S("Arrow (yellow) (Deprecated)"),
	tiles = {"streets_rw_arrow_straight_left.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_straight_left.png",
	wield_image = "streets_rw_arrow_straight_left.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_straight",{
	description = streets.S("Arrow (yellow) (Deprecated)"),
	tiles = {"streets_rw_arrow_straight.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_straight.png",
	wield_image = "streets_rw_arrow_straight.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node("streets:rw_sideline",{
	description = streets.S("Sideline (yellow) (Deprecated)"),
	tiles = {"streets_rw_asphalt_side.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_asphalt_side.png",
	wield_image = "streets_rw_asphalt_side.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

-- Normal Asphalt
minetest.register_node("streets:asphalt",{
	description = streets.S("Asphalt (Deprecated)"),
	tiles	= {"streets_asphalt.png"},
	groups = {not_in_creative_inventory = 1,cracky=1,level=2}
})

-- Asphalt
minetest.register_node("streets:asphalt_sideline",{
	description = streets.S("Asphalt with sideline (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_solid_line",{
	description = streets.S("Asphalt with solid line (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_dashed_line",{
	description = streets.S("Asphalt with dashed line (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_outer_edge",{
	description = streets.S("Asphalt with outer edge (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_asphalt_outer_edge.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_arrow_straight",{
	description = streets.S("Asphalt with arrow (straight) (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_straight.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_parking",{
	description = streets.S("Asphalt with parking label (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_parking.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_arrow_left",{
	description = streets.S("Asphalt with arrow (left) (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_arrow_right",{
	description = streets.S("Asphalt with arrow (right) (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_arrow_straight_left",{
	description = streets.S("Asphalt with arrow (straight left) (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_straight_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node(":streets:asphalt_arrow_straight_right",{
	description = streets.S("Asphalt with arrow (straight right) (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_straight_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

minetest.register_node("streets:asphalt_arrow_alldirs",{
	description = streets.S("Asphalt with arrow (all directions) (Deprecated)"),
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	tiles = {"streets_asphalt.png^streets_arrow_alldirs.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})

-- Stairsplus
stairsplus:register_all("streets", "asphalt", "streets:asphalt", {
	description = "Asphalt (Deprecated)",
	tiles = {"streets_asphalt.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})

stairsplus:register_all("streets", "asphalt_solid_line", "streets:asphalt_solid_line", {
	description = "Asphalt with solid line (Deprecated)",
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_solid_line.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})

stairsplus:register_all("streets", "asphalt_dashed_line", "streets:asphalt_dashed_line", {
	description = "Asphalt with dashed line (Deprecated)",
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_dashed_line.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})

-- Sideline stairs/slabs
minetest.register_node("streets:asphalt_side_stair_l",{
	description = streets.S("Asphalt stair (Deprecated)"),
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5},
			{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5}
		}
	}
})

minetest.register_node("streets:asphalt_side_slab_l",{
	description = streets.S(streets.S("Asphalt slab (Deprecated)")),
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5}
		}
	}
})

minetest.register_node("streets:asphalt_side_slab_r",{
	description = streets.S(streets.S("Asphalt slab (Deprecated)")),
	tiles = {"streets_asphalt.png^streets_asphalt_side_r.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side_r.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5}
		}
	}
})
minetest.register_node("streets:asphalt_side_stair_r",{
	description = streets.S(streets.S("Asphalt stair (Deprecated)")),
	tiles = {"streets_asphalt.png^streets_asphalt_side_r.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_side_r.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "streets:asphalt_side_stair_l",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.0,0.5},
			{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5}
		}
	}
})

-- CONCRETE
minetest.register_node("streets:concrete",{
	description = streets.S("Concrete (Deprecated)"),
	tiles = {"streets_concrete.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2}
})

minetest.register_node("streets:concrete_wall",{
	description = streets.S("Concrete wall (Deprecated)"),
	tiles = {"streets_concrete.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4, -0.5, -0.5, 0.4, -0.4, 0.5},
			{-0.1, -0.4, -0.5, 0.1, 0.5, 0.5}
		}
	}
})

minetest.register_node("streets:concrete_wall_flat",{
	description = streets.S("Concrete wall (Deprecated)"),
	tiles = {"streets_concrete.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.5, 0.1, 0.5, 0.5}
		}
	}
})

stairsplus:register_all("streets", "concrete", "streets:concrete", {
	description = "Concrete (Deprecated)",
	tiles = {"streets_concrete.png"},
	groups = {not_in_creative_inventory = 1, cracky=1,level=2,not_in_craft_guide=1},
	sunlight_propagates = true,
})