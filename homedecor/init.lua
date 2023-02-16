local S = minetest.get_translator("homedecor")

local sc_disallow = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil

minetest.register_node(":homedecor:bathroom_tiles_dark", {
	description = S("Bathroom/kitchen tiles (dark)"),
	tiles = {
		"homedecor_bathroom_tiles_bg.png"
	},
	overlay_tiles = {
		{ name = "homedecor_bathroom_tiles_fg.png", color = 0xff606060 },
	},
	paramtype = "light",
	paramtype2 = "color",
	groups = {not_in_creative_inventory = 1, cracky=3, ud_param2_colorable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":homedecor:bathroom_tiles_medium", {
	description = S("Bathroom/kitchen tiles (medium)"),
	tiles = {
		"homedecor_bathroom_tiles_bg.png"
	},
	overlay_tiles = {
		{ name = "homedecor_bathroom_tiles_fg.png", color = 0xffc0c0c0 },
	},
	paramtype = "light",
	paramtype2 = "color",
	groups = {not_in_creative_inventory = 1, cracky=3, ud_param2_colorable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":homedecor:bathroom_tiles_light", {
	description = S("Bathroom/kitchen tiles (light)"),
	tiles = {
		"homedecor_bathroom_tiles_bg.png"
	},
	overlay_tiles = {
			{ name = "homedecor_bathroom_tiles_fg.png", color = 0xffffffff },
	},
	paramtype = "light",
	paramtype2 = "color",
	groups = {not_in_creative_inventory = 1, cracky=3, ud_param2_colorable = 1},
	sounds = default.node_sound_stone_defaults(),
})

local tr_cbox = {
	type = "fixed",
	fixed = { -0.375, -0.3125, 0.25, 0.375, 0.375, 0.5 }
}

homedecor.register("towel_rod", {
	description = S("Towel rod with towel"),
	mesh = "homedecor_towel_rod.obj",
	tiles = {
		"homedecor_generic_terrycloth.png",
		"default_wood.png",
	},
	inventory_image = "homedecor_towel_rod_inv.png",
	selection_box = tr_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_defaults(),
})

homedecor.register("medicine_cabinet", {
	description = S("Medicine cabinet"),
	mesh = "homedecor_medicine_cabinet.obj",
	tiles = {
		'default_wood.png',
		'homedecor_medicine_cabinet_mirror.png'
	},
	inventory_image = "homedecor_medicine_cabinet_inv.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.3125, -0.1875, 0.3125, 0.3125, 0.5, 0.5}
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("medicine_cabinet_open", {
	mesh = "homedecor_medicine_cabinet_open.obj",
	tiles = {
		'default_wood.png',
		'homedecor_medicine_cabinet_mirror.png',
		'homedecor_medicine_cabinet_inside.png'
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.3125, -0.1875, -0.25, 0.3125, 0.5, 0.5}
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3},
	drop = "homedecor:medicine_cabinet",
})

-- "Sanitation" related

local toilet_sbox = {
	type = "fixed",
	fixed = { -6/16, -8/16, -8/16, 6/16, 9/16, 8/16 },
}

local toilet_cbox = {
	type = "fixed",
	fixed = {
		{-6/16, -8/16, -8/16, 6/16, 1/16, 8/16 },
		{-6/16, -8/16, 4/16, 6/16, 9/16, 8/16 }
	}
}

homedecor.register("toilet", {
	description = S("Toilet"),
	mesh = "homedecor_toilet_closed.obj",
	tiles = {
		"building_blocks_marble.png",
		"building_blocks_marble.png",
		"building_blocks_marble.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey }
	},
	selection_box = toilet_sbox,
	node_box = toilet_cbox,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

homedecor.register("toilet_open", {
	mesh = "homedecor_toilet_open.obj",
	tiles = {
		"building_blocks_marble.png",
		"building_blocks_marble.png",
		"building_blocks_marble.png",
		"default_water.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey }
	},
	use_texture_alpha = "blend",
	selection_box = toilet_sbox,
	collision_box = toilet_cbox,
	drop = "homedecor:toilet",
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

-- toilet paper :-)

local tp_cbox = {
	type = "fixed",
	fixed = { -0.25, 0.125, 0.0625, 0.1875, 0.4375, 0.5 }
}

homedecor.register("toilet_paper", {
	description = S("Toilet paper"),
	mesh = "homedecor_toilet_paper.obj",
	tiles = {
		"homedecor_generic_quilted_paper.png",
		"default_wood.png"
	},
	inventory_image = "homedecor_toilet_paper_inv.png",
	selection_box = tp_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1, snappy=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_defaults(),
})

--Sink

local sink_sbox = {
	type = "fixed",
	fixed = { -5/16, -8/16, 1/16, 5/16, 8/16, 8/16 }
}

local sink_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16,  5/16, 1/16, -4/16, 8/16, 8/16 },
		{  5/16,  5/16, 1/16,  4/16, 8/16, 8/16 },
		{ -5/16,  5/16, 1/16,  5/16, 8/16, 2/16 },
		{ -5/16,  5/16, 6/16,  5/16, 8/16, 8/16 },
		{ -4/16, -8/16, 1/16,  4/16, 5/16, 6/16 }
	}
}

homedecor.register("sink", {
	description = S("Bathroom Sink"),
	mesh = "homedecor_bathroom_sink.obj",
	tiles = {
		"building_blocks_marble.png",
		"building_blocks_marble.png",
		"default_water.png"
	},
	use_texture_alpha = "blend",
	inventory_image="homedecor_bathroom_sink_inv.png",
	selection_box = sink_sbox,
	collision_box = sink_cbox,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = function(pos)
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+1, z=pos.z})
	end
})

--Taps

homedecor.register("taps", {
	description = S("Bathroom taps/faucet"),
	mesh = "homedecor_bathroom_faucet.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_generic_metal_bright.png",
		"homedecor_generic_metal.png",
		"homedecor_generic_metal_bright.png"
	},
	inventory_image = "3dforniture_taps_inv.png",
	wield_image = "3dforniture_taps_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -7/16, 4/16, 4/16, -4/16, 8/16 },
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = homedecor.stop_particle_spawner,
	on_rotate = sc_disallow or nil
})

homedecor.register("taps_brass", {
	description = S("Bathroom taps/faucet (brass)"),
	mesh = "homedecor_bathroom_faucet.obj",
	tiles = {
		"homedecor_generic_metal_brass.png",
		"homedecor_generic_metal_brass.png",
		"homedecor_generic_metal.png",
		"homedecor_generic_metal_brass.png"
	},
	inventory_image = "3dforniture_taps_brass_inv.png",
	wield_image = "3dforniture_taps_brass_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -7/16, 4/16, 4/16, -4/16, 8/16 },
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = homedecor.stop_particle_spawner,
	on_rotate = sc_disallow or nil,
})

--Shower Tray

homedecor.register("shower_tray", {
	description = S("Shower Tray"),
	tiles = {
		"forniture_marble_base_ducha_top.png",
		"building_blocks_marble.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, -0.45, 0.5 },
			{ -0.5, -0.45, -0.5, 0.5, -0.4, -0.45 },
			{ -0.5, -0.45, 0.45, 0.5, -0.4, 0.5 },
			{ -0.5, -0.45, -0.45, -0.45, -0.4, 0.45 },
			{  0.45, -0.45, -0.45, 0.5, -0.4, 0.45 }
		},
	},
	selection_box = homedecor.nodebox.slab_y(0.1),
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults(),
	on_destruct = function(pos)
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+2, z=pos.z}) -- the showerhead
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+1, z=pos.z}) -- the taps, if any
	end
})

--Shower Head


local sh_cbox = {
	type = "fixed",
	fixed = { -0.2, -0.4, -0.05, 0.2, 0.1, 0.5 }
}

homedecor.register("shower_head", {
	drawtype = "mesh",
	mesh = "homedecor_shower_head.obj",
	tiles = {
		"homedecor_generic_metal.png",
		"homedecor_shower_head.png"
	},
	inventory_image = "homedecor_shower_head_inv.png",
	description = S("Shower Head"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = sh_cbox,
	walkable = false,
	on_rotate = sc_disallow or nil,
	on_destruct = function(pos)
		homedecor.stop_particle_spawner(pos)
	end
})

local tub_sbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 1.5, 0.3125, 0.5 },
}

local tub_cbox = {
	type = "fixed",
	fixed = {
		{-0.4375, -0.0625, -0.5, 1.4375, 0.5, -0.4375}, -- NodeBox1
		{-0.4375, -0.0625, 0.4375, 1.4375, 0.5, 0.5}, -- NodeBox2
		{-0.5, 0.1875, -0.4375, -0.4375, 0.5, 0.4375}, -- NodeBox3
		{1.4375, -0.0625, -0.4375, 1.5, 0.5, 0.4375}, -- NodeBox4
		{-0.3125, -0.3125, -0.4375, -0.125, -0.0625, 0.4375}, -- NodeBox5
		{1.375, -0.3125, -0.4375, 1.4375, -0.0625, 0.4375}, -- NodeBox6
		{-0.125, -0.3125, 0.375, 1.375, -0.0625, 0.4375}, -- NodeBox7
		{-0.125, -0.3125, -0.4375, 1.375, -0.0625, -0.375}, -- NodeBox8
		{-0.125, -0.5, -0.375, 1.375, -0.3125, 0.375}, -- NodeBox9
		{-0.4375, -0.0625, -0.4375, -0.3125, 0.1875, 0.4375}, -- NodeBox10
	}
}

homedecor.register("bathtub_clawfoot_brass_taps", {
	drawtype = "mesh",
	mesh = "homedecor_bathtub_clawfoot.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_generic_metal_bright.png",
		"homedecor_generic_metal_bright.png",
		"homedecor_generic_metal_brass.png",
		"building_blocks_marble.png",
		"homedecor_bathtub_clawfoot_bottom_inside.png",
	},
	description = S("Bathtub, clawfoot, with brass taps"),
	groups = {not_in_creative_inventory = 1, cracky=3},
	selection_box = tub_sbox,
	node_box = tub_cbox,
	sounds = default.node_sound_stone_defaults(),
})

homedecor.register("bathtub_clawfoot_chrome_taps", {
	drawtype = "mesh",
	mesh = "homedecor_bathtub_clawfoot.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_generic_metal_bright.png",
		"homedecor_generic_metal_bright.png",
		"homedecor_generic_metal_bright.png",
		"building_blocks_marble.png",
		"homedecor_bathtub_clawfoot_bottom_inside.png",
	},
	description = S("Bathtub, clawfoot, with chrome taps"),
	groups = {not_in_creative_inventory = 1, cracky=3},
	selection_box = tub_sbox,
	node_box = tub_cbox,
	sounds = default.node_sound_stone_defaults(),
})

local bs_cbox = {
	type = "fixed",
	fixed = { -8/16, -8/16, 1/16, 8/16, 8/16, 8/16 }
}

homedecor.register("bathroom_set", {
	drawtype = "mesh",
	mesh = "homedecor_bathroom_set.obj",
	tiles = {
		"homedecor_bathroom_set_mirror.png",
		"homedecor_bathroom_set_tray.png",
		"homedecor_bathroom_set_toothbrush.png",
		"homedecor_bathroom_set_cup.png",
		"homedecor_bathroom_set_toothpaste.png",
	},
	inventory_image = "homedecor_bathroom_set_inv.png",
	description = S("Bathroom sundries set"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = bs_cbox,
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
})

-- homedecor books

local bookcolors = {
	{ "red",    0xffd26466 },
	{ "green",  0xff62aa66 },
	{ "blue",   0xff8686d7 },
	{ "violet", 0xff9c65a7 },
	{ "grey",   0xff757579 },
	{ "brown",  0xff896958 }
}

local color_locale = {
	red = S("red") ,
	green = S("green"),
	blue = S("blue"),
	violet = S("violet"),
	grey = S("grey"),
	brown = S("brown"),
}

for _, c in ipairs(bookcolors) do
	local color, hue = unpack(c)
	homedecor.register("book_"..color, {
		description = S("Writable Book (@1)", color_locale[color]),
		mesh = "homedecor_book.obj",
		tiles = {
			{ name = "homedecor_book_cover.png", color = hue },
			{ name = "homedecor_book_edges.png", color = "white" }
		},
		overlay_tiles = {
			{ name = "homedecor_book_cover_trim.png", color = "white" },
			""
		},
		groups = {not_in_creative_inventory = 1,  snappy=3, oddly_breakable_by_hand=3, book=1 },
		walkable = false,
		stack_max = 1,
		selection_box = {
		        type = "fixed",
				fixed = {-0.2, -0.5, -0.25, 0.2, -0.35, 0.25}
		}
	})

	homedecor.register("book_open_"..color, {
		mesh = "homedecor_book_open.obj",
		tiles = {
			{ name = "homedecor_book_cover.png", color = hue },
			{ name = "homedecor_book_edges.png", color = "white" },
			{ name = "homedecor_book_pages.png", color = "white" }
		},
		groups = {not_in_creative_inventory = 1,  snappy=3, oddly_breakable_by_hand=3},
		drop = "homedecor:book_"..color,
		walkable = false,
		selection_box = {
		        type = "fixed",
				fixed = {-0.35, -0.5, -0.25, 0.35, -0.4, 0.25}
		}
	})
end

-- homedecor_climate_control

homedecor.register("air_conditioner", {
	description = S("Air Conditioner"),
	mesh = "homedecor_ac.obj",
	tiles = {
		"homedecor_ac.png",
		"default_glass.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = { type="regular" },
})

-- fans

homedecor.register("desk_fan", {
	description = S("Desk Fan"),
	groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875}, -- NodeBox1
		}
	},
	tiles = {"homedecor_desk_fan_body.png"},
	inventory_image = "homedecor_desk_fan_inv.png",
	wield_image = "homedecor_desk_fan_inv.png",
	selection_box = { type = "regular" },
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

-- ceiling fan

homedecor.register("ceiling_fan", {
	description = S("Ceiling Fan"),
	tiles = {
		{	name="homedecor_ceiling_fan_top.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5} },
		{	name="homedecor_ceiling_fan_bottom.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5} },
		'homedecor_ceiling_fan_sides.png',
	},
	inventory_image = "homedecor_ceiling_fan_inv.png",
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, 0.495, -0.5, 0.5, 0.495, 0.5 },
			{ -0.0625, 0.375, -0.0625, 0.0625, 0.5, 0.0625 }
		}
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-1,
	sounds = default.node_sound_glass_defaults(),
})

-- heating devices

homedecor.register("space_heater", {
	description = S("Space heater"),
	tiles = { 'homedecor_heater_tb.png',
		  'homedecor_heater_tb.png',
		  'homedecor_heater_sides.png',
		  'homedecor_heater_sides.png',
		  'homedecor_heater_back.png',
		  'homedecor_heater_front.png'
	},
	inventory_image = "homedecor_heater_inv.png",
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, 0.0625, 0.1875, 0, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.5, 0.0625, 0.1875, 0, 0.3125}
	}
})

local r_cbox = homedecor.nodebox.slab_z(-0.25)
homedecor.register("radiator", {
	mesh = "homedecor_radiator.obj",
	tiles = {
		"homedecor_generic_metal.png",
		"homedecor_radiator_controls.png"
	},
	inventory_image = "homedecor_radiator_inv.png",
	description = S("Radiator heater"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = r_cbox,
	collision_box = r_cbox,
	sounds = default.node_sound_wood_defaults(),
})

-- homedecor_clocks

local clock_sbox = {
	type = "fixed",
	fixed = { -8/32, -8/32, 14/32, 8/32, 8/32, 16/32 }
}

local clock_materials = {
	{ "plastic", S("Plastic analog clock"), "homedecor_generic_plastic.png" },
	{ "wood", S("Wooden analog clock"), "default_wood.png" }
}

for _, mat in ipairs(clock_materials) do
	local name, desc, tex = unpack(mat)
	homedecor.register("analog_clock_"..name, {
		description = desc,
		mesh = "homedecor_analog_clock.obj",
		tiles = {
			"homedecor_analog_clock_face.png",
			tex,
			"homedecor_analog_clock_back.png"
		},
		inventory_image = "homedecor_analog_clock_"..name.."_inv.png",
		walkable = false,
		selection_box = clock_sbox,
		groups = {not_in_creative_inventory = 1, snappy=3},
		sounds = default.node_sound_wood_defaults(),
	})
end

homedecor.register("digital_clock", {
	description = S("Digital clock"),
	tiles = {
		"homedecor_digital_clock_edges.png",
		"homedecor_digital_clock_edges.png",
		"homedecor_digital_clock_edges.png",
		"homedecor_digital_clock_edges.png",
		"homedecor_digital_clock_back.png",
		"homedecor_digital_clock_front.png"
	},
	inventory_image = "homedecor_digital_clock_inv.png",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.28125, -0.25, 0.4375, 0.3125, 0.25, 0.5},
		}
	},
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
	groups = {not_in_creative_inventory = 1, snappy=3},
})

homedecor.register("alarm_clock", {
	description = S("Alarm clock"),
	tiles = {
		"homedecor_alarm_clock_top.png",
		"homedecor_alarm_clock_bottom.png",
		"homedecor_alarm_clock_sides.png",
		"homedecor_alarm_clock_sides.png^[transformFX",
		"homedecor_alarm_clock_back.png",
		"homedecor_alarm_clock_front.png"
	},
	inventory_image = "homedecor_alarm_clock_inv.png",
	node_box = {
		type = "fixed",
		fixed = {
			{ -9/32, -16/32, 7/32, 10/32, -5/32, 16/32 },
		}
	},
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
	groups = {not_in_creative_inventory = 1, snappy=3},
})

local gf_cbox = {
	type = "fixed",
	fixed = { -7/16, -8/16, -7/16, 7/16, 24/16, 7/16 }
}

homedecor.register("grandfather_clock", {
	description = S("Grandfather Clock"),
	mesh = "homedecor_grandfather_clock.obj",
	tiles = {
		"default_glass.png",
		"homedecor_grandfather_clock_face.png",
		homedecor.lux_wood,
		"homedecor_grandfather_clock_face_edge.png",
		"homedecor_generic_metal_brass.png"
	},
	inventory_image = "homedecor_grandfather_clock_inv.png",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	selection_box = gf_cbox,
	collision_box = gf_cbox,
	sounds = default.node_sound_wood_defaults(),
	expand = { top="placeholder" },
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

-- homedecor_cobweb

minetest.register_node(":homedecor:cobweb_corner", {
	description = S("Cobweb"),
	drawtype = "torchlike",
	tiles = { "homedecor_cobweb_torchlike.png" },
	inventory_image = "homedecor_cobweb.png",
	wield_image = "homedecor_cobweb.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "homedecor:cobweb_corner",
	liquid_alternative_source = "homedecor:cobweb_corner",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	selection_box = { type = "regular" },
	visual_scale = 1.4,
	groups = {not_in_creative_inventory = 1,  snappy = 3, liquid=3 },
})

minetest.register_node(":homedecor:cobweb_centered", {
	description = S("Cobweb"),
	drawtype = "nodebox",
	tiles = { "homedecor_cobweb.png" },
	inventory_image = "homedecor_cobweb.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "homedecor:cobweb_centered",
	liquid_alternative_source = "homedecor:cobweb_centered",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.1, 0.5, 0.5, 0.1 }
	},
	node_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0 }
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3, liquid=3},
	drop = "homedecor:cobweb_corner"
})

minetest.register_node(":homedecor:cobweb_flat", {
	description = S("Cobweb"),
	drawtype = "nodebox",
	tiles = { "homedecor_cobweb.png" },
	inventory_image = "homedecor_cobweb.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "homedecor:cobweb_flat",
	liquid_alternative_source = "homedecor:cobweb_flat",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
	},
	node_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 0.495, 0.5, 0.5, 0.495 }
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3, liquid=3},
	drop = "homedecor:cobweb_corner"
})

minetest.register_node(":homedecor:cobweb_plantlike", {
	description = S("Cobweb"),
	drawtype = "plantlike",
	tiles = { "homedecor_cobweb_plantlike.png" },
	inventory_image = "homedecor_cobweb.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "homedecor:cobweb_plantlike",
	liquid_alternative_source = "homedecor:cobweb_plantlike",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	selection_box = { type = "regular" },
	visual_scale = 1.189,
	groups = {not_in_creative_inventory = 1,  snappy = 3, liquid=3},
	drop = "homedecor:cobweb_corner"
})

-- homedecor_doors_and_gates

local door_list = {
	{
		name = "wood_plain",
		description = S("Plain Wooden Door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
			open = "homedecor_door_open",
			close = "homedecor_door_close",
		}
	},

	{
		name = "exterior_fancy",
		description = S("Fancy Wood/Glass Door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
			open = "homedecor_door_open",
			close = "homedecor_door_close",
		},
		backface = true,
		alpha = true,
		custom_model = "homedecor_door_fancy"
	},

	{
		name = "french_oak",
		description = S("French door, Oak-colored"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_glass_defaults(),
		},
		backface = true,
		alpha = true,
		custom_model = "homedecor_door_french"
	},

	{
		name = "french_mahogany",
		description = S("French door, Mahogany-colored"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_glass_defaults(),
		},
		backface = true,
		alpha = true,
		custom_model = "homedecor_door_french"
	},

	{
		name = "french_white",
		description = S("French door, White"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_glass_defaults(),
		},
		backface = true,
		alpha = true,
		custom_model = "homedecor_door_french"
	},

	{
		name = "basic_panel",
		description = S("Basic white panel Door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
			open = "homedecor_door_open",
			close = "homedecor_door_close",
		}
	},

	{
		name = "wrought_iron",
		description = S("Wrought Iron Gate/Door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_metal_defaults(),
			open = "doors_steel_door_open",
			close = "doors_steel_door_close",
		},
		backface = true,
		custom_model = "homedecor_door_wrought_iron"
	},

	{
		name = "carolina",
		description = S("Wooden Carolina door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
			open = "homedecor_door_open",
			close = "homedecor_door_close",
		},
		backface = true,
		alpha = true
	},

	{
		name = "woodglass",
		description = S("Wooden door with glass insert, type 3"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
			open = "homedecor_door_open",
			close = "homedecor_door_close",
		},
		backface = true,
		alpha = true,
		custom_model = "homedecor_door_wood_glass_3"
	},

	{
		name = "closet_mahogany",
		description = S("Mahogany Closet Door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
		},
		custom_model = "homedecor_door_closet"
	},

	{
		name = "closet_oak",
		description = S("Oak Closet Door"),
		groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = {
			main = default.node_sound_wood_defaults(),
		},
		custom_model = "homedecor_door_closet"
	},
}

local old_doors = {}

local hd_3d = minetest.get_modpath("homedecor_3d_extras")

for _, door in ipairs(door_list) do
	doors.register("homedecor_"..door.name, {
			tiles = {{ name = "homedecor_door_"..door.name..".png", backface_culling = door.backface }},
			description = door.description,
			inventory_image = "homedecor_door_"..door.name.."_inv.png",
			groups = table.copy(door.groups),
			sounds = door.sounds.main,
			sound_open = door.sounds.open,
			sound_close = door.sounds.close,
	})

	local nn_a = "doors:homedecor_"..door.name.."_a"
	local nn_b = "doors:homedecor_"..door.name.."_b"

	if door.alpha then
		local def = table.copy(minetest.registered_nodes[nn_a])
			def.use_texture_alpha = "clip"
			def.mesh = "door_a.obj"                -- leaving this out will break the _a model
			minetest.register_node(":"..nn_a, def) -- assignment when the override takes place

		def = table.copy(minetest.registered_nodes[nn_b])
			def.use_texture_alpha = "clip"
			minetest.register_node(":"..nn_b, def)
	end

	if door.custom_model and hd_3d then
		def = table.copy(minetest.registered_nodes[nn_a])
			def.mesh = door.custom_model.."_a.obj"
			minetest.register_node(":"..nn_a, def)

		def = table.copy(minetest.registered_nodes[nn_b])
			def.mesh = door.custom_model.."_b.obj"
			minetest.register_node(":"..nn_b, def)
	end

	old_doors[#old_doors + 1] = "homedecor:door_"..door.name.."_left"
	old_doors[#old_doors + 1] = "homedecor:door_"..door.name.."_right"

	minetest.register_alias("doors:"..door.name.."_a", "doors:homedecor_"..door.name.."_a")
	minetest.register_alias("doors:"..door.name.."_b", "doors:homedecor_"..door.name.."_b")
end

-- Gates

local gate_list = {
	{ "picket",          S("Unpainted Picket Fence Gate") },
	{ "picket_white",    S("White Picket Fence Gate")     },
	{ "barbed_wire",     S("Barbed Wire Fence Gate")      },
	{ "chainlink",       S("Chainlink Fence Gate")        },
	{ "half_door",       S("\"Half\" Door")               },
	{ "half_door_white", S("\"Half\" Door (white)")       }
}

local gate_models_closed = {
	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},
	{{ -0.5, -0.5, 0.498, 0.5, 0.5, 0.498 }},
	{{ -8/16, -8/16, 6/16, -6/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16, 6/16,  8/16,  8/16,  8/16 },	-- right post
	 { -8/16,  7/16, 13/32, 8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32, 8/16, -7/16, 15/32 },	-- bottom piece
	 { -6/16, -8/16,  7/16, 6/16,  8/16,  7/16 }},	-- the wire
	{{ -8/16, -8/16,  6/16, -7/16,  8/16,  8/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 },	-- right post
	 { -8/16,  7/16, 13/32,  8/16,  8/16, 15/32 },	-- top piece
	 { -8/16, -8/16, 13/32,  8/16, -7/16, 15/32 },	-- bottom piece
	 { -8/16, -8/16,  7/16,  8/16,  8/16,  7/16 },	-- the chainlink itself
	 { -8/16, -3/16,  6/16, -6/16,  3/16,  8/16 }},	-- the lump representing the lock
	{{ -8/16, -8/16, 6/16, 8/16, 8/16, 8/16 }}, -- the whole door :P
	{{ -8/16, -8/16, 6/16, 8/16, 8/16, 8/16 }}, -- the whole door :P

}

local gate_models_open = {
	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},
	{{ 0.498, -0.5, -0.5, 0.498, 0.5, 0.5 }},
	{{  6/16, -8/16, -8/16,  8/16,  8/16, -6/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 },	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -6/16,  7/16,  8/16,  6/16 }},	-- the wire
	{{  6/16, -8/16, -8/16,  8/16,  8/16, -7/16 },	-- left post
	 {  6/16, -8/16,  6/16,  8/16,  8/16,  8/16 },	-- right post
	 { 13/32,  7/16, -8/16, 15/32,  8/16,  8/16 },	-- top piece
	 { 13/32, -8/16, -8/16, 15/32, -7/16,  8/16 },	-- bottom piece
	 {  7/16, -8/16, -8/16,  7/16,  8/16,  8/16 },	-- the chainlink itself
	 {  6/16, -3/16, -8/16,  8/16,  3/16, -6/16 }},	-- the lump representing the lock
	{{ 6/16, -8/16, -8/16, 8/16, 8/16, 8/16 }}, -- the whole door :P
	{{ 6/16, -8/16, -8/16, 8/16, 8/16, 8/16 }}, -- the whole door :P
}

for i, g in ipairs(gate_list) do

	local gate, gatedesc = unpack(g)

	local tiles = {
		"homedecor_gate_"..gate.."_tb.png",
		"homedecor_gate_"..gate.."_tb.png",
		"homedecor_gate_"..gate.."_lr.png",
		"homedecor_gate_"..gate.."_lr.png",
		"homedecor_gate_"..gate.."_fb.png^[transformFX",
		"homedecor_gate_"..gate.."_fb.png"
	}

	if gate == "barbed_wire" then
		tiles = {
			"homedecor_gate_barbed_wire_edges.png",
			"homedecor_gate_barbed_wire_edges.png",
			"homedecor_gate_barbed_wire_edges.png",
			"homedecor_gate_barbed_wire_edges.png",
			"homedecor_gate_barbed_wire_fb.png^[transformFX",
			"homedecor_gate_barbed_wire_fb.png"
		}
	end

	if gate == "picket" or gate == "picket_white" then
		tiles = {
			"homedecor_blanktile.png",
			"homedecor_blanktile.png",
			"homedecor_blanktile.png",
			"homedecor_blanktile.png",
			"homedecor_gate_"..gate.."_back.png",
			"homedecor_gate_"..gate.."_front.png"
		}
	end

    local def = {
		drawtype = "nodebox",
		description = gatedesc,
		tiles = tiles,
		paramtype = "light",
		groups = {not_in_creative_inventory = 1, snappy=3},
		sounds = default.node_sound_wood_defaults(),
		paramtype2 = "facedir",
		use_texture_alpha = "clip",
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = gate_models_closed[i]
		},
	}

    -- gates when placed default to closed, closed.

	minetest.register_node(":homedecor:gate_"..gate.."_closed", def)

    -- this is either a terrible idea or a great one
    def = table.copy(def)
    def.groups.not_in_creative_inventory = 1
    def.selection_box.fixed = { 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }
    def.node_box.fixed = gate_models_open[i]
	def.tiles = {
		tiles[1].."^[transformR90",
		tiles[2].."^[transformR270",
		tiles[6],
		tiles[5],
		tiles[4],
		tiles[3]
	}
    def.drop = "homedecor:gate_"..gate.."_closed"
	minetest.register_node(":homedecor:gate_"..gate.."_open", def)
end

-- Japanese-style wood/paper door
homedecor.register("door_japanese_closed", {
	description = S("Japanese-style door"),
	inventory_image = "homedecor_door_japanese_inv.png",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	mesh = "homedecor_door_japanese_closed.obj",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 1.5, 0.0625},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 0.5, 1.5, 0},
	},
	expand = { top = "placeholder" },
})

homedecor.register("door_japanese_open", {
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	mesh = "homedecor_door_japanese_open.obj",
	groups = {not_in_creative_inventory = 1,  snappy = 3},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
	selection_box = {
		type = "fixed",
		fixed = {-1.5, -0.5, -0.0625, 0.5, 1.5, 0},
	},
	collision_box = {
		type = "fixed",
		fixed = {-1.5, -0.5, -0.0625, -0.5, 1.5, 0},
	},
	expand = { top = "placeholder" },
	drop = "homedecor:door_japanese_closed",
})

-- homedecor_electrical

homedecor.register("power_outlet", {
	description = S("Power Outlet"),
	tiles = {
		"homedecor_outlet_edges.png",
		"homedecor_outlet_edges.png",
		"homedecor_outlet_edges.png",
		"homedecor_outlet_edges.png",
		"homedecor_outlet_back.png",
		"homedecor_outlet_edges.png"
	},
	inventory_image = "homedecor_outlet_inv.png",
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.125, -0.3125, 0.4375, 0.125, 0, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.1875, -0.375, 0.375, 0.1875, 0.0625, 0.5},
		}
	},
	groups = {not_in_creative_inventory = 1, cracky=3,dig_immediate=2},
	walkable = false
})

for _, onoff in ipairs ({"on", "off"}) do
	local model = {
		{ -0.125,   -0.1875, 0.4375,  0.125,   0.125,  0.5 },
		{ -0.03125,  0,      0.40625, 0.03125, 0.0625, 0.5 },
	}
	if onoff == "on" then
		model = {
			{ -0.125,   -0.1875, 0.4375,  0.125,    0.125,  0.5 },
			{ -0.03125, -0.125,  0.40625, 0.03125, -0.0625, 0.5 },
		}
	end

	homedecor.register("light_switch_"..onoff, {
		description = S("Light switch"),
		tiles = {
			"homedecor_light_switch_edges.png",
			"homedecor_light_switch_edges.png",
			"homedecor_light_switch_edges.png",
			"homedecor_light_switch_edges.png",
			"homedecor_light_switch_back.png",
			"homedecor_light_switch_front_"..onoff..".png"
		},
		inventory_image = "homedecor_light_switch_inv.png",
		node_box = {
			type = "fixed",
			fixed = model
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.1875,   -0.25,    0.375,  0.1875,   0.1875, 0.5 },
			}
		},
		groups = {not_in_creative_inventory = 1,
			cracky=3, dig_immediate=2, mesecon_needs_receiver=1
		},
		walkable = false,
		drop = {
			items = {
				{items = {"homedecor:light_switch_off"}, inherit_color = true },
			}
		},
	})
end

homedecor.register("doorbell", {
	tiles = { "homedecor_doorbell.png" },
	inventory_image = "homedecor_doorbell_inv.png",
	description = S("Doorbell"),
    groups = {not_in_creative_inventory = 1, snappy=3},
    walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0, 0.46875, 0.0625, 0.1875, 0.5}, -- NodeBox1
			{-0.03125, 0.0625, 0.45, 0.03125, 0.125, 0.4675}, -- NodeBox2
		}
	},
})

-- homedecor_electronics

homedecor.register("speaker", {
	description = S("Large Stereo Speaker"),
	mesh="homedecor_speaker_large.obj",
	tiles = {
		"homedecor_speaker_sides.png",
		"homedecor_speaker_front.png"
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("speaker_open", {
	description = S("Large Stereo Speaker, open front"),
	mesh="homedecor_speaker_large_open.obj",
	tiles = {
		"homedecor_speaker_sides.png",
		"homedecor_speaker_driver.png",
		"homedecor_speaker_open_front.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black }
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3},
	sounds = default.node_sound_wood_defaults(),
})

local spk_cbox = {
	type = "fixed",
	fixed = { -3/16, -8/16, 1/16, 3/16, -2/16, 7/16 }
}

homedecor.register("speaker_small", {
	description = S("Small Surround Speaker"),
	mesh="homedecor_speaker_small.obj",
	tiles = {
		"homedecor_speaker_sides.png",
		"homedecor_speaker_front.png"
	},
	selection_box = spk_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("stereo", {
	description = S("Stereo Receiver"),
	tiles = { 'homedecor_stereo_top.png',
			'homedecor_stereo_bottom.png',
			'homedecor_stereo_left.png^[transformFX',
			'homedecor_stereo_left.png',
			'homedecor_stereo_back.png',
			'homedecor_stereo_front.png'},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("projection_screen", {
	description = S("Projection Screen Material"),
	drawtype = 'signlike',
	tiles = { 'homedecor_projection_screen.png' },
	wield_image = 'homedecor_projection_screen_inv.png',
	inventory_image = 'homedecor_projection_screen_inv.png',
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype2 = 'wallmounted',
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
})

homedecor.register("television", {
	description = S("Small CRT Television"),
	tiles = { 'homedecor_television_top.png',
		  'homedecor_television_bottom.png',
		  'homedecor_television_left.png^[transformFX',
		  'homedecor_television_left.png',
		  'homedecor_television_back.png',
		   { name="homedecor_television_front_animated.png",
			  animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=80.0
			  }
		   }
	},
	light_source = default.LIGHT_MAX - 1,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("dvd_vcr", {
	description = S("DVD and VCR"),
	tiles = {
		"homedecor_dvdvcr_top.png",
		"homedecor_dvdvcr_bottom.png",
		"homedecor_dvdvcr_sides.png",
		"homedecor_dvdvcr_sides.png^[transformFX",
		"homedecor_dvdvcr_back.png",
		"homedecor_dvdvcr_front.png",
	},
	inventory_image = "homedecor_dvdvcr_inv.png",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.25, 0.3125, -0.375, 0.1875},
			{-0.25, -0.5, -0.25, 0.25, -0.1875, 0.125},
		}
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

local tel_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.1875, 0.25, -0.21, 0.15 }
}

homedecor.register("telephone", {
	mesh = "homedecor_telephone.obj",
	tiles = {
		"homedecor_telephone_dial.png",
		"homedecor_telephone_base.png",
		"homedecor_telephone_handset.png",
		"homedecor_telephone_cord.png",
	},
	inventory_image = "homedecor_telephone_inv.png",
	description = S("Telephone"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = tel_cbox,
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
})

-- homedecor_exterior
local bbq_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.3125, 0.5, 0.53125, 0.3125 }
}

homedecor.register("barbecue", {
	description = S("Barbecue"),
	mesh = "homedecor_barbecue.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png" , color = homedecor.color_black },
		{ name = "homedecor_embers.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=2
			}
		},
		"homedecor_barbecue_meat.png",
	},
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	light_source = 9,
	selection_box = bbq_cbox,
	collision_box = bbq_cbox,
	sounds = default.node_sound_stone_defaults(),
	-- no need for placeholder it appears
	expand = { top="air" },
})

minetest.register_alias("homedecor:barbecue_meat", "air")

homedecor.register("doghouse", {
	mesh = "homedecor_doghouse.obj",
	tiles = {
		"homedecor_shingles_terracotta.png",
		"default_wood.png",
		"building_blocks_towel.png"
	},
	description = S("Doghouse"),
	inventory_image = "homedecor_doghouse_inv.png",
	selection_box = homedecor.nodebox.slab_y(1.5),
	collision_box = homedecor.nodebox.slab_y(1.5),
	groups = {not_in_creative_inventory = 1, snappy=3},
	expand = { top="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

homedecor.register("stonepath", {
	description = S("Garden stone path"),
	tiles = {
		"default_stone.png"
	},
	inventory_image = "homedecor_stonepath_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.3125, -0.48, 0.4375}, -- NodeBox1
			{-0.25, -0.5, 0.125, 0, -0.48, 0.375}, -- NodeBox2
			{0.125, -0.5, 0.125, 0.4375, -0.48, 0.4375}, -- NodeBox3
			{-0.4375, -0.5, -0.125, -0.25, -0.48, 0.0625}, -- NodeBox4
			{-0.0625, -0.5, -0.25, 0.25, -0.48, 0.0625}, -- NodeBox5
			{0.3125, -0.5, -0.25, 0.4375, -0.48, -0.125}, -- NodeBox6
			{-0.3125, -0.5, -0.375, -0.125, -0.48, -0.1875}, -- NodeBox7
			{0.125, -0.5, -0.4375, 0.25, -0.48, -0.3125}, -- NodeBox8
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.4375, -0.5, -0.4375, 0.4375, -0.4, 0.4375 }
	},
	sounds = default.node_sound_stone_defaults(),
})

local lattice_colors = {
	{ "wood", S("wood"), ".png^[colorize:#704214:180" },
	{ "white_wood", S("white wood"), ".png" },
	{ "wood_vegetal", S("wood, with vegetation"),
		".png^[colorize:#704214:180^homedecor_lattice_vegetal.png" },
	{ "white_wood_vegetal", S("white wood, with vegetation"),
		".png^homedecor_lattice_vegetal.png" },
}

for _, c in ipairs(lattice_colors) do
local name, desc, texture = unpack(c)
homedecor.register("lattice_"..name, {
	description = S("Garden Lattice (@1)", desc),
	tiles = {"homedecor_lattice"..texture},
	inventory_image = "homedecor_lattice"..texture,
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.47, 0.5, 0.5, 0.47}, -- NodeBox1
			{-0.5, 0.421875, 0.44, 0.5, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, 0.44, 0.5, -0.421875, 0.5}, -- NodeBox3
			{0.421875, -0.5, 0.44, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.44, -0.421875, 0.5, 0.5} -- NodeBox5
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.44, 0.5, 0.5, 0.5}
	},
	sounds = default.node_sound_wood_defaults(),
})
end

homedecor.register("swing", {
	description = S("Tree's swing"),
	tiles = {
		"homedecor_swing_top.png",
		"homedecor_swing_top.png^[transformR180",
		"homedecor_swing_top.png"
	},
	inventory_image = "homedecor_swing_inv.png",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1,  snappy=3, oddly_breakable_by_hand=3 },
	sounds = default.node_sound_wood_defaults(),
	walkable = false,
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, 0.33, -0.125,  0.3125, 0.376, 0.1875}, -- NodeBox1
			{-0.3125, 0.376, 0.025, -0.3,    0.5,   0.0375}, -- NodeBox2
			{ 0.3,    0.376, 0.025,  0.3125, 0.5,   0.0375}, -- NodeBox3
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.3125, 0.33, -0.125, 0.3125, 0.5, 0.1875 }
	},
	hint = {
		place_on = "bottom"
	},
})

homedecor.register("swing_rope", {
	tiles = {
		"homedecor_swingrope_sides.png"
	},
	groups = {not_in_creative_inventory = 1},
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.025, -0.3, 0.5, 0.0375}, -- NodeBox1
			{0.3, -0.5, 0.025, 0.3125, 0.5, 0.0375}, -- NodeBox2
		}
	},
	selection_box = homedecor.nodebox.null
})

homedecor.register("well", {
	mesh = "homedecor_well.obj",
	tiles = {
		"homedecor_rope_texture.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"default_water.png",
		"default_cobble.png",
		"default_wood.png",
		"homedecor_shingles_wood.png"
	},
	inventory_image = "homedecor_well_inv.png",
	use_texture_alpha = "blend",
	description = S("Water well"),
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	selection_box = homedecor.nodebox.slab_y(2),
	collision_box = homedecor.nodebox.slab_y(2),
	expand = { top="placeholder" },
	sounds = default.node_sound_stone_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

homedecor_exterior = {}
homedecor_exterior.shrub_colors = {
	["green"] = S("green"),
	["red"] = S("red"),
	["yellow"] = S("yellow"),
}

local shrub_cbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }

for color, color_loc in pairs(homedecor_exterior.shrub_colors) do
	minetest.register_node(":homedecor:shrubbery_large_"..color, {
		description = S("Shrubbery (large, @1)", color_loc),
		drawtype = "mesh",
		mesh = "homedecor_cube.obj",
		tiles = {"homedecor_shrubbery_"..color..".png"},
		paramtype = "light",
		use_texture_alpha = "clip",
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, snappy=3, flammable=2},
		sounds = default.node_sound_leaves_defaults(),
	})

	minetest.register_node(":homedecor:shrubbery_"..color, {
		description = S("Shrubbery (@1)", color_loc),
		drawtype = "mesh",
		mesh = "homedecor_shrubbery.obj",
		tiles = {
			"homedecor_shrubbery_"..color..".png",
			"homedecor_shrubbery_"..color.."_bottom.png",
			"homedecor_shrubbery_roots.png"
		},
		paramtype = "light",
		use_texture_alpha = "clip",
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, snappy=3, flammable=2},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = shrub_cbox,
		collision_box = shrub_cbox,
	})
end

-- homedecor_fences

local materials = {
	{ S("brass"), "brass" },
	{ S("wrought iron"), "wrought_iron" },
}

for _, m in ipairs(materials) do

	local desc, name = unpack(m)

	homedecor.register("fence_"..name, {
		description = S("Fence/railing (@1)", desc),
		drawtype = "fencelike",
		tiles = {"homedecor_generic_metal_"..name..".png"},
		inventory_image = "homedecor_fence_"..name..".png",
		selection_box = homedecor.nodebox.bar_y(1/7),
		groups = {not_in_creative_inventory = 1, snappy=3},
		sounds = default.node_sound_wood_defaults(),
	})

end

-- other types of fences

homedecor.register("fence_picket", {
	description = S("Unpainted Picket Fence"),
	tiles = {
		"homedecor_blanktile.png",
		"homedecor_blanktile.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.1),
	node_box = homedecor.nodebox.slab_z(-0.002),
})

homedecor.register("fence_picket_corner", {
	description = S("Unpainted Picket Fence Corner"),
	tiles = {
		"homedecor_blanktile.png",
		"homedecor_blanktile.png",
		"homedecor_fence_picket.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket_backside.png",
		"homedecor_fence_picket.png",
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.1, -0.1),
	node_box = homedecor.nodebox.corner_xz(0.002, -0.002),
})

homedecor.register("fence_picket_white", {
	description = S("White Picket Fence"),
	tiles = {
		"homedecor_blanktile.png",
		"homedecor_blanktile.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.1),
	node_box = homedecor.nodebox.slab_z(-0.002),
})

homedecor.register("fence_picket_corner_white", {
	description = S("White Picket Fence Corner"),
	tiles = {
		"homedecor_blanktile.png",
		"homedecor_blanktile.png",
		"homedecor_fence_picket_white.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white_backside.png",
		"homedecor_fence_picket_white.png",
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.1, -0.1),
	node_box = homedecor.nodebox.corner_xz(0.002, -0.002),
})

homedecor.register("fence_privacy", {
	description = S("Wooden Privacy Fence"),
	tiles = {
		"homedecor_fence_privacy_tb.png",
		"homedecor_fence_privacy_tb.png",
		"homedecor_fence_privacy_sides.png",
		"homedecor_fence_privacy_sides.png",
		"homedecor_fence_privacy_backside.png",
		"homedecor_fence_privacy_front.png"
	},
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-3/16),
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16, 5/16, -5/16,  8/16, 7/16 },	-- left part
			{ -4/16, -8/16, 5/16,  3/16,  8/16, 7/16 },	-- middle part
			{  4/16, -8/16, 5/16,  8/16,  8/16, 7/16 },	-- right part
			{ -8/16, -2/16, 7/16,  8/16,  2/16, 8/16 },	-- connecting rung
		}
	},
})

homedecor.register("fence_privacy_corner", {
	description = S("Wooden Privacy Fence Corner"),
	tiles = {
		"homedecor_fence_privacy_corner_tb.png",
		"homedecor_fence_privacy_corner_tb.png^[transformFY",
		"homedecor_fence_privacy_corner_right.png",
		"homedecor_fence_privacy_backside2.png",
		"homedecor_fence_privacy_backside.png",
		"homedecor_fence_privacy_corner_front.png"
	},
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			homedecor.box.slab_z(-3/16),
			{ -0.5, -0.5, -0.5, -5/16, 0.5, 5/16 },
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -7/16, -8/16, 5/16, -5/16, 8/16, 7/16 },	-- left part
			{ -4/16, -8/16, 5/16,  3/16, 8/16, 7/16 },	-- middle part
			{  4/16, -8/16, 5/16,  8/16, 8/16, 7/16 },	-- right part
			{ -8/16, -2/16, 7/16,  8/16, 2/16, 8/16 },	-- back-side connecting rung

			{ -7/16, -8/16,  4/16, -5/16, 8/16,  7/16 },	-- back-most part
			{ -7/16, -8/16, -4/16, -5/16, 8/16,  3/16 },	-- middle part
			{ -7/16, -8/16, -8/16, -5/16, 8/16, -5/16 },	-- front-most part
			{ -8/16, -2/16, -8/16, -7/16, 2/16,  7/16 },	-- left-side connecting rung
		}
	},
})

homedecor.register("fence_barbed_wire", {
	description = S("Barbed Wire Fence"),
	mesh = "homedecor_fence_barbed_wire.obj",
	tiles = {"homedecor_fence_barbed_wire.png"},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.125),
	collision_box = homedecor.nodebox.slab_z(-0.125),
})

homedecor.register("fence_barbed_wire_corner", {
	description = S("Barbed Wire Fence Corner"),
	mesh = "homedecor_fence_barbed_wire_corner.obj",
	tiles = { "homedecor_fence_barbed_wire.png" },
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.125, -0.125),
	collision_box = homedecor.nodebox.corner_xz(0.125, -0.125),
})

homedecor.register("fence_chainlink", {
	description = S("Chainlink Fence"),
	mesh="homedecor_fence_chainlink.obj",
	tiles = {
		"homedecor_fence_chainlink_tb.png",
		"homedecor_fence_chainlink_tb.png",
		"homedecor_fence_chainlink_sides.png",
		"homedecor_fence_chainlink_sides.png",
		"homedecor_fence_chainlink_fb.png",
		"homedecor_fence_chainlink_fb.png",
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.125),
	collision_box = homedecor.nodebox.slab_z(-0.125),
})


homedecor.register("fence_chainlink_corner", {
	description = S("Chainlink Fence Corner"),
	mesh = "homedecor_fence_chainlink_corner.obj",
	tiles = {
		"homedecor_fence_chainlink_corner_top.png",
		"homedecor_fence_chainlink_corner_top.png",
		"homedecor_fence_chainlink_corner_front.png",
		"homedecor_fence_chainlink_corner_front.png",
		"homedecor_fence_chainlink_corner_front.png",
		"homedecor_fence_chainlink_corner_front.png",
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.125, -0.125),
	collision_box = homedecor.nodebox.corner_xz(0.125, -0.125),
})

homedecor.register("fence_wrought_iron_2", {
	description = S("Wrought Iron fence (type 2)"),
	tiles = {
		"homedecor_fence_wrought_iron_2_tb.png",
		"homedecor_fence_wrought_iron_2_tb.png",
		"homedecor_fence_wrought_iron_2_sides.png",
		"homedecor_fence_wrought_iron_2_sides.png",
		"homedecor_fence_wrought_iron_2_fb.png",
		"homedecor_fence_wrought_iron_2_fb.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.slab_z(-0.08),
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16,  14/32, -7.75/16,  8/16,  16/32 }, -- left post
			{  7.75/16, -8/16,  14/32,  8/16,  8/16,  16/32 }, -- right post
			{ -8/16,  7.75/16, 14/32,  8/16,  8/16, 16/32 }, -- top piece
			{ -8/16,  -0.015625, 14.75/32,  8/16,  0.015625, 15.25/32 }, -- cross piece
			{ -0.015625, -8/16,  14.75/32,  0.015625,  8/16,  15.25/32 }, -- cross piece
			{ -8/16, -8/16, 14/32,  8/16, -7.75/16, 16/32 }, -- bottom piece
			{ -8/16, -8/16,  15/32,  8/16,  8/16,  15/32 }	-- the grid itself
		}
	},
})

homedecor.register("fence_wrought_iron_2_corner", {
	description = S("Wrought Iron fence (type 2) Corner"),
	tiles = {
		"homedecor_fence_corner_wrought_iron_2_tb.png",
		"homedecor_fence_corner_wrought_iron_2_tb.png",
		"homedecor_fence_corner_wrought_iron_2_sides.png^[transformFX",
		"homedecor_fence_corner_wrought_iron_2_sides.png",
		"homedecor_fence_corner_wrought_iron_2_sides.png^[transformFX",
		"homedecor_fence_corner_wrought_iron_2_sides.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = homedecor.nodebox.corner_xz(0.08, -0.08),
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, 0.453125, -0.453125, 0.5, 0.5 }, -- corner edge
			{ -7.5/16,  7.75/16, 14/32,  8/16,  8/16, 16/32 },	-- top piece
			{ -7.5/16, -8/16, 14/32,  8/16, -7.75/16, 16/32 },	-- bottom piece
			{ -16/32,  7.75/16, -8/16, -14/32,  8/16,  8/16 },	-- top piece, side
			{ -16/32, -8/16, -8/16, -14/32, -7.75/16,  8/16 },	-- bottom piece, side
			{ -7.5/16, -8/16,  7.5/16,  8/16,  8/16,  7.5/16 },	-- the grid itself
			{ -7.5/16, -8/16, -8/16,  -7.5/16,  8/16,  7.5/16 },	-- the grid itself, side
			{ -15.5/32, -0.5, -0.5, -14.5/32, 0.5, -0.484375 }, -- left post side
			{  7.75/16, -8/16,  14.5/32,  8/16,  8/16,  15.5/32 }, -- right post
			{ -8/16,  -0.015625, 14.75/32,  8/16,  0.015625, 15.25/32 }, -- cross piece
			{ -0.015625, -8/16,  14.75/32,  0.015625,  8/16,  15.25/32 }, -- cross piece
			{ -15.25/32, -0.5, -0.015625, -14.75/32, 0.5, 0.015625 }, -- cross piece side
			{ -15.25/32, -0.015625, -0.5, -14.75/32, 0.015625, 0.5 } -- cross piece side
		}
	},
})

-- homedecor_bedroom

local sc_disallow = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil

local bed_sbox = {
	type = "wallmounted",
	wall_side = { -0.5, -0.5, -0.5, 0.5, 0.5, 1.5 }
}

local bed_cbox = {
	type = "wallmounted",
	wall_side = {
		{ -0.5, -0.5, -0.5, 0.5, -0.05, 1.5 },
		{ -0.5, -0.5, 1.44, 0.5, 0.5, 1.5 },
		{ -0.5, -0.5, -0.5, 0.5, 0.18, -0.44 },
	}
}

local kbed_sbox = {
	type = "wallmounted",
	wall_side = { -0.5, -0.5, -0.5, 1.5, 0.5, 1.5 }
}

local kbed_cbox = {
	type = "wallmounted",
	wall_side = {
		{ -0.5, -0.5, -0.5, 1.5, -0.05, 1.5 },
		{ -0.5, -0.5, 1.44, 1.5, 0.5, 1.5 },
		{ -0.5, -0.5, -0.5, 1.5, 0.18, -0.44 },
	}
}

homedecor.register("bed_regular", {
	mesh = "homedecor_bed_regular.obj",
	tiles = {
		{ name = "homedecor_bed_frame.png", color = 0xffffffff },
		{ name = "default_wood.png", color = 0xffffffff },
		{ name = "wool_white.png", color = 0xffffffff },
		"wool_white.png",
		{ name = "homedecor_bed_bottom.png", color = 0xffffffff },
		"wool_white.png^[brighten", -- pillow
	},
	inventory_image = "homedecor_bed_inv.png",
	paramtype2 = "colorwallmounted",
	description = S("Bed"),
	groups = {not_in_creative_inventory = 1, snappy=3, ud_param2_colorable = 1},
	selection_box = bed_sbox,
	node_box = bed_cbox,
	sounds = default.node_sound_wood_defaults(),
	on_rotate = sc_disallow or nil,
})

homedecor.register("bed_extended", {
	mesh = "homedecor_bed_extended.obj",
	tiles = {
		{ name = "homedecor_bed_frame.png", color = 0xffffffff },
		{ name = "default_wood.png", color = 0xffffffff },
		{ name = "wool_white.png", color = 0xffffffff },
		"wool_white.png",
		{ name = "homedecor_bed_bottom.png", color = 0xffffffff },
		"wool_white.png^[brighten",
	},
	paramtype2 = "colorwallmounted",
	selection_box = bed_sbox,
	node_box = bed_cbox,
	groups = {not_in_creative_inventory = 1, snappy=3, ud_param2_colorable = 1},
	sounds = default.node_sound_wood_defaults(),
	expand = { forward = "air" },
	on_rotate = sc_disallow or nil,
	drop = "homedecor:bed_regular"
})

homedecor.register("bed_kingsize", {
	mesh = "homedecor_bed_kingsize.obj",
	tiles = {
		{ name = "homedecor_bed_frame.png", color = 0xffffffff },
		{ name = "default_wood.png", color = 0xffffffff },
		{ name = "wool_white.png", color = 0xffffffff },
		"wool_white.png",
		{ name = "homedecor_bed_bottom.png", color = 0xffffffff },
		"wool_white.png^[brighten",
	},
	paramtype2 = "colorwallmounted",
	inventory_image = "homedecor_bed_kingsize_inv.png",
	description = S("Bed (king sized)"),
	groups = {not_in_creative_inventory = 1, snappy=3, ud_param2_colorable = 1},
	selection_box = kbed_sbox,
	node_box = kbed_cbox,
	sounds = default.node_sound_wood_defaults(),
	on_rotate = sc_disallow or nil,
})

for w, d in pairs({ ["mahogany"] = S("mahogany"), ["oak"] = S("oak") }) do
	homedecor.register("nightstand_"..w.."_one_drawer", {
		description = S("Nightstand with One Drawer (@1)", d),
		tiles = { 'homedecor_nightstand_'..w..'_tb.png',
			'homedecor_nightstand_'..w..'_tb.png^[transformFY',
			'homedecor_nightstand_'..w..'_lr.png^[transformFX',
			'homedecor_nightstand_'..w..'_lr.png',
			'homedecor_nightstand_'..w..'_back.png',
			'homedecor_nightstand_'..w..'_1_drawer_front.png'},
		node_box = {
			type = "fixed",
			fixed = {
				{ -8/16,     0, -30/64,  8/16,  8/16,   8/16 },	-- top half
				{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64},	-- drawer face
				{ -8/16, -8/16, -30/64, -7/16,     0,   8/16 },	-- left
				{  7/16, -8/16, -30/64,  8/16,     0,   8/16 },	-- right
				{ -8/16, -8/16,   7/16,  8/16,     0,   8/16 },	-- back
				{ -8/16, -8/16, -30/64,  8/16, -7/16,   8/16 }	-- bottom
			}
		},
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = { type = "regular" },
	})

	homedecor.register("nightstand_"..w.."_two_drawers", {
		description = S("Nightstand with Two Drawers (@1)", d),
		tiles = { 'homedecor_nightstand_'..w..'_tb.png',
			'homedecor_nightstand_'..w..'_tb.png^[transformFY',
			'homedecor_nightstand_'..w..'_lr.png^[transformFX',
			'homedecor_nightstand_'..w..'_lr.png',
			'homedecor_nightstand_'..w..'_back.png',
			'homedecor_nightstand_'..w..'_2_drawer_front.png'},
		node_box = {
			type = "fixed",
			fixed = {
				{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
				{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64 },	-- top drawer face
				{ -7/16, -7/16, -32/64,  7/16, -1/16, -29/64 },	-- bottom drawer face
			}
		},
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = { type = "regular" },
	})
end

-- homedecor_foyer

homedecor.register("coatrack_wallmount", {
	tiles = { homedecor.plain_wood },
	inventory_image = "homedecor_coatrack_wallmount_inv.png",
	description = S("Wall-mounted coat rack"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0, 0.4375, 0.375, 0.14, 0.5}, -- NodeBox1
			{-0.3025, 0.0475, 0.375, -0.26, 0.09, 0.4375}, -- NodeBox2
			{0.26, 0.0475, 0.375, 0.3025, 0.09, 0.4375}, -- NodeBox3
			{0.0725, 0.0475, 0.375, 0.115, 0.09, 0.4375}, -- NodeBox4
			{-0.115, 0.0475, 0.375, -0.0725, 0.09, 0.4375}, -- NodeBox5
			{0.24, 0.025, 0.352697, 0.3225, 0.115, 0.375}, -- NodeBox6
			{-0.3225, 0.025, 0.352697, -0.24, 0.115, 0.375}, -- NodeBox7
			{-0.135, 0.025, 0.352697, -0.0525, 0.115, 0.375}, -- NodeBox8
			{0.0525, 0.025, 0.352697, 0.135, 0.115, 0.375}, -- NodeBox9
		}
	},
})

homedecor.register("coat_tree", {
	mesh = "homedecor_coatrack.obj",
	tiles = {
		homedecor.plain_wood,
		"homedecor_generic_wood_old.png"
	},
	inventory_image = "homedecor_coatrack_inv.png",
	description = S("Coat tree"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	expand = { top="placeholder" },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.4, -0.5, -0.4, 0.4, 1.5, 0.4 }
	},
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

local mat_colors = {
	{ "green", S("Green welcome mat") },
	{ "brown", S("Brown welcome mat") },
	{ "grey",  S("Grey welcome mat") },
}

for _, mat in ipairs(mat_colors) do
	local color, desc = unpack(mat)
	homedecor.register("welcome_mat_"..color, {
		description = desc,
		tiles = {
			"homedecor_welcome_mat_"..color..".png",
			"homedecor_welcome_mat_bottom.png",
			"homedecor_welcome_mat_"..color..".png",
		},
		groups = {not_in_creative_inventory = 1, crumbly=3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.375, 0.5, -0.46875, 0.375 }
		}
	})
end

-- homedecor_furniture

local table_colors = {
	{ "",           S("Table"),           homedecor.plain_wood },
	{ "_mahogany",  S("Mahogany Table"),  homedecor.mahogany_wood },
	{ "_white",     S("White Table"),     homedecor.white_wood }
}

for _, t in ipairs(table_colors) do
	local suffix, desc, texture = unpack(t)

	homedecor.register("table"..suffix, {
		description = desc,
		tiles = { texture },
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.4, -0.5, -0.4, -0.3,  0.4, -0.3 },
				{  0.3, -0.5, -0.4,  0.4,  0.4, -0.3 },
				{ -0.4, -0.5,  0.3, -0.3,  0.4,  0.4 },
				{  0.3, -0.5,  0.3,  0.4,  0.4,  0.4 },
				{ -0.5,  0.4, -0.5,  0.5,  0.5,  0.5 },
				{ -0.4, -0.2, -0.3, -0.3, -0.1,  0.3 },
				{  0.3, -0.2, -0.4,  0.4, -0.1,  0.3 },
				{ -0.3, -0.2, -0.4,  0.4, -0.1, -0.3 },
				{ -0.3, -0.2,  0.3,  0.3, -0.1,  0.4 },
			},
		},
		groups = {not_in_creative_inventory = 1, snappy=2,choppy=2,oddly_breakable_by_hand=2},
		sounds = default.node_sound_wood_defaults(),
	})
end

local ob_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
}

minetest.register_node(":homedecor:openframe_bookshelf", {
	description = S("Bookshelf (open-frame)"),
	drawtype = "mesh",
	mesh = "homedecor_openframe_bookshelf.obj",
	tiles = {
		"homedecor_openframe_bookshelf_books.png",
		"default_wood.png"
	},
	groups = {not_in_creative_inventory = 1, choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = ob_cbox,
	collision_box = ob_cbox,
})

homedecor.register("wall_shelf", {
	description = S("Wall Shelf"),
	tiles = {
		"default_wood.png",
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4, 0.47, 0.5, 0.47, 0.5},
			{-0.5, 0.47, -0.1875, 0.5, 0.5, 0.5}
		}
	}
})

-- homedecor_furniture_medieval

homedecor.register("bars", {
	description = S("Bars"),
	tiles = { { name = "homedecor_generic_metal.png^[transformR270", color = homedecor.color_black } },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.50, -0.10, -0.4,  0.50,  0.10 },
			{ -0.1, -0.50, -0.10,  0.1,  0.50,  0.10 },
			{  0.4, -0.50, -0.10,  0.5,  0.50,  0.10 },
			{ -0.5, -0.50, -0.05,  0.5, -0.45,  0.05 },
			{ -0.5,  0.45, -0.05,  0.5,  0.50,  0.05 },
		},
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.1, 0.5, 0.5, 0.1 },
	},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

--L Binding Bars
homedecor.register("L_binding_bars", {
	description = S("Binding Bars"),
	tiles = { { name = "homedecor_generic_metal.png^[transformR270", color = homedecor.color_black } },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.10, -0.50, -0.50,  0.10,  0.50, -0.40 },
			{ -0.15, -0.50, -0.15,  0.15,  0.50,  0.15 },
			{  0.40, -0.50, -0.10,  0.50,  0.50,  0.10 },
			{  0.00, -0.50, -0.05,  0.50, -0.45,  0.05 },
			{ -0.05, -0.50, -0.50,  0.05, -0.45,  0.00 },
			{  0.00,  0.45, -0.05,  0.50,  0.50,  0.05 },
			{ -0.05,  0.45, -0.50,  0.05,  0.50,  0.00 },
		},
	},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

local chain_cbox = {
	type = "fixed",
	fixed = {-1/2, -1/2, 1/4, 1/2, 1/2, 1/2},
}

homedecor.register("chains", {
	description = S("Chains"),
	mesh = "forniture_chains.obj",
	tiles = { { name = "homedecor_generic_metal.png", color = homedecor.color_black } },
	inventory_image="forniture_chains_inv.png",
	selection_box = chain_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

-- homedecor_gastronomy

local cutlery_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16, -8/16, -6/16, 5/16, -7/16, 2/16 },
		{ -2/16, -8/16,  2/16, 2/16, -4/16, 6/16 }
	}
}

homedecor.register("cutlery_set", {
	drawtype = "mesh",
	mesh = "homedecor_cutlery_set.obj",
	tiles = { "homedecor_cutlery_set.png"	},
	inventory_image = "homedecor_cutlery_set_inv.png",
	description = S("Cutlery set"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = cutlery_cbox,
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
})

local bottle_cbox = {
	type = "fixed",
	fixed = {
		{ -0.125, -0.5, -0.125, 0.125, 0, 0.125}
	}
}

local fbottle_cbox = {
	type = "fixed",
	fixed = {
		{ -0.375, -0.5, -0.3125, 0.375, 0, 0.3125 }
	}
}

local bottle_colors = {
	{ "brown", S("Brown bottle"), S("Four brown bottles") },
	{ "green", S("Green bottle"), S("Four green bottles") },
}

for _, b in ipairs(bottle_colors) do

	local name, desc, desc4 = unpack(b)

	homedecor.register("bottle_"..name, {
		tiles = { "homedecor_bottle_"..name..".png" },
		inventory_image = "homedecor_bottle_"..name.."_inv.png",
		description = desc,
		mesh = "homedecor_bottle.obj",
		walkable = false,
		groups = {not_in_creative_inventory = 1, snappy=3},
		sounds = default.node_sound_glass_defaults(),
		selection_box = bottle_cbox
	})

	-- 4-bottle sets

	homedecor.register("4_bottles_"..name, {
		tiles = {
			"homedecor_bottle_"..name..".png",
			"homedecor_bottle_"..name..".png"
		},
		inventory_image = "homedecor_4_bottles_"..name.."_inv.png",
		description = desc4,
		mesh = "homedecor_4_bottles.obj",
		walkable = false,
		groups = {not_in_creative_inventory = 1, snappy=3},
		sounds = default.node_sound_glass_defaults(),
		selection_box = fbottle_cbox
	})
end

homedecor.register("4_bottles_multi", {
	tiles = {
		"homedecor_bottle_brown.png",
		"homedecor_bottle_green.png"
	},
	inventory_image = "homedecor_4_bottles_multi_inv.png",
	description = S("Four misc brown/green bottles"),
	mesh = "homedecor_4_bottles.obj",
	groups = {not_in_creative_inventory = 1, snappy=3},
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
	selection_box = fbottle_cbox
})

local wine_cbox = homedecor.nodebox.slab_z(-0.75)
homedecor.register("wine_rack", {
	description = S("Wine rack"),
	mesh = "homedecor_wine_rack.obj",
	tiles = {
		"homedecor_generic_wood_red.png",
		"homedecor_bottle_brown.png",
		"homedecor_bottle_brown2.png",
		"homedecor_bottle_brown3.png",
		"homedecor_bottle_brown4.png"
	},
	inventory_image = "homedecor_wine_rack_inv.png",
	groups = {not_in_creative_inventory = 1, choppy=2},
	selection_box = wine_cbox,
	collision_box = wine_cbox,
	sounds = default.node_sound_defaults(),
})

homedecor.register("beer_tap", {
	description = S("Beer tap"),
	mesh = "homedecor_beer_taps.obj",
	tiles = {
		"homedecor_generic_metal_bright.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black }
	},
	inventory_image = "homedecor_beertap_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.4375, 0.25, 0.235, 0 }
	},
})

local beer_cbox = {
	type = "fixed",
	fixed = { -5/32, -8/16, -9/32 , 7/32, -2/16, 1/32 }
}

homedecor.register("beer_mug", {
	description = S("Beer mug"),
	drawtype = "mesh",
	mesh = "homedecor_beer_mug.obj",
	tiles = { "homedecor_beer_mug.png" },
	inventory_image = "homedecor_beer_mug_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy=3, oddly_breakable_by_hand=3 },
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
	selection_box = beer_cbox,
})

local svm_cbox = {
	type = "fixed",
	fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
}

homedecor.register("soda_machine", {
	description = S("Soda vending machine"),
	mesh = "homedecor_soda_machine.obj",
	tiles = {"homedecor_soda_machine.png"},
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = svm_cbox,
	collision_box = svm_cbox,
	expand = { top="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

-- coffee!
-- coffee!
-- coffee!

local cm_cbox = {
	type = "fixed",
	fixed = {
		{     0, -8/16,     0,  7/16,  3/16,  8/16 },
		{ -4/16, -8/16, -6/16, -1/16, -5/16, -3/16 }
	}
}

homedecor.register("coffee_maker", {
	mesh = "homedecor_coffeemaker.obj",
	tiles = {
		"homedecor_coffeemaker_decanter.png",
		"homedecor_coffeemaker_cup.png",
		"homedecor_coffeemaker_case.png",
	},
	description = S("Coffee Maker"),
	inventory_image = "homedecor_coffeemaker_inv.png",
	walkable = false,
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = cm_cbox,
	node_box = cm_cbox,
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

homedecor.register("toaster", {
	description = S("Toaster"),
	tiles = { "homedecor_toaster_sides.png" },
	inventory_image = "homedecor_toaster_inv.png",
	use_texture_alpha = "clip",
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.125, 0.125, -0.3125, 0.125}, -- NodeBox1
		},
	},
})

homedecor.register("toaster_loaf", {
	tiles = {
		"homedecor_toaster_toploaf.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png",
		"homedecor_toaster_sides.png"
	},
	use_texture_alpha = "clip",
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.125, 0.125, -0.3125, 0.125}, -- NodeBox1
			{-0.03125, -0.3125, -0.0935, 0, -0.25, 0.0935}, -- NodeBox2
			{0.0625, -0.3125, -0.0935, 0.0935, -0.25, 0.0935}, -- NodeBox3
		},
	},
	drop = "homedecor:toaster"
})

-- homedecor_kitchen

-- steel-textured fridge
homedecor.register("refrigerator_steel", {
	mesh = "homedecor_refrigerator.obj",
	tiles = { "homedecor_refrigerator_steel.png" },
	inventory_image = "homedecor_refrigerator_steel_inv.png",
	description = S("Refrigerator (stainless steel)"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = homedecor.nodebox.slab_y(2),
	collision_box = homedecor.nodebox.slab_y(2),
	expand = { top="placeholder" },
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

-- white, enameled fridge
homedecor.register("refrigerator_white", {
	mesh = "homedecor_refrigerator.obj",
	tiles = { "homedecor_refrigerator_white.png" },
	inventory_image = "homedecor_refrigerator_white_inv.png",
	description = S("Refrigerator"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = homedecor.nodebox.slab_y(2),
	collision_box = homedecor.nodebox.slab_y(2),
	sounds = default.node_sound_stone_defaults(),
	expand = { top="placeholder" },
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
})

-- kitchen "furnaces"
homedecor.register_furnace("oven", {
	description = S("Oven"),
	tile_format = "homedecor_oven_%s%s.png",
	output_slots = 4,
	output_width = 2,
	cook_speed = 1.25,
})

homedecor.register_furnace("oven_steel", {
	description = S("Oven (stainless steel)"),
	tile_format = "homedecor_oven_steel_%s%s.png",
	output_slots = 4,
	output_width = 2,
	cook_speed = 1.25,
})

homedecor.register_furnace("microwave_oven", {
	description = S("Microwave Oven"),
	tiles = {
		"homedecor_microwave_top.png", "homedecor_microwave_top.png^[transformR180",
		"homedecor_microwave_top.png^[transformR270", "homedecor_microwave_top.png^[transformR90",
		"homedecor_microwave_top.png^[transformR180", "homedecor_microwave_front.png"
	},
	tiles_active = {
		"homedecor_microwave_top.png", "homedecor_microwave_top.png^[transformR180",
		"homedecor_microwave_top.png^[transformR270", "homedecor_microwave_top.png^[transformR90",
		"homedecor_microwave_top.png^[transformR180", "homedecor_microwave_front_active.png"
	},
	output_slots = 2,
	output_width = 2,
	cook_speed = 1.5,
	extra_nodedef_fields = {
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.125, 0.5, 0.125, 0.5 },
		},
		use_texture_alpha = "clip",
	},
})

homedecor.register("dishwasher", {
	description = S("Dishwasher"),
	drawtype = "nodebox",
	tiles = {
		"homedecor_dishwasher_top.png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, 0.1875, 0.1875},
			{-0.4375, -0.5, -0.5, 0.4375, 0.4375, 0.4375},
		}
	},
	selection_box = { type = "regular" },
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
})

local materials = { ["granite"] = S("granite"), ["marble"] = S("marble"), ["steel"] = S("steel"), ["wood"] = S("wood") }

for m, m_loc in pairs(materials) do
homedecor.register("dishwasher_"..m, {
	description = S("Dishwasher (@1)", m_loc),
	tiles = {
		"homedecor_kitchen_cabinet_top_"..m..".png",
		"homedecor_dishwasher_bottom.png",
		"homedecor_dishwasher_sides.png",
		"homedecor_dishwasher_sides.png^[transformFX",
		"homedecor_dishwasher_back.png",
		"homedecor_dishwasher_front.png"
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_stone_defaults(),
})
end

local cabinet_sides = "(default_wood.png^[transformR90)^homedecor_kitchen_cabinet_bevel.png"
local cabinet_bottom = "(default_wood.png^[colorize:#000000:100)"
	.."^(homedecor_kitchen_cabinet_bevel.png^[colorize:#46321580)"
local function N_(x) return x end
local counter_materials = { "", N_("granite"), N_("marble"), N_("steel") }

for _, mat in ipairs(counter_materials) do

	local desc = S("Kitchen Cabinet")
	local material = ""

	if mat ~= "" then
		desc = S("Kitchen Cabinet (@1 top)", S(mat))
		material = "_"..mat
	end

	homedecor.register("kitchen_cabinet"..material, {
		description = desc,
		tiles = { 'homedecor_kitchen_cabinet_top'..material..'.png',
				cabinet_bottom,
				cabinet_sides,
				cabinet_sides,
				cabinet_sides,
				'homedecor_kitchen_cabinet_front.png'},
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
	})
end

local kitchen_cabinet_half_box = homedecor.nodebox.slab_y(0.5, 0.5)
homedecor.register("kitchen_cabinet_half", {
	description = S('Half-height Kitchen Cabinet (on ceiling)'),
	tiles = {
		cabinet_sides,
		cabinet_bottom,
		cabinet_sides,
		cabinet_sides,
		cabinet_sides,
		'homedecor_kitchen_cabinet_front_half.png'
	},
	selection_box = kitchen_cabinet_half_box,
	node_box = kitchen_cabinet_half_box,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("kitchen_cabinet_with_sink", {
	description = S("Kitchen Cabinet with sink"),
	mesh = "homedecor_kitchen_sink.obj",
	tiles = {
		"homedecor_kitchen_sink_top.png",
		"homedecor_kitchen_cabinet_front.png",
		cabinet_sides,
		cabinet_bottom
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -8/16, -8/16,  8/16, 6/16,  8/16 },
			{ -8/16,  6/16, -8/16, -6/16, 8/16,  8/16 },
			{  6/16,  6/16, -8/16,  8/16, 8/16,  8/16 },
			{ -8/16,  6/16, -8/16,  8/16, 8/16, -6/16 },
			{ -8/16,  6/16,  6/16,  8/16, 8/16,  8/16 },
		}
	},
	on_destruct = function(pos)
		homedecor.stop_particle_spawner({x=pos.x, y=pos.y+1, z=pos.z})
	end
})

local cp_cbox = {
	type = "fixed",
	fixed = { -0.375, -0.5, -0.5, 0.375, -0.3125, 0.3125 }
}

homedecor.register("copper_pans", {
	description = S("Copper pans"),
	mesh = "homedecor_copper_pans.obj",
	tiles = { "homedecor_polished_copper.png" },
	inventory_image = "homedecor_copper_pans_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	selection_box = cp_cbox,
	walkable = false,
	on_place = minetest.rotate_node
})

local kf_cbox = {
	type = "fixed",
	fixed = { -2/16, -8/16, 1/16, 2/16, -1/16, 8/16 }
}

homedecor.register("kitchen_faucet", {
	mesh = "homedecor_kitchen_faucet.obj",
	tiles = { "homedecor_generic_metal_bright.png" },
	inventory_image = "homedecor_kitchen_faucet_inv.png",
	description = S("Kitchen Faucet"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = kf_cbox,
	walkable = false,
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
	on_destruct = homedecor.stop_particle_spawner
})

homedecor.register("paper_towel", {
	mesh = "homedecor_paper_towel.obj",
	tiles = {
		"homedecor_generic_quilted_paper.png",
		"default_wood.png"
	},
	inventory_image = "homedecor_paper_towel_inv.png",
	description = S("Paper towels"),
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.4375, 0.125, 0.0625, 0.4375, 0.4375, 0.5 }
	},
})

-- homedecor_laundry

homedecor.register("washing_machine", {
	description = S("Washing Machine"),
	tiles = {
		"homedecor_washing_machine_top.png",
		"homedecor_washing_machine_bottom.png",
		"homedecor_washing_machine_sides.png",
		"homedecor_washing_machine_sides.png^[transformFX",
		"homedecor_washing_machine_back.png",
		"homedecor_washing_machine_front.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.375, 0.375},
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
		}
	},
	selection_box = { type = "regular" },
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
})

homedecor.register("dryer", {
	description = S("Tumble dryer"),
	tiles = {
		"homedecor_dryer_top.png",
		"homedecor_dryer_bottom.png",
		"homedecor_dryer_sides.png",
		"homedecor_dryer_sides.png^[transformFX",
		"homedecor_dryer_back.png",
		"homedecor_dryer_front.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.375, 0.375},
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
		}
	},
	selection_box = { type = "regular" },
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
})

local ib_cbox = {
	type = "fixed",
	fixed = { -6/16, -8/16, -4/16, 17/16, 4/16, 4/16 }
}

homedecor.register("ironing_board", {
	description = S("Ironing board"),
	mesh = "homedecor_ironing_board.obj",
	tiles = {
		"wool_grey.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
	},
	expand = {right = "placeholder"},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	selection_box = ib_cbox,
	collision_box = ib_cbox
})

-- homedecor_lighting

homedecor_lighting = {}
local function is_protected(pos, clicker)
	if minetest.is_protected(pos, clicker:get_player_name()) then
		minetest.record_protection_violation(pos,
		clicker:get_player_name())
		return true
	end
	return false
end

-- control and brightness for dimmable lamps
local word_to_bright = {
	["off"] = 0,
	["low"] = 3,
	["med"] = 7,
	["hi"]  = 11,
	["on"]  = 14,
	["max"] = 14,
}

local rules_alldir = {
	{x =  0, y =  0, z =  1},
	{x = -1, y =  0, z =  0},
	{x =  1, y =  0, z =  0},
	{x =  0, y =  0, z = -1},  -- borrowed from lightstones
	{x =  0, y =  1, z =  1},
	{x = -1, y =  1, z =  0},
	{x =  0, y =  1, z =  0},
	{x =  1, y =  1, z =  0},
	{x =  0, y =  1, z = -1},
	{x =  0, y = -1, z =  1},
	{x = -1, y = -1, z =  0},
	{x =  0, y = -1, z =  0},
	{x =  1, y = -1, z =  0},
	{x =  0, y = -1, z = -1},
}

-- turn on/off, cycle brightness

function homedecor_lighting.toggle_light(pos, node, clicker, itemstack, pointed_thing)
	if is_protected(pos, clicker) then return end
	local sep = string.find(node.name, "_", -5)
	local level = string.sub(node.name, sep + 1)
	local n = tonumber(level) or 0

	local newsuff
	if level == "on" then
		newsuff = "_off"
	elseif level == "off" then
		newsuff = "_on"
	elseif n > 3 then
		newsuff = "_0"
	else
		newsuff = "_14"
	end

	minetest.swap_node(pos, {name = string.sub(node.name, 1, sep - 1)..newsuff, param2 = node.param2})
end

------------------
-- Dimmable lights

for brightness_level = 0, 14 do

	local tiles
	local overlay

	local onflag = (brightness_level > 0)
	local nici = (brightness_level ~= 14) and 1 or nil

	local gen_ls_tex_white =           "homedecor_generic_light_source_off.png"
	if onflag then gen_ls_tex_white =  "homedecor_generic_light_source_white.png" end

	local gen_ls_tex_yellow =          "homedecor_generic_light_source_off.png"
	if onflag then gen_ls_tex_yellow = "homedecor_generic_light_source_yellow.png" end

	local h = (brightness_level == 0) and "0" or string.format("%x", brightness_level+1)
	local brightness_hex = tonumber("0xff"..string.rep(h, 6))

	local glowlight_nodebox = {
		half = homedecor.nodebox.slab_y(1/2),
		quarter = homedecor.nodebox.slab_y(1/4),
		small_cube = {
				type = "fixed",
				fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
		},
	}

	local base =        "homedecor_glowlight_base.png"

	local tb_edges =    "homedecor_glowlight_tb_edges.png"
	local sides_edges = "homedecor_glowlight_thick_sides_edges.png"
	local sides_glare = "homedecor_glowlight_thick_sides_glare.png"

	if onflag then
		tiles = {
			"("..base.."^"..tb_edges..")^[brighten",
			"("..base.."^"..tb_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
		}
		overlay = {
			{ name = "homedecor_glowlight_top_glare.png", color = "white"},
			"",
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
		}
	else
		tiles = {
			base.."^"..tb_edges,
			base.."^"..tb_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
		}
		overlay = nil
	end

	minetest.register_node(":homedecor:glowlight_half_"..brightness_level, {
		description = S("Thick Glowlight"),
		tiles = tiles,
		overlay_tiles = overlay,
		use_texture_alpha = "clip",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "colorwallmounted",
		selection_box = {
			type = "wallmounted",
			wall_top =    { -0.5,    0, -0.5, 0.5, 0.5, 0.5 },
			wall_bottom = { -0.5, -0.5, -0.5, 0.5,   0, 0.5 },
			wall_side =   { -0.5, -0.5, -0.5,   0, 0.5, 0.5 }
		},
		node_box = glowlight_nodebox.half,
		groups = {not_in_creative_inventory = 1,  snappy = 3, ud_param2_colorable = 1},
		light_source = brightness_level,
		sounds = default.node_sound_glass_defaults(),
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:glowlight_half_on"}, inherit_color = true },
			}
		},
	})

	sides_edges = "homedecor_glowlight_thin_sides_edges.png"
	sides_glare = "homedecor_glowlight_thin_sides_glare.png"

	if onflag then
		tiles = {
			"("..base.."^"..tb_edges..")^[brighten",
			"("..base.."^"..tb_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
		}
		overlay = {
			{ name = "homedecor_glowlight_top_glare.png", color = "white"},
			"",
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
		}
	else
		tiles = {
			base.."^"..tb_edges,
			base.."^"..tb_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
		}
		overlay = nil
	end

	minetest.register_node(":homedecor:glowlight_quarter_"..brightness_level, {
		description = S("Thin Glowlight"),
		tiles = tiles,
		overlay_tiles = overlay,
		use_texture_alpha = "clip",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "colorwallmounted",
		selection_box = {
			type = "wallmounted",
			wall_top =    { -0.5, 0.25, -0.5,   0.5,   0.5, 0.5 },
			wall_bottom = { -0.5, -0.5, -0.5,   0.5, -0.25, 0.5 },
			wall_side =   { -0.5, -0.5, -0.5, -0.25,   0.5, 0.5 }
		},
		node_box = glowlight_nodebox.quarter,
		groups = {not_in_creative_inventory = 1,  snappy = 3, ud_param2_colorable = 1},
		light_source = brightness_level,
		sounds = default.node_sound_glass_defaults(),
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:glowlight_quarter_on"}, inherit_color = true },
			}
		},
	})

	tb_edges =    "homedecor_glowlight_cube_tb_edges.png"
	sides_edges = "homedecor_glowlight_cube_sides_edges.png"
	sides_glare = "homedecor_glowlight_cube_sides_glare.png"

	if onflag then
		tiles = {
			"("..base.."^"..tb_edges..")^[brighten",
			"("..base.."^"..tb_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
			"("..base.."^"..sides_edges..")^[brighten",
		}
		overlay = {
			{ name = "homedecor_glowlight_cube_top_glare.png", color = "white"},
			"",
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
			{ name = sides_glare, color = "white"},
		}
	else
		tiles = {
			base.."^"..tb_edges,
			base.."^"..tb_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
			base.."^"..sides_edges,
		}
		overlay = nil
	end

	minetest.register_node(":homedecor:glowlight_small_cube_"..brightness_level, {
		description = S("Small Glowlight Cube"),
		tiles = tiles,
		overlay_tiles = overlay,
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "colorwallmounted",
		drawtype = "nodebox",
		selection_box = {
			type = "wallmounted",
			wall_top =    { -0.25,    0,  -0.25, 0.25,  0.5, 0.25 },
			wall_bottom = { -0.25, -0.5,  -0.25, 0.25,    0, 0.25 },
			wall_side =   {  -0.5, -0.25, -0.25,    0, 0.25, 0.25 }
		},
		node_box = glowlight_nodebox.small_cube,
		groups = {not_in_creative_inventory = 1,  snappy = 3, ud_param2_colorable = 1},
		light_source = brightness_level,
		sounds = default.node_sound_glass_defaults(),
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:glowlight_small_cube_on"}, inherit_color = true },
			}
		},
	})

	local lighttex

	if onflag then
		local b = (brightness_level > 6) and brightness_level or 6
		local brightened = "^[multiply:#"..string.rep(string.format("%x", b), 6)

		lighttex = {
			name="homedecor_plasma_storm.png"..brightened,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		}
	else
		lighttex = "homedecor_plasma_lamp_off.png"
	end

	homedecor.register("plasma_lamp_"..brightness_level, {
		description = S("Plasma Lamp/Light"),
		drawtype = "mesh",
		mesh = "plasma_lamp.obj",
		tiles = {
			"default_gold_block.png",
			lighttex
		},
		use_texture_alpha = "clip",
		light_source = brightness_level,
		sunlight_propagates = true,
		groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=3},
		sounds = default.node_sound_glass_defaults(),
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:plasma_lamp_on"}},
			}
		},
	})

	local gl_cbox = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.45, 0.25 },
	}

	homedecor.register("ground_lantern_"..brightness_level, {
		description = S("Ground Lantern/Light"),
		mesh = "homedecor_ground_lantern.obj",
		tiles = { gen_ls_tex_yellow, "homedecor_generic_metal_wrought_iron.png" },
		use_texture_alpha = "clip",
		inventory_image = "homedecor_ground_lantern_inv.png",
		wield_image = "homedecor_ground_lantern_inv.png",
		groups = {not_in_creative_inventory = 1, snappy=3},
		light_source = brightness_level,
		selection_box = gl_cbox,
		walkable = false,
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:ground_lantern_on"}},
			}
		},
	})

	local hl_cbox = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.2, 0.25, 0.5, 0.5 },
	}

	homedecor.register("hanging_lantern_"..brightness_level, {
		description = S("Hanging Lantern/Light"),
		mesh = "homedecor_hanging_lantern.obj",
		tiles = { "homedecor_generic_metal_wrought_iron.png", gen_ls_tex_yellow },
		use_texture_alpha = "clip",
		inventory_image = "homedecor_hanging_lantern_inv.png",
		wield_image = "homedecor_hanging_lantern_inv.png",
		groups = {not_in_creative_inventory = 1, snappy=3},
		light_source = brightness_level,
		selection_box = hl_cbox,
		walkable = false,
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:hanging_lantern_on"}},
			}
		},
	})

	local cl_cbox = {
		type = "fixed",
		fixed = { -0.35, -0.45, -0.35, 0.35, 0.5, 0.35 }
	}

	homedecor.register("ceiling_lantern_"..brightness_level, {
		drawtype = "mesh",
		mesh = "homedecor_ceiling_lantern.obj",
		tiles = { gen_ls_tex_yellow, "homedecor_generic_metal_wrought_iron.png" },
		use_texture_alpha = "clip",
		inventory_image = "homedecor_ceiling_lantern_inv.png",
		description = S("Ceiling Lantern/Light"),
		groups = {not_in_creative_inventory = 1, snappy=3},
		light_source = brightness_level,
		selection_box = cl_cbox,
		walkable = false,
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:ceiling_lantern_on"}},
			}
		},
	})

	if not minetest.get_modpath("darkage") then
		homedecor.register("lattice_lantern_large_"..brightness_level, {
			description = S("Lattice lantern/Light (large)"),
			tiles = { gen_ls_tex_yellow.."^homedecor_lattice_lantern_large_overlay.png" },
			groups = {not_in_creative_inventory = 1,  snappy = 3},
			light_source = brightness_level,
			sounds = default.node_sound_glass_defaults(),
			on_rightclick = homedecor_lighting.toggle_light,
			drop = {
				items = {
					{items = {"homedecor:lattice_lantern_large_on"}},
				}
			},
		})
	end

	local lighttex_tb
	local lighttex_sides

	if onflag then
		lighttex_tb =    "homedecor_lattice_lantern_small_tb_light.png"
		lighttex_sides = "homedecor_lattice_lantern_small_sides_light.png"
	else
		lighttex_tb =    "homedecor_generic_light_source_off.png"
		lighttex_sides = "homedecor_generic_light_source_off.png"
	end

	homedecor.register("lattice_lantern_small_"..brightness_level, {
		description = S("Lattice lantern/light (small)"),
		tiles = {
			lighttex_tb.."^homedecor_lattice_lantern_small_tb_overlay.png",
			lighttex_tb.."^homedecor_lattice_lantern_small_tb_overlay.png",
			lighttex_sides.."^homedecor_lattice_lantern_small_sides_overlay.png"
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
		},
		node_box = {
			type = "fixed",
			fixed = { -0.25, -0.5, -0.25, 0.25, 0, 0.25 }
		},
		groups = {not_in_creative_inventory = 1,  snappy = 3},
		light_source = brightness_level,
		use_texture_alpha = "clip",
		sounds = default.node_sound_glass_defaults(),
		on_place = minetest.rotate_node,
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:lattice_lantern_small_on"}},
			}
		},
	})

	-- "gooseneck" style desk lamps

	local dlamp_cbox = {
		type = "wallmounted",
		wall_side = { -0.2, -0.5, -0.15, 0.32, 0.12, 0.15 },
	}

	homedecor.register("desk_lamp_"..brightness_level, {
		description = S("Desk Lamp/Light"),
		mesh = "homedecor_desk_lamp.obj",
		tiles = {
			"homedecor_generic_metal.png",
			"homedecor_generic_metal.png",
			{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
			{ name = gen_ls_tex_white, color = brightness_hex },
		},
		inventory_image = "homedecor_desk_lamp_inv.png",
		paramtype = "light",
		paramtype2 = "colorwallmounted",
		selection_box = dlamp_cbox,
		node_box = dlamp_cbox,
		walkable = false,
		groups = {not_in_creative_inventory = 1, snappy=3, ud_param2_colorable = 1},
		light_source = brightness_level,
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:desk_lamp_on"}, inherit_color = true },
			}
		},
	})

	-- "kitchen"/"dining room" ceiling lamp

	homedecor.register("ceiling_lamp_"..brightness_level, {
		description = S("Ceiling Lamp/Light"),
		mesh = "homedecor_ceiling_lamp.obj",
		tiles = {
			"homedecor_generic_metal_brass.png",
			"homedecor_ceiling_lamp_glass.png",
			gen_ls_tex_white,
			{ name = "homedecor_generic_plastic.png", color = 0xff442d04 },
		},
		inventory_image = "homedecor_ceiling_lamp_inv.png",
		light_source = brightness_level,
		groups = {not_in_creative_inventory = 1, snappy=3},
		walkable = false,
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:ceiling_lamp_on"}},
			}
		},
	})

	local tlamp_cbox = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 }
	}

	local slamp_cbox = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 1.5, 0.25 }
	}

	local wool_brightened = "wool_grey.png^[colorize:#ffffff:"..(brightness_level * 15)

	homedecor.register("table_lamp_"..brightness_level, {
		description = S("Table Lamp/Light"),
		mesh = "homedecor_table_lamp.obj",
		tiles = {
			wool_brightened,
			{ name = gen_ls_tex_white, color = brightness_hex },
			{ name = "homedecor_generic_wood_red.png", color = 0xffffffff },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		},
		inventory_image = "homedecor_table_lamp_foot_inv.png^homedecor_table_lamp_top_inv.png",
		paramtype = "light",
		paramtype2 = "color",
		walkable = false,
		light_source = brightness_level,
		selection_box = tlamp_cbox,
		sounds = default.node_sound_wood_defaults(),
		groups = {not_in_creative_inventory = 1, cracky=2,oddly_breakable_by_hand=1, ud_param2_colorable = 1},
		drop = {
			items = {
				{items = {"homedecor:table_lamp_hi"}, inherit_color = true },
			}
		},
		on_rightclick = homedecor_lighting.toggle_light,
	})

	homedecor.register("standing_lamp_"..brightness_level, {
		description = S("Standing Lamp/Light"),
		mesh = "homedecor_standing_lamp.obj",
		tiles = {
			wool_brightened,
			{ name = gen_ls_tex_white, color = brightness_hex },
			{ name = "homedecor_generic_wood_red.png", color = 0xffffffff },
			{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		},
		inventory_image = "homedecor_standing_lamp_foot_inv.png^homedecor_standing_lamp_top_inv.png",
		paramtype = "light",
		paramtype2 = "color",
		walkable = false,
		light_source = brightness_level,
		groups = {not_in_creative_inventory = 1, cracky=2,oddly_breakable_by_hand=1, ud_param2_colorable = 1},
		selection_box = slamp_cbox,
		sounds = default.node_sound_wood_defaults(),
		on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
		--expand = { top="air" },
		drop = {
			items = {
				{items = {"homedecor:standing_lamp_hi"}, inherit_color = true },
			}
		},
		on_rightclick = homedecor_lighting.toggle_light,
	})
end

------------------------------------------
-- Simple non-dimmable, on/off-only lights

for _, light_brightn_name in ipairs({"off", "on"}) do

	local onflag = (light_brightn_name == "on")
	local nici = (light_brightn_name == "off") and 1 or nil
	local nici_m = (light_brightn_name == "off") and 1 or nil
	local on_rc = homedecor_lighting.toggle_light
	local di = "on"

	local gen_ls_tex_white =           "homedecor_generic_light_source_off.png"
	if onflag then gen_ls_tex_white =  "homedecor_generic_light_source_white.png" end

	local gen_ls_tex_yellow =          "homedecor_generic_light_source_off.png"
	if onflag then gen_ls_tex_yellow = "homedecor_generic_light_source_yellow.png" end

	local lighttex = "homedecor_blanktile.png"
	if onflag then
		lighttex = {
			name = "homedecor_plasma_ball_streamers.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		}
	end

	homedecor.register("plasma_ball_"..light_brightn_name, {
		description = S("Plasma Ball/light"),
		mesh = "homedecor_plasma_ball.obj",
		tiles = {
			{ name = "homedecor_generic_plastic.png", color = homedecor.color_black },
			lighttex,
			"homedecor_plasma_ball_glass.png"
		},
		inventory_image = "homedecor_plasma_ball_inv.png",
		selection_box = {
			type = "fixed",
			fixed = { -0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875 }
		},
		walkable = false,
		use_texture_alpha = "clip",
		light_source = onflag and (default.LIGHT_MAX - 5) or nil,
		sunlight_propagates = true,
		groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=3},
		sounds = default.node_sound_glass_defaults(),
		on_rightclick = homedecor_lighting.toggle_light,
		drop = {
			items = {
				{items = {"homedecor:plasma_ball_on"}},
			}
		},
	})

	local wl_cbox = {
		type = "fixed",
		fixed = { -0.2, -0.5, 0, 0.2, 0.5, 0.5 },
	}

	-- rope lighting

	minetest.register_node(":homedecor:rope_light_on_floor_"..light_brightn_name, {
		description = S("Rope lighting (on floor)"),
		inventory_image =  "homedecor_rope_light_on_floor.png",
		paramtype = "light",
		light_source = word_to_bright[light_brightn_name],
		walkable = false,
		sunlight_propagates = true,
		tiles = { gen_ls_tex_white },
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {},
			connect_front = { -1/16, -8/16, -8/16, 1/16, -6/16, 1/16 },
			connect_left =  { -8/16, -8/16, -1/16, 1/16, -6/16, 1/16 },
			connect_back =  { -1/16, -8/16, -1/16, 1/16, -6/16, 8/16 },
			connect_right = { -1/16, -8/16, -1/16, 8/16, -6/16, 1/16 },
			disconnected_sides = {
				{ -6/16, -8/16, -6/16, -4/16, -6/16,  6/16 },
				{  4/16, -8/16, -6/16,  6/16, -6/16,  6/16 },
				{ -6/16, -8/16, -6/16,  6/16, -6/16, -4/16 },
				{ -6/16, -8/16,  4/16,  6/16, -6/16,  6/16 }
			},
		},
		connects_to = {
			"homedecor:rope_light_on_floor_on",
			"homedecor:rope_light_on_floor_off",
			"group:mesecon_conductor_craftable"
		},
		groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=3},
		sounds =  default.node_sound_stone_defaults(),
		drop = {
			items = {
				{items = {"homedecor:rope_light_on_floor_"..di} },
			}
		},
		on_rightclick = on_rc,
	})

	minetest.register_node(":homedecor:rope_light_on_ceiling_"..light_brightn_name, {
		description = S("Rope lighting (on ceiling)"),
		inventory_image =  "homedecor_rope_light_on_ceiling.png",
		paramtype = "light",
		light_source = word_to_bright[light_brightn_name],
		walkable = false,
		sunlight_propagates = true,
		tiles = { gen_ls_tex_white },
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {},
			connect_front = { -1/16, 8/16, -8/16, 1/16, 6/16, 1/16 },
			connect_left =  { -8/16, 8/16, -1/16, 1/16, 6/16, 1/16 },
			connect_back =  { -1/16, 8/16, -1/16, 1/16, 6/16, 8/16 },
			connect_right = { -1/16, 8/16, -1/16, 8/16, 6/16, 1/16 },
			disconnected_sides = {
				{ -6/16, 8/16, -6/16, -4/16, 6/16,  6/16 },
				{  4/16, 8/16, -6/16,  6/16, 6/16,  6/16 },
				{ -6/16, 8/16, -6/16,  6/16, 6/16, -4/16 },
				{ -6/16, 8/16,  4/16,  6/16, 6/16,  6/16 }
			},
		},
		connects_to = {
			"homedecor:rope_light_on_ceiling_on",
			"homedecor:rope_light_on_ceiling_off",
			"group:mesecon_conductor_craftable"
		},
		groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=3},
		sounds =  default.node_sound_stone_defaults(),
		drop = {
			items = {
				{items = {"homedecor:rope_light_on_ceiling_"..di}},
			}
		},
		on_rightclick = on_rc,
	})

	homedecor.register("wall_lamp_"..light_brightn_name, {
		description = S("Wall Lamp/light"),
		mesh = "homedecor_wall_lamp.obj",
		tiles = {
			{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
			homedecor.lux_wood,
			gen_ls_tex_yellow,
			"homedecor_generic_metal_wrought_iron.png"
		},
		use_texture_alpha = "clip",
		inventory_image = "homedecor_wall_lamp_inv.png",
		groups = {not_in_creative_inventory = 1, snappy=3},
		light_source = onflag and (default.LIGHT_MAX - 3) or nil,
		selection_box = wl_cbox,
		walkable = false,
		drop = {
			items = {
				{items = {"homedecor:wall_lamp_on"}},
			}
		},
		on_rightclick = homedecor_lighting.toggle_light,
	})
end



-------------------------------------------------------
-- Light sources and other items that don't turn on/off

local tc_cbox = {
	type = "fixed",
	fixed = {
		{ -0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875 },
	}
}

homedecor.register("candle", {
	description = S("Thick Candle"),
	mesh = "homedecor_candle_thick.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_inv.png",
	selection_box = tc_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-4,
	use_texture_alpha = "clip",
})

local c_cbox = {
	type = "fixed",
	fixed = {
		{ -0.125, -0.5, -0.125, 0.125, 0.05, 0.125 },
	}
}

homedecor.register("candle_thin", {
	description = S("Thin Candle"),
	mesh = "homedecor_candle_thin.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
	},
	inventory_image = "homedecor_candle_thin_inv.png",
	selection_box = c_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-4,
	use_texture_alpha = "clip",
})

local cs_cbox = {
	type = "fixed",
	fixed = {
		{ -0.15625, -0.5, -0.15625, 0.15625, 0.3125, 0.15625 },
	}
}

homedecor.register("candlestick_wrought_iron", {
	description = S("Candlestick (wrought iron)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"homedecor_generic_metal_wrought_iron.png",
	},
	inventory_image = "homedecor_candlestick_wrought_iron_inv.png",
	selection_box = cs_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-4,
	use_texture_alpha = "clip",
})

homedecor.register("candlestick_brass", {
	description = S("Candlestick (brass)"),
	mesh = "homedecor_candlestick.obj",
	tiles = {
		"homedecor_candle_sides.png",
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		"homedecor_generic_metal_brass.png",
	},
	inventory_image = "homedecor_candlestick_brass_inv.png",
	selection_box = cs_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-4,
	use_texture_alpha = "clip",
})

homedecor.register("wall_sconce", {
	description = S("Wall sconce"),
	mesh = "homedecor_wall_sconce.obj",
	tiles = {
		'homedecor_candle_sides.png',
		{name="homedecor_candle_flame.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		'homedecor_wall_sconce_back.png',
		'homedecor_generic_metal_wrought_iron.png',
	},
	inventory_image = "homedecor_wall_sconce_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -0.1875, -0.25, 0.3125, 0.1875, 0.25, 0.5 }
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-4,
	use_texture_alpha = "clip",
})

local ol_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16, -8/16, -3/16, 5/16, 4/16, 3/16 },
	}
}

homedecor.register("oil_lamp", {
	description = S("Oil lamp/Light (hurricane)"),
	mesh = "homedecor_oil_lamp.obj",
	tiles = {
		"homedecor_generic_metal_brass.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		{ name = "homedecor_generic_metal.png", color = 0xffa00000 },
		"homedecor_oil_lamp_wick.png",
		{ name = "homedecor_generic_metal.png", color = 0xffa00000 },
		"homedecor_oil_lamp_glass.png",
	},
	use_texture_alpha = "clip",
	inventory_image = "homedecor_oil_lamp_inv.png",
	selection_box = ol_cbox,
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-3,
	sounds = default.node_sound_glass_defaults(),
})

homedecor.register("oil_lamp_tabletop", {
	description = S("Oil Lamp/Light (tabletop)"),
	mesh = "homedecor_oil_lamp_tabletop.obj",
	tiles = {"homedecor_oil_lamp_tabletop.png"},
	inventory_image = "homedecor_oil_lamp_tabletop_inv.png",
	selection_box = ol_cbox,
	collision_box = ol_cbox,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	light_source = default.LIGHT_MAX-3,
	sounds = default.node_sound_glass_defaults(),
})

local topchains_sbox = {
	type = "fixed",
	fixed = {
		{ -0.25, 0.35, -0.25, 0.25, 0.5, 0.25 },
		{ -0.1, -0.5, -0.1, 0.1, 0.4, 0.1 }
	}
}

minetest.register_node(":homedecor:chain_steel_top", {
	description = S("Hanging chain (ceiling mount, steel)"),
	drawtype = "mesh",
	mesh = "homedecor_chains_top.obj",
	tiles = {"basic_materials_chain_steel.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_steel_inv.png",
	groups = {not_in_creative_inventory = 1, cracky=3},
	selection_box = topchains_sbox,
})

minetest.register_node(":homedecor:chain_brass_top", {
	description = S("Hanging chain (ceiling mount, brass)"),
	drawtype = "mesh",
	mesh = "homedecor_chains_top.obj",
	tiles = {"basic_materials_chain_brass.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_brass_inv.png",
	groups = {not_in_creative_inventory = 1, cracky=3},
	selection_box = topchains_sbox,
})

minetest.register_node(":homedecor:chandelier_steel", {
	description = S("Chandelier (steel)"),
	paramtype = "light",
	light_source = 12,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	tiles = {
		"basic_materials_chain_steel.png",
		"homedecor_candle_flat.png",
		{
			name="homedecor_candle_flame.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=3.0
			}
		}
	},
	drawtype = "mesh",
	mesh = "homedecor_chandelier.obj",
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds =  default.node_sound_stone_defaults(),
	use_texture_alpha = "clip",
})

minetest.register_node(":homedecor:chandelier_brass", {
	description = S("Chandelier (brass)"),
	paramtype = "light",
	light_source = 12,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	tiles = {
		"basic_materials_chain_brass.png",
		"homedecor_candle_flat.png",
		{
			name="homedecor_candle_flame.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=3.0
			}
		}
	},
	drawtype = "mesh",
	mesh = "homedecor_chandelier.obj",
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds =  default.node_sound_stone_defaults(),
	use_texture_alpha = "clip",
})

homedecor.register("torch_wall", {
	description = S("Wall Torch"),
	mesh = "forniture_torch.obj",
	tiles = {
		{
			name="forniture_torch_flame.png",
			animation={
				type="vertical_frames",
				aspect_w=40,
				aspect_h=40,
				length=1.0,
			},
		},
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"forniture_coal.png",
	},
	inventory_image="forniture_torch_inv.png",
	use_texture_alpha = "clip",
	walkable = false,
	light_source = 14,
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.45, 0.15, 0.15,0.35, 0.5 },
	},
	groups = {not_in_creative_inventory = 1, cracky=3},
})

-- table lamps and standing lamps

local lamp_colors = {
	"white",
	"blue",
	"green",
	"pink",
	"red",
	"violet",
}

-- conversion LBM for param2 coloring

homedecor_lighting.old_static_nodes = {
	"homedecor:glowlight_quarter_white",
	"homedecor:glowlight_quarter_yellow",
	"homedecor:glowlight_half_white",
	"homedecor:glowlight_half_yellow",
	"homedecor:glowlight_small_cube_white",
	"homedecor:glowlight_small_cube_yellow"
}

local lamp_power = {"off", "low", "med", "hi", "max"}

for _, power in ipairs(lamp_power) do
	for _, color in ipairs(lamp_colors) do
		table.insert(homedecor_lighting.old_static_nodes, "homedecor:table_lamp_"..color.."_"..power)
		table.insert(homedecor_lighting.old_static_nodes, "homedecor:standing_lamp_"..color.."_"..power)
	end
end

minetest.register_lbm({
	name = ":homedecor:convert_lighting",
	label = "Convert homedecor glowlights, table lamps, and standing lamps to use param2 color",
	run_at_every_load = false,
	nodenames = homedecor_lighting.old_static_nodes,
	action = function(pos, node)
		local name = node.name
		local newname
		local color

		if string.find(name, "small_cube") then
			newname = "homedecor:glowlight_small_cube"
		elseif string.find(name, "glowlight_half") then
			newname = "homedecor:glowlight_half"
		elseif string.find(name, "glowlight_quarter") then
			newname = "homedecor:glowlight_quarter"
		end

		local lampname
		if string.find(name, "standing_lamp") then
			lampname = "homedecor:standing_lamp"
		elseif string.find(name, "table_lamp") then
			lampname = "homedecor:table_lamp"
		end
		if lampname then
			newname = lampname
			if string.find(name, "_off") then
				newname = newname.."_off"
			elseif string.find(name, "_low") then
				newname = newname.."_low"
			elseif string.find(name, "_med") then
				newname = newname.."_med"
			elseif string.find(name, "_hi") then
				newname = newname.."_hi"
			elseif string.find(name, "_max") then
				newname = newname.."_max"
			end
		end

		if string.find(name, "red") then
			color = "red"
		elseif string.find(name, "pink") then
			color = "pink"
		elseif string.find(name, "green") then
			color = "green"
		elseif string.find(name, "blue") then
			color = "blue"
		elseif string.find(name, "yellow") then
			color = "yellow"
		elseif string.find(name, "violet") then
			color = "violet"
		else
			color = "white"
		end

		local paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, "extended")

		local old_fdir
		local new_node = newname
		local new_fdir = 1
		local param2

		if string.find(name, "glowlight") then
			paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, "wallmounted")

			old_fdir = math.floor(node.param2 / 4)

			if old_fdir == 5 then
				new_fdir = 0
			elseif old_fdir == 1 then
				new_fdir = 5
			elseif old_fdir == 2 then
				new_fdir = 4
			elseif old_fdir == 3 then
				new_fdir = 3
			elseif old_fdir == 4 then
				new_fdir = 2
			elseif old_fdir == 0 then
				new_fdir = 1
			end
			param2 = paletteidx + new_fdir
		else
			param2 = paletteidx
		end

		local meta = minetest.get_meta(pos)

		if string.find(name, "table_lamp") or string.find(name, "standing_lamp") then
			meta:set_string("palette", "ext")
		end

		minetest.set_node(pos, { name = new_node, param2 = param2 })
		meta:set_string("dye", "unifieddyes:"..color)
	end
})

-- this one's for the small "gooseneck" desk lamps

homedecor_lighting.old_static_desk_lamps = {
	"homedecor:desk_lamp_red",
	"homedecor:desk_lamp_blue",
	"homedecor:desk_lamp_green",
	"homedecor:desk_lamp_violet",
}

minetest.register_lbm({
	name = ":homedecor:convert_desk_lamps",
	label = "Convert homedecor desk lamps to use param2 color",
	run_at_every_load = false,
	nodenames = homedecor_lighting.old_static_desk_lamps,
	action = function(pos, node)
		local name = node.name
		local color = string.sub(name, string.find(name, "_", -8) + 1)

		if color == "green" then
			color = "medium_green"
		elseif color == "violet" then
			color = "magenta"
		end

		local paletteidx, _ = unifieddyes.getpaletteidx("unifieddyes:"..color, "wallmounted")
		local old_fdir = math.floor(node.param2 % 32)
		local new_fdir = 3

		if old_fdir == 0 then
			new_fdir = 3
		elseif old_fdir == 1 then
			new_fdir = 4
		elseif old_fdir == 2 then
			new_fdir = 2
		elseif old_fdir == 3 then
			new_fdir = 5
		end

		local param2 = paletteidx + new_fdir

		minetest.set_node(pos, { name = "homedecor:desk_lamp", param2 = param2 })
		local meta = minetest.get_meta(pos)
		meta:set_string("dye", "unifieddyes:"..color)
	end
})

if minetest.get_modpath("darkage") then
	minetest.register_alias("homedecor:lattice_lantern_large",        "darkage:lamp")
	for n = 0, 14 do
		minetest.register_alias("homedecor:lattice_lantern_large_"..n, "darkage:lamp")
	end
	for name, level in pairs(word_to_bright) do
		minetest.register_alias("homedecor:lattice_lantern_large_"..name, "darkage:lamp")
	end
end

-- aliases

minetest.register_alias("chains:chain_top",                    "homedecor:chain_steel_top")
minetest.register_alias("chains:chain_top_brass",              "homedecor:chain_brass_top")

minetest.register_alias("chains:chandelier",                   "homedecor:chandelier_steel")
minetest.register_alias("chains:chandelier_steel",             "homedecor:chandelier_steel")
minetest.register_alias("chains:chandelier_brass",             "homedecor:chandelier_brass")

minetest.register_alias("homedecor:glowlight_half",            "homedecor:glowlight_half_14")
minetest.register_alias("homedecor:glowlight_half_max",        "homedecor:glowlight_half_14")

minetest.register_alias("homedecor:glowlight_quarter",         "homedecor:glowlight_quarter_14")
minetest.register_alias("homedecor:glowlight_quarter_max",     "homedecor:glowlight_quarter_14")

minetest.register_alias("homedecor:glowlight_small_cube",      "homedecor:glowlight_small_cube_14")
minetest.register_alias("homedecor:glowlight_small_cube_max",  "homedecor:glowlight_small_cube_14")

minetest.register_alias("homedecor:plasma_lamp",               "homedecor:plasma_lamp_14")
minetest.register_alias("homedecor:plasma_lamp_max",           "homedecor:plasma_lamp_14")

minetest.register_alias("homedecor:ground_lantern",            "homedecor:ground_lantern_14")
minetest.register_alias("homedecor:ground_lantern_max",        "homedecor:ground_lantern_14")

minetest.register_alias("homedecor:hanging_lantern",           "homedecor:hanging_lantern_14")
minetest.register_alias("homedecor:hanging_lantern_max",       "homedecor:hanging_lantern_14")

minetest.register_alias("homedecor:ceiling_lantern",           "homedecor:ceiling_lantern_14")
minetest.register_alias("homedecor:ceiling_lantern_max",       "homedecor:ceiling_lantern_14")

minetest.register_alias("homedecor:lattice_lantern_large",     "homedecor:lattice_lantern_large_14")
minetest.register_alias("homedecor:lattice_lantern_large_max", "homedecor:lattice_lantern_large_14")

minetest.register_alias("homedecor:lattice_lantern_small",     "homedecor:lattice_lantern_small_14")
minetest.register_alias("homedecor:lattice_lantern_small_max", "homedecor:lattice_lantern_small_14")

minetest.register_alias("homedecor:desk_lamp",                 "homedecor:desk_lamp_14")
minetest.register_alias("homedecor:desk_lamp_max",             "homedecor:desk_lamp_14")

minetest.register_alias("homedecor:ceiling_lamp",              "homedecor:ceiling_lamp_14")
minetest.register_alias("homedecor:ceiling_lamp_max",          "homedecor:ceiling_lamp_14")

minetest.register_alias("homedecor:table_lamp",                "homedecor:table_lamp_14")
minetest.register_alias("homedecor:table_lamp_max",            "homedecor:table_lamp_14")

minetest.register_alias("homedecor:standing_lamp",             "homedecor:standing_lamp_14")
minetest.register_alias("homedecor:standing_lamp_max",         "homedecor:standing_lamp_14")

minetest.register_alias("3dforniture:table_lamp",              "homedecor:table_lamp_14")
minetest.register_alias("3dforniture:table_lamp_max",          "homedecor:table_lamp_14")

minetest.register_alias("3dforniture:torch_wall",              "homedecor:torch_wall")
minetest.register_alias("torch_wall",                          "homedecor:torch_wall")

minetest.register_alias("homedecor:plasma_ball",               "homedecor:plasma_ball_on")
minetest.register_alias("homedecor:wall_lamp",                 "homedecor:wall_lamp_on")

minetest.register_alias("homedecor:rope_light_on_floor_0",     "homedecor:rope_light_on_floor_off")
minetest.register_alias("homedecor:rope_light_on_floor_14",    "homedecor:rope_light_on_floor_on")

minetest.register_alias("homedecor:rope_light_on_ceiling_0",   "homedecor:rope_light_on_ceiling_off")
minetest.register_alias("homedecor:rope_light_on_ceiling_14",  "homedecor:rope_light_on_ceiling_on")

for name, level in pairs(word_to_bright) do
	minetest.register_alias("homedecor:glowlight_half_"..name,        "homedecor:glowlight_half_"..level)
	minetest.register_alias("homedecor:glowlight_quarter_"..name,     "homedecor:glowlight_quarter_"..level)
	minetest.register_alias("homedecor:glowlight_small_cube_"..name,  "homedecor:glowlight_small_cube_"..level)
	minetest.register_alias("homedecor:rope_light_on_floor_"..name,   "homedecor:rope_light_on_floor_"..level)
	minetest.register_alias("homedecor:rope_light_on_ceiling_"..name, "homedecor:rope_light_on_ceiling_"..level)
	minetest.register_alias("homedecor:plasma_lamp_"..name,           "homedecor:plasma_lamp_"..level)
	minetest.register_alias("homedecor:plasma_ball_"..name,           "homedecor:plasma_ball_"..level)
	minetest.register_alias("homedecor:ground_lantern_"..name,        "homedecor:ground_lantern_"..level)
	minetest.register_alias("homedecor:hanging_lantern_"..name,       "homedecor:hanging_lantern_"..level)
	minetest.register_alias("homedecor:ceiling_lantern_"..name,       "homedecor:ceiling_lantern_"..level)
	minetest.register_alias("homedecor:lattice_lantern_large_"..name, "homedecor:lattice_lantern_large_"..level)
	minetest.register_alias("homedecor:lattice_lantern_small_"..name, "homedecor:lattice_lantern_small_"..level)
	minetest.register_alias("homedecor:desk_lamp_"..name,             "homedecor:desk_lamp_"..level)
	minetest.register_alias("homedecor:ceiling_lamp_"..name,          "homedecor:ceiling_lamp_"..level)
	minetest.register_alias("homedecor:table_lamp_"..name,            "homedecor:table_lamp_"..level)
	minetest.register_alias("homedecor:standing_lamp_"..name,         "homedecor:standing_lamp_"..level)
	minetest.register_alias("3dforniture:table_lamp_"..name,          "homedecor:table_lamp_"..level)
end

-- homedecor_misc

homedecor_misc = {}

homedecor.register("ceiling_paint", {
	description = S("Textured Ceiling Paint"),
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_paint.png' },
	inventory_image = 'homedecor_ceiling_paint_roller.png',
	wield_image = 'homedecor_ceiling_paint_roller.png',
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = { type = "wallmounted" },
})

homedecor.register("ceiling_tile", {
	description = S("Drop-Ceiling Tile"),
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_tile.png' },
	wield_image = 'homedecor_ceiling_tile.png',
	inventory_image = 'homedecor_ceiling_tile.png',
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = { type = "wallmounted" },
})

local rug_types = {
	{ "small",   "homedecor_small_rug.obj"    },
	{ "large",   homedecor.box.slab_y(0.0625) },
	{ "persian", homedecor.box.slab_y(0.0625) },
}

for _, rt in ipairs(rug_types) do
	local s, m = unpack(rt)

	local mesh = m
	local nodebox = nil
	local tiles = { "homedecor_rug_"..s..".png", "wool_grey.png" }

	if type(m) == "table" then
		mesh = nil
		nodebox = {
			type = "fixed",
			fixed = m
		}
		tiles = {
			"homedecor_rug_"..s..".png",
			"wool_grey.png",
			"homedecor_rug_"..s..".png"
		}
	end

	homedecor.register("rug_"..s, {
		description = S("Rug (@1)", S(s)),
		mesh = mesh,
		tiles = tiles,
		node_box = nodebox,
		paramtype2 = "wallmounted",
		walkable = false,
		groups = {not_in_creative_inventory = 1, snappy = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = { type = "wallmounted" },
	})
end

local pot_colors = { "black", "green", "terracotta" }

for _, p in ipairs(pot_colors) do
homedecor.register("flower_pot_"..p, {
	description = S("Flower Pot (@1)", S(p)),
	mesh = "homedecor_flowerpot.obj",
	tiles = {
		"homedecor_flower_pot_"..p..".png",
		{ name = "default_dirt.png", color = 0xff505050 },
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3, potting_soil=1 },
	sounds = default.node_sound_stone_defaults(),
})
end

local flowers_list = {
	{ S("Rose"),				"rose",				"flowers:rose" },
	{ S("Tulip"),				"tulip",			"flowers:tulip" },
	{ S("Yellow Dandelion"),	"dandelion_yellow",	"flowers:dandelion_yellow" },
	{ S("White Dandelion"), 	"dandelion_white",	"flowers:dandelion_white" },
	{ S("Blue Geranium"),		"geranium",			"flowers:geranium" },
	{ S("Viola"),				"viola",			"flowers:viola" },
	{ S("Cactus"),				"cactus",			"default:cactus" },
	{ S("Bonsai"),				"bonsai",			"default:sapling" }
}

for _, f in ipairs(flowers_list) do
	local flowerdesc, flower, craftwith = unpack(f)

	homedecor.register("potted_"..flower, {
		description = S("Potted flower (@1)", flowerdesc),
		mesh = "homedecor_potted_plant.obj",
		tiles = {
			"homedecor_flower_pot_terracotta.png",
			{ name = "default_dirt.png", color = 0xff303030 },
			"flowers_"..flower..".png"
		},
		walkable = false,
		use_texture_alpha = "clip",
		groups = {not_in_creative_inventory = 1, snappy = 3},
		sounds = default.node_sound_glass_defaults(),
		selection_box = {
			type = "fixed",
			fixed = { -0.2, -0.5, -0.2, 0.2, 0.3, 0.2 }
		}
	})

	minetest.register_alias("flowers:flower_"..flower.."_pot", "homedecor:potted_"..flower)
	minetest.register_alias("flowers:potted_"..flower, "homedecor:potted_"..flower)
	minetest.register_alias("flowers:flower_pot", "homedecor:flower_pot_small")
end

homedecor.register("pole_brass", {
	description = S("Brass Pole"),
	mesh = "homedecor_round_pole.obj",
	tiles = {"homedecor_generic_metal_brass.png^homedecor_generic_metal_lines_overlay.png",},
	inventory_image = "homedecor_pole_brass_inv.png",
	wield_image = "homedecor_pole_brass_inv.png",
	selection_box = {
		type = "fixed",
		fixed = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
	},
	collision_box = {
		type = "fixed",
		fixed = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
	},
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	check_for_pole = true
})

homedecor.register("pole_wrought_iron", {
    description = S("Wrought Iron Pole"),
    tiles = { "homedecor_generic_metal_wrought_iron.png^homedecor_generic_metal_lines_overlay.png" },
    inventory_image = "homedecor_pole_wrought_iron_inv.png",
    wield_image = "homedecor_pole_wrought_iron_inv.png",
    selection_box = {
            type = "fixed",
            fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
    },
	node_box = {
		type = "fixed",
                fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
	},
    groups = {not_in_creative_inventory = 1, snappy=3},
    sounds = default.node_sound_wood_defaults(),
})

local ft_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.375, 0.5, 0.3125, 0.375 }
}

homedecor.register("fishtank", {
	description = S("Fishtank"),
	mesh = "homedecor_fishtank.obj",
	tiles = {
		{ name = "homedecor_generic_plastic.png", color = homedecor.color_black },
		"homedecor_fishtank_filter.png",
		"homedecor_fishtank_fishes.png",
		"homedecor_fishtank_gravel.png",
		"homedecor_fishtank_water_top.png",
		"homedecor_fishtank_sides.png",
	},
	use_texture_alpha = "clip",
	selection_box = ft_cbox,
	collision_box = ft_cbox,
	groups = {not_in_creative_inventory = 1, cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.set_node(pos, {name = "homedecor:fishtank_lighted", param2 = node.param2})
		return itemstack
	end
})

homedecor.register("fishtank_lighted", {
	description = S("Fishtank (lighted)"),
	mesh = "homedecor_fishtank.obj",
	tiles = {
		{ name = "homedecor_generic_plastic.png", color = homedecor.color_black },
		"homedecor_fishtank_filter.png",
		"homedecor_fishtank_fishes_lighted.png",
		"homedecor_fishtank_gravel_lighted.png",
		"homedecor_fishtank_water_top_lighted.png",
		"homedecor_fishtank_sides_lighted.png",
	},
	light_source = default.LIGHT_MAX-4,
	use_texture_alpha = "clip",
	selection_box = ft_cbox,
	collision_box = ft_cbox,
	groups = {not_in_creative_inventory = 1, cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.set_node(pos, {name = "homedecor:fishtank", param2 = node.param2})
		return itemstack
	end,
	drop = "homedecor:fishtank",
})

homedecor.register("cardboard_box_big", {
	description = S("Cardboard box (big)"),
	tiles = {
		'homedecor_cardbox_big_tb.png',
		'homedecor_cardbox_big_tb.png',
		'homedecor_cardbox_big_sides.png',
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
})

homedecor.register("cardboard_box", {
	description = S("Cardboard box"),
	tiles = {
		'homedecor_cardbox_tb.png',
		'homedecor_cardbox_tb.png',
		'homedecor_cardbox_sides.png',
	},
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0, 0.3125},
		}
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
})

homedecor.register("dvd_cd_cabinet", {
	description = S("DVD/CD cabinet"),
	mesh = "homedecor_dvd_cabinet.obj",
	tiles = {
		"default_wood.png",
		"homedecor_dvdcd_cabinet_front.png",
		"homedecor_dvdcd_cabinet_back.png"
	},
	selection_box = homedecor.nodebox.slab_z(-0.5),
	groups = {not_in_creative_inventory = 1, choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})

local pooltable_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 0.3125, 1.5 }
}

homedecor.register("pool_table", {
	mesh = "homedecor_pool_table.obj",
	tiles = {
		"homedecor_pool_table_cue.png",
		"homedecor_pool_table_baize.png",
		"homedecor_pool_table_pockets.png",
		"homedecor_pool_table_balls.png",
		homedecor.lux_wood,
	},
	description = S("Pool Table"),
	inventory_image = "homedecor_pool_table_inv.png",
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = pooltable_cbox,
	collision_box = pooltable_cbox,
	expand = { forward="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

minetest.register_alias("homedecor:pool_table_2", "air")

local piano_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.125, 1.5, 0.5, 0.5 }
}

homedecor.register("piano", {
	mesh = "homedecor_piano.obj",
	tiles = {
		{ name = "homedecor_generic_wood_luxury.png", color = homedecor.color_black },
		"homedecor_piano_keys.png",
		"homedecor_generic_metal_brass.png",
	},
	inventory_image = "homedecor_piano_inv.png",
	description = S("Piano"),
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	selection_box = piano_cbox,
	collision_box = piano_cbox,
	expand = { right="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

minetest.register_alias("homedecor:piano_left", "homedecor:piano")
minetest.register_alias("homedecor:piano_right", "air")

local tr_cbox = {
	type = "fixed",
	fixed = { -0.3125, -0.5, -0.1875, 0.3125, 0.125, 0.1875 }
}

homedecor.register("trophy", {
	description = S("Trophy"),
	mesh = "homedecor_trophy.obj",
	tiles = {
		"default_wood.png",
		"homedecor_generic_metal_gold.png"
	},
	inventory_image = "homedecor_trophy_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	walkable = false,
	selection_box = tr_cbox,
})

local sb_cbox = {
	type = "fixed",
	fixed = { -0.4, -0.5, -0.5, 0.4, 0.375, 0.5 }
}

homedecor.register("sportbench", {
	description = S("Sport bench"),
	mesh = "homedecor_sport_bench.obj",
	tiles = {
		"homedecor_generic_metal_wrought_iron.png",
		"homedecor_generic_metal_bright.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black },
		"wool_black.png"
	},
	inventory_image = "homedecor_sport_bench_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	selection_box = sb_cbox,
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
})

local skate_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.15, 0.5, -0.3, 0.15 }
}

homedecor.register("skateboard", {
	drawtype = "mesh",
	mesh = "homedecor_skateboard.obj",
	tiles = { "homedecor_skateboard.png" },
	inventory_image = "homedecor_skateboard_inv.png",
	use_texture_alpha = "clip",
	description = S("Skateboard"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = skate_cbox,
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

homedecor.register("tool_cabinet", {
	description = S("Metal tool cabinet and work table"),
	mesh = "homedecor_tool_cabinet.obj",
	tiles = {
		{ name = "homedecor_generic_metal.png", color = 0xffd00000 },
		"homedecor_tool_cabinet_drawers.png",
		{ name = "homedecor_generic_metal.png", color = 0xff006000 },
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_generic_metal_bright.png",
		"homedecor_tool_cabinet_misc.png",
	},
	inventory_image = "homedecor_tool_cabinet_inv.png",
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
	groups = {not_in_creative_inventory = 1,  snappy=3 },
	selection_box = homedecor.nodebox.slab_y(2),
	expand = { top="placeholder" },
})

minetest.register_alias("homedecor:tool_cabinet_bottom", "homedecor:tool_cabinet")
minetest.register_alias("homedecor:tool_cabinet_top", "air")

homedecor_misc.banister_materials = {
	{
		"wood",
		S("wood"),
		"default_wood.png",
		"default_wood.png",
		"group:wood",
		"group:stick",
		"",
		""
	},
	{
		"white_dark",
		S("dark topped"),
		homedecor.white_wood,
		homedecor.dark_wood,
		"group:wood",
		"group:stick",
		"dye:brown",
		"dye:white"
	},
	{
		"brass",
		S("brass"),
		homedecor.white_wood,
		"homedecor_generic_metal_brass.png",
		"technic:brass_ingot",
		"group:stick",
		"",
		"dye:white"
	},
	{
		"wrought_iron",
		S("wrought iron"),
		"homedecor_generic_metal_wrought_iron.png",
		"homedecor_generic_metal_wrought_iron.png",
		"homedecor:pole_wrought_iron",
		"homedecor:pole_wrought_iron",
		"",
		""
	}
}

for _, side in ipairs({"diagonal_left", "diagonal_right", "horizontal"}) do

	local sidedesc = side:match("^diagonal") and S("diagonal") or S("horizontal")

	for _, mat in ipairs(homedecor_misc.banister_materials) do

		local name, matdesc, tile1, tile2 = unpack(mat)
		local nodename = "banister_"..name.."_"..side

		local cbox = {
			type = "fixed",
			fixed = { -9/16, -3/16, 5/16, 9/16, 24/16, 8/16 }
		}

		if side == "horizontal" then
			cbox = {
				type = "fixed",
				fixed = { -8/16, -8/16, 5/16, 8/16, 8/16, 8/16 }
			}
		end

		local def = {
			description = S("Banister for Stairs (@1, @2)", matdesc, sidedesc),
			mesh = "homedecor_banister_"..side..".obj",
			tiles = {
				tile1,
				tile2,
			},
			inventory_image = "homedecor_banister_"..name.."_inv.png",
			selection_box = cbox,
			collision_box = cbox,
			groups = {not_in_creative_inventory = 1,  snappy = 3},
			on_place = homedecor.place_banister,
			drop = "homedecor:banister_"..name.."_horizontal",
		}

		if side ~= "horizontal" then
			def.groups.not_in_creative_inventory = 1
		end

		if name == "wood" then
			def.airbrush_replacement_node = "homedecor:banister_wood_"..side.."_grey"
			def.groups.ud_param2_colorable = 1
			def.paramtype2 = "colorfacedir"
		end
		homedecor.register(nodename, def)

		if name == "wood" then
			local nn = "homedecor:"..nodename
			local def2 = table.copy(minetest.registered_items[nn])
			def2.tiles = {
				homedecor.white_wood,
				homedecor.white_wood
			}
			def2.inventory_image = "homedecor_banister_wood_colored_inv.png"
			def2.groups.not_in_creative_inventory = 1
		end
	end
end

homedecor.register("spiral_staircase", {
	description = "Spiral Staircase",
	mesh = "homedecor_spiral_staircase.obj",
	wield_scale = { x=0.4, y=0.4, z=0.4 },
	tiles = {
		"homedecor_generic_metal_wrought_iron.png",
	},
	selection_box = {
		type = "fixed",
		fixed = { -1.5, -0.5, -1.5, 0.5, 2.5, 0.5 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5625, -0.5, -0.5625, -0.4375, 2.5, -0.4375}, -- NodeBox9
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0}, -- NodeBox14
			{-0.5, -0.125, -0.5, -0.25, -0.0625, 0.5}, -- NodeBox15
			{-0.25, -0.125, -0.0625, 0, -0.0625, 0.5}, -- NodeBox16
			{-1, 0.25, -0.5, -0.5, 0.3125, 0.5}, -- NodeBox17
			{-1.5, 0.625, -0.5, -0.5, 0.6875, -0.25}, -- NodeBox18
			{-1.5, 0.625, -0.25, -0.9375, 0.6875, 0}, -- NodeBox19
			{-1.5, 1, -1, -0.5, 1.0625, -0.5}, -- NodeBox20
			{-0.75, 1.375, -1.5, -0.5, 1.4375, -0.5}, -- NodeBox21
			{-1, 1.375, -1.5, -0.75, 1.4375, -1}, -- NodeBox22
			{-0.5, 1.75, -1.5, 0.0625, 1.8125, -0.5}, -- NodeBox23
			{-0.5, 2.125, -0.8125, 0.5, 2.1875, -0.5}, -- NodeBox24
			{-0.0625, 2.125, -1.0625, 0.5, 2.1875, -0.75}, -- NodeBox25
			{-1.5, -0.125, 0.4375, 0.5, 1.625, 0.5}, -- NodeBox26
			{-1.5, 1.5625, -1.5, -1.4375, 2.875, 0.5}, -- NodeBox27
			{-1.5, 1.75, -1.5, 0.5, 3.3125, -1.4375}, -- NodeBox28
			{0.4375, -0.5, -0.5, 0.5, 0.875, 0.5}, -- NodeBox29
			{0.4375, 2.125, -1.5, 0.5, 3.3125, 0.5}, -- NodeBox30
		}
	},
	groups = {not_in_creative_inventory = 1, cracky = 1},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local fdir = minetest.dir_to_facedir(placer:get_look_dir())
		local leftx =  homedecor.fdir_to_left[fdir+1][1]
		local leftz =  homedecor.fdir_to_left[fdir+1][2]
		local revx  = -homedecor.fdir_to_fwd[fdir+1][1]
		local revz  = -homedecor.fdir_to_fwd[fdir+1][2]

		local corner1 = { x = pos.x + leftx + revx, y = pos.y, z = pos.z + leftz + revz}
		local corner2 = { x = pos.x, y = pos.y + 2, z = pos.z }

		local minp = { x = math.min(corner1.x, corner2.x),
		               y = math.min(corner1.y, corner2.y),
		               z = math.min(corner1.z, corner2.z) }

		local maxp = { x = math.max(corner1.x, corner2.x),
		               y = math.max(corner1.y, corner2.y),
		               z = math.max(corner1.z, corner2.z) }

		if #minetest.find_nodes_in_area(minp, maxp, "air") < 11 then
			minetest.set_node(pos, {name = "air"})
			minetest.chat_send_player(placer:get_player_name(), S("not enough space"))
			return true
		end

		local belownode = minetest.get_node({ x = pos.x, y = pos.y - 1, z = pos.z })

		if belownode and belownode.name == "homedecor:spiral_staircase" then
			local newpos = { x = pos.x, y = pos.y + 2, z = pos.z }
			minetest.set_node(pos, { name = "air" })
			minetest.set_node(newpos, { name = "homedecor:spiral_staircase", param2 = belownode.param2 })
		end
	end
})

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	local belownode = minetest.get_node({ x = pos.x, y = pos.y - 1, z = pos.z })

	if newnode.name ~= "homedecor:spiral_staircase"
	  and belownode
	  and belownode.name == "homedecor:spiral_staircase" then
		minetest.set_node(pos, { name = "air" })

		local newpos = { x = pos.x, y = pos.y + 2, z = pos.z }
		local checknode = minetest.get_node(newpos)

		if checknode and checknode.name == "air" then
			local fdir = minetest.dir_to_facedir(placer:get_look_dir())
			minetest.set_node(newpos, { name = newnode.name, param2 = fdir })
		else
			return true
		end
	end
end)

minetest.register_node(":homedecor:tatami_mat", {
	tiles = {
		"homedecor_tatami.png",
		"homedecor_tatami.png",
		"homedecor_tatami.png",
		"homedecor_tatami.png",
		"homedecor_tatami.png",
		"homedecor_tatami.png"
	},
	description = S("Japanese tatami"),
	drawtype = "nodebox",
	paramtype = "light",
	groups = {not_in_creative_inventory = 1, snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		}
	}
})

homedecor.register("dartboard", {
	description = S("Dartboard"),
	mesh = "homedecor_dartboard.obj",
	tiles = { "homedecor_dartboard.png" },
	inventory_image = "homedecor_dartboard_inv.png",
	wield_image = "homedecor_dartboard_inv.png",
	paramtype2 = "wallmounted",
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {not_in_creative_inventory = 1, choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

-- Japanese-style wood/paper wall pieces and door

local jp_cbox = {
	type = "fixed",
	fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.0625},
}

minetest.register_node(":homedecor:japanese_wall_top", {
	description = S("Japanese wall (top)"),
	drawtype = "mesh",
	mesh = "homedecor_wall_japanese_top.obj",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = jp_cbox,
	collision_box = jp_cbox,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":homedecor:japanese_wall_middle", {
	description = S("Japanese wall"),
	drawtype = "mesh",
	mesh = "homedecor_wall_japanese_middle.obj",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = jp_cbox,
	collision_box = jp_cbox,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":homedecor:japanese_wall_bottom", {
	description = S("Japanese wall (bottom)"),
	drawtype = "mesh",
	mesh = "homedecor_wall_japanese_bottom.obj",
	tiles = {
		homedecor.lux_wood,
		"homedecor_japanese_paper.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = jp_cbox,
	collision_box = jp_cbox,
	sounds = default.node_sound_wood_defaults(),
})

-- homedecor_office

homedecor.register("filing_cabinet", {
	description = S("Filing cabinet"),
	mesh = "homedecor_filing_cabinet.obj",
	tiles = {
		homedecor.plain_wood,
		"homedecor_filing_cabinet_front.png",
		"homedecor_filing_cabinet_bottom.png"
	},
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

local desk_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 1.5, 0.5, 0.5 }
}
homedecor.register("desk", {
	description = S("Desk"),
	mesh = "homedecor_desk.obj",
	tiles = {
		homedecor.plain_wood,
		"homedecor_desk_drawers.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_black }
	},
	inventory_image = "homedecor_desk_inv.png",
	selection_box = desk_cbox,
	collision_box = desk_cbox,
	sounds = default.node_sound_wood_defaults(),
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	expand = { right="placeholder" },
})
minetest.register_alias("homedecor:desk_r", "air")

local globe_cbox = {
	type = "fixed",
	fixed = { -0.4, -0.5, -0.3, 0.3, 0.3, 0.3 }
}

homedecor.register("desk_globe", {
	description = S("Desk globe"),
	mesh = "homedecor_desk_globe.obj",
	tiles = {
		"homedecor_generic_wood_red.png",
		{ name = "homedecor_generic_metal.png", color = homedecor.color_med_grey },
		"homedecor_earth.png"
	},
	inventory_image = "homedecor_desk_globe_inv.png",
	selection_box = globe_cbox,
	collision_box = globe_cbox,
	groups = {not_in_creative_inventory = 1, choppy=2, oddly_breakable_by_hand=2},
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("calendar", {
	description = S("Calendar"),
	mesh = "homedecor_calendar.obj",
	tiles = {"homedecor_calendar.png"},
	inventory_image = "homedecor_calendar_inv.png",
	wield_image = "homedecor_calendar_inv.png",
	paramtype2 = "wallmounted",
	use_texture_alpha = "clip",
	walkable = false,
	selection_box = {
		type = "wallmounted",
		wall_side =   { -8/16, -8/16, -4/16, -5/16,  5/16, 4/16 },
		wall_bottom = { -4/16, -8/16, -8/16,  4/16, -5/16, 5/16 },
		wall_top =    { -4/16,  5/16, -8/16,  4/16,  8/16, 5/16 }
	},
	groups = {not_in_creative_inventory = 1, choppy=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

-- homedecor_pictures_and_paintings

local pframe_cbox = {
	type = "fixed",
	fixed = { -0.18, -0.5, -0.08, 0.18, -0.08, 0.18 }
}
local n = { 1, 2 }

for _, i in ipairs(n) do
	homedecor.register("picture_frame"..i, {
		description = S("Picture Frame @1", i),
		mesh = "homedecor_picture_frame.obj",
		tiles = {
			"homedecor_picture_frame_image"..i..".png",
			homedecor.lux_wood,
			"homedecor_picture_frame_back.png",
		},
		inventory_image = "homedecor_picture_frame"..i.."_inv.png",
		wield_image = "homedecor_picture_frame"..i.."_inv.png",
		groups = {not_in_creative_inventory = 1, snappy = 3},
		selection_box = pframe_cbox,
		walkable = false,
		sounds = default.node_sound_glass_defaults()
	})
end

local p_cbox = {
	type = "fixed",
	fixed = {
		{ -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 }
	}
}

for i = 1,20 do
	homedecor.register("painting_"..i, {
		description = S("Decorative painting #@1", i),
		mesh = "homedecor_painting.obj",
		tiles = {
			"default_wood.png",
			"homedecor_blank_canvas.png",
			"homedecor_painting"..i..".png"
		},
		selection_box = p_cbox,
		walkable = false,
		groups = {not_in_creative_inventory = 1, snappy=3},
		sounds = default.node_sound_wood_defaults(),
	})
end

-- homedecor_roofing

homedecor_roofing = {}

minetest.register_node(":homedecor:skylight", {
	description = S("Glass Skylight"),
	drawtype = "raillike",
	tiles = { "default_glass.png" },
	wield_image = "default_glass.png",
	inventory_image = "homedecor_skylight_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
	selection_box = homedecor.nodebox.slab_y(0.1),
})

minetest.register_node(":homedecor:skylight_frosted", {
	description = S("Glass Skylight Frosted"),
	drawtype = "raillike",
	tiles = { "homedecor_skylight_frosted.png" },
	wield_image = "homedecor_skylight_frosted.png",
	inventory_image = "homedecor_skylight_frosted_inv.png",
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
	selection_box = homedecor.nodebox.slab_y(0.1),
})

for s, s_loc in pairs({ ["asphalt"] = S("asphalt"), ["terracotta"] = S("terracotta"), ["wood"] = S("wood") }) do
	minetest.register_node(":homedecor:shingles_"..s, {
		description = S("Shingles (@1)", s_loc),
		drawtype = "raillike",
		tiles = { "homedecor_shingles_"..s..".png" },
		wield_image = "homedecor_shingles_"..s..".png",
		inventory_image = "homedecor_shingles_"..s.."_inv.png",
		paramtype = "light",
		walkable = false,
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = homedecor.nodebox.slab_y(0.1),
	})
end

local slope_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
		{-0.5,     0,     0, 0.5,  0.25, 0.5},
		{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
	}
}

local ocorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5,   0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25,  0.25,     0, 0.5},
		{-0.5,     0,     0,     0,  0.25, 0.5},
		{-0.5,  0.25,  0.25, -0.25,   0.5, 0.5}
	}
}

local icorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.25, 0.5, 0, 0.5}, -- NodeBox6
		{-0.5, -0.5, -0.5, 0.25, 0, 0.5}, -- NodeBox7
		{-0.5, 0, -0.5, 0, 0.25, 0.5}, -- NodeBox8
		{-0.5, 0, 0, 0.5, 0.25, 0.5}, -- NodeBox9
		{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5}, -- NodeBox10
		{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5}, -- NodeBox11
	}
}

homedecor_roofing.register_outer_corner = function(modname, subname, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	minetest.register_node(":"..modname..":shingle_outer_corner_" .. subname, {
		description = S("@1 (outer corner)", description),
		drawtype = "mesh",
		mesh = "homedecor_slope_outer_corner.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = ocorner_cbox,
		collision_box = ocorner_cbox,
		groups = groups,
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

homedecor_roofing.register_inner_corner = function(modname, subname, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	minetest.register_node(":"..modname..":shingle_inner_corner_" .. subname, {
		description = S("@1 (inner corner)", description),
		drawtype = "mesh",
		mesh = "homedecor_slope_inner_corner.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		collision_box = icorner_cbox,
		groups = groups,
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

homedecor_roofing.register_slope = function(modname, subname, recipeitem, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	minetest.register_node(":"..modname..":shingle_side_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "homedecor_slope.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		use_texture_alpha = "clip",
		selection_box = slope_cbox,
		collision_box = slope_cbox,
		groups = groups,
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

homedecor_roofing.register_roof = function(modname, subname, groups, slope_image , description)
	homedecor_roofing.register_outer_corner(modname, subname, groups, slope_image, description)
	homedecor_roofing.register_inner_corner(modname, subname, groups, slope_image, description)
end

-- corners

homedecor_roofing.register_roof("homedecor", "wood",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_wood.png" },
	S("Wood Shingles")
)

homedecor_roofing.register_roof("homedecor", "asphalt",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_asphalt.png" },
	S("Asphalt Shingles")
)

homedecor_roofing.register_roof("homedecor", "terracotta",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_terracotta.png" },
	S("Terracotta Shingles")
)

-- register just the slopes

homedecor_roofing.register_slope("homedecor", "wood",
	"homedecor:shingles_wood",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_wood.png" },
	S("Wood Shingles")
)

homedecor_roofing.register_slope("homedecor", "asphalt",
	"homedecor:shingles_asphalt",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_asphalt.png" },
	S("Asphalt Shingles")
)

homedecor_roofing.register_slope("homedecor", "terracotta",
	"homedecor:shingles_terracotta",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_terracotta.png" },
	S("Terracotta Shingles")
)

homedecor_roofing.register_slope("homedecor", "glass",
	"homedecor:shingles_glass",
	{ not_in_creative_inventory = 1, snappy = 3 },
	{ "homedecor_shingles_glass.png", "homedecor_shingles_wood.png" },
	S("Glass Shingles")
)


homedecor.register("chimney", {
	description = S("Chimney"),
	mesh = "homedecor_chimney.obj",
	tiles = {
		"homedecor_chimney_tb.png",
		"default_brick.png"
	},
	selection_box = homedecor.nodebox.bar_y(0.25),
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

-- homedecor_seating

local dc_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 0, 1 }
}

homedecor.register("deckchair", {
	mesh = "homedecor_deckchair.obj",
	tiles = {"homedecor_deckchair.png"},
	description = "Deck Chair",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	expand = { forward="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	selection_box = dc_cbox,
	collision_box = dc_cbox,
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

minetest.register_alias("homedecor:deckchair_foot", "homedecor:deckchair")
minetest.register_alias("homedecor:deckchair_head", "air")

homedecor.register("deckchair_striped_blue", {
	mesh = "homedecor_deckchair.obj",
	tiles = {"homedecor_deckchair_striped_blue.png"},
	description = "Deck Chair (blue striped)",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	expand = { forward="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	selection_box = dc_cbox,
	collision_box = dc_cbox,
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

homedecor.register("simple_bench", {
	tiles = { "homedecor_generic_wood_old.png" },
	description = "Simple Bench",
	groups = {not_in_creative_inventory = 1, snappy=3},
	node_box = {
	type = "fixed",
	fixed = {
			{-0.5, -0.15, 0,  0.5,  -0.05, 0.4},
			{-0.4, -0.5,  0.1, -0.3, -0.15, 0.3},
			{ 0.3, -0.5,  0.1,  0.4, -0.15, 0.3},
			}
	},
	sounds = default.node_sound_wood_defaults(),
})

local bl1_sbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.25, 1.5, 0.5, 0.5 }
}

local bl1_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.25, 1.5, 0, 0.5 },
		{-0.5, -0.5, 0.45, 1.5, 0.5, 0.5 },
	}
}

homedecor.register("bench_large_1", {
	mesh = "homedecor_bench_large_1.obj",
	tiles = {
		"homedecor_generic_wood_old.png",
		"homedecor_generic_metal_wrought_iron.png"
	},
	description = "Garden Bench (style 1)",
	inventory_image = "homedecor_bench_large_1_inv.png",
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	expand = { right="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	selection_box = bl1_sbox,
	node_box = bl1_cbox,
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

minetest.register_alias("homedecor:bench_large_1_left", "homedecor:bench_large_1")
minetest.register_alias("homedecor:bench_large_1_right", "air")

local bl2_sbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.25, 1.5, 0.5, 0.5 }
}

local bl2_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.25, 1.5, 0, 0.5 },
		{-0.5, -0.5, 0.45, 1.5, 0.5, 0.5 },
	}
}

homedecor.register("bench_large_2", {
	description = "Garden Bench (style 2)",
	mesh = "homedecor_bench_large_2.obj",
	tiles = { "homedecor_generic_wood_old.png" },
	inventory_image = "homedecor_bench_large_2_inv.png",
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = bl2_sbox,
	node_box = bl2_cbox,
	expand = { right="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.disallow or nil,
})

minetest.register_alias("homedecor:bench_large_2_left", "homedecor:bench_large_2")
minetest.register_alias("homedecor:bench_large_2_right", "air")

local kc_cbox = {
	type = "fixed",
	fixed = { -0.3125, -0.3125, -0.5, 0.3125, 0.3125, 0.5 },
}

homedecor.register("kitchen_chair_wood", {
	description = "Kitchen chair",
	mesh = "homedecor_kitchen_chair.obj",
	tiles = {
		homedecor.plain_wood,
		homedecor.plain_wood
	},
	inventory_image = "homedecor_chair_wood_inv.png",
	paramtype2 = "wallmounted",
	selection_box = kc_cbox,
	collision_box = kc_cbox,
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("kitchen_chair_padded", {
	description = "Kitchen chair",
	mesh = "homedecor_kitchen_chair.obj",
	tiles = {
		homedecor.plain_wood,
		"wool_white.png",
	},
	inventory_image = "homedecor_chair_padded_inv.png",
	paramtype2 = "colorwallmounted",
	selection_box = kc_cbox,
	collision_box = kc_cbox,
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=2,oddly_breakable_by_hand=2, ud_param2_colorable = 1},
	sounds = default.node_sound_wood_defaults(),
})

local ofchairs_sbox = {
	type = "fixed",
	fixed = { -8/16, -8/16, -8/16, 8/16, 29/32, 8/16 }
}
local ofchairs_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16,   1/16, -7/16,  5/16,   4/16,  7/16 }, -- seat
		{ -5/16,   4/16,  4/16,  5/16,  29/32, 15/32 }, -- seatback
		{ -1/16, -11/32, -1/16,  1/16,   1/16,  1/16 }, -- cylinder
		{ -8/16,  -8/16, -8/16,  8/16, -11/32,  8/16 }  -- legs/wheels
	}
}

local chairs = {
	{ "basic",   "Basic office chair" },
	{ "upscale", "Upscale office chair" },
}

for _, c in pairs(chairs) do
	local name, desc = unpack(c)
	homedecor.register("office_chair_"..name, {
		description = desc,
		drawtype = "mesh",
		tiles = { "homedecor_office_chair_"..name..".png" },
		mesh = "homedecor_office_chair_"..name..".obj",
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = ofchairs_sbox,
		collision_box = ofchairs_cbox,
		expand = { top = "placeholder" },
		on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
	})
end

-- homedecor_tables

local fdir_to_right = {
	{  1,  0 },
	{  0, -1 },
	{ -1,  0 },
	{  0,  1 },
}

local function check_right(pos, fdir, long, placer)
	if not fdir or fdir > 3 then fdir = 0 end

	local pos2 = { x = pos.x + fdir_to_right[fdir+1][1],     y=pos.y, z = pos.z + fdir_to_right[fdir+1][2]     }
	local pos3 = { x = pos.x + fdir_to_right[fdir+1][1] * 2, y=pos.y, z = pos.z + fdir_to_right[fdir+1][2] * 2 }

	local node2 = minetest.get_node(pos2)
	if node2 and node2.name ~= "air" then
		return false
	elseif minetest.is_protected(pos2, placer:get_player_name()) then
		if not long then
			minetest.chat_send_player(placer:get_player_name(), S("Someone else owns the spot where the other end goes!"))
		else
			minetest.chat_send_player(placer:get_player_name(),
				S("Someone else owns the spot where the middle or far end goes!"))
		end
		return false
	end

	if long then
		local node3 = minetest.get_node(pos3)
		if node3 and node3.name ~= "air" then
			return false
		elseif minetest.is_protected(pos3, placer:get_player_name()) then
			minetest.chat_send_player(placer:get_player_name(), S("Someone else owns the spot where the other end goes!"))
			return false
		end
	end

	return true
end

minetest.register_alias("lrfurn:coffeetable_back", "lrfurn:coffeetable")
minetest.register_alias("lrfurn:coffeetable_front", "air")

minetest.register_node(":lrfurn:coffeetable", {
	description = S("Coffee Table"),
	drawtype = "nodebox",
	tiles = {
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
					--legs
					{ -0.375,  -0.5, -0.375,  -0.3125, -0.0625, -0.3125 },
					{  0.3125, -0.5, -0.375,   0.375,  -0.0625, -0.3125 },
					{ -0.375,  -0.5,  1.3125, -0.3125, -0.0625,  1.375  },
					{ 0.3125,  -0.5,  1.3125,  0.375,  -0.0625,  1.375  },
					--tabletop
					{-0.4375, -0.0625, -0.4375, 0.4375, 0, 1.4375},
				}
	},
	selection_box = {
		type = "fixed",
		fixed = {
					{-0.4375, -0.5, -0.4375, 0.4375, 0.0, 1.4375},
				}
	},

	after_place_node = function(pos, placer, itemstack, pointed_thing)
		if minetest.is_protected(pos, placer:get_player_name()) then return true end
		local node = minetest.get_node(pos)
		local fdir = node.param2

		if check_right(pos, fdir, false, placer) then
			minetest.set_node(pos, { name = node.name, param2 = (fdir + 1) % 4 })
		else
			minetest.chat_send_player(placer:get_player_name(),
			  S("No room to place the coffee table!"))
			minetest.set_node(pos, {name = "air"})
			return true
		end
	end,
})

minetest.register_node(":lrfurn:endtable", {
	description = S("End Table"),
	drawtype = "nodebox",
	tiles = {
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png",
		"lrfurn_coffeetable_back.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
					--legs
					{-0.375, -0.5, -0.375, -0.3125, -0.0625, -0.3125},
					{0.3125, -0.5, -0.375, 0.375, -0.0625, -0.3125},
					{-0.375, -0.5, 0.3125, -0.3125, -0.0625, 0.375},
					{0.3125, -0.5, 0.3125, 0.375, -0.0625, 0.375},

					--tabletop
					{-0.4375, -0.0625, -0.4375, 0.4375, 0, 0.4375},
				}
	},
	selection_box = {
		type = "fixed",
		fixed = {
					{-0.4375, -0.5, -0.4375, 0.4375, 0.0, 0.4375},
				}
	},
})

local materials = {
	{ "glass",
		S("Small square glass table"),
		S("Small round glass table"),
		S("Large glass table piece"),
	},
	{ "wood",
		S("Small square wooden table"),
		S("Small round wooden table"),
		S("Large wooden table piece"),
	}
}

local tables_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5,    -0.5,  0.5,    -0.4375, 0.5 },
}

for i, mat in ipairs(materials) do
	local m, small_s, small_r, large = unpack(mat)
	local s
	local alpha

	if m == "glass" then
		s = default.node_sound_glass_defaults()
		alpha = "clip"
	else
		s = default.node_sound_wood_defaults()
		alpha = "opaque"
	end

-- small square tables

	homedecor.register(m.."_table_small_square", {
		description = small_s,
		mesh = "homedecor_table_small_square.obj",
		tiles = { 'homedecor_'..m..'_table_small_square.png' },
		wield_image = 'homedecor_'..m..'_table_small_square_inv.png',
		inventory_image = 'homedecor_'..m..'_table_small_square_inv.png',
		use_texture_alpha = alpha,
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = s,
		selection_box = tables_cbox,
		collision_box = tables_cbox,
		on_place = minetest.rotate_node
	})

-- small round tables

	homedecor.register(m..'_table_small_round', {
		description = small_r,
		mesh = "homedecor_table_small_round.obj",
		tiles = { "homedecor_"..m.."_table_small_round.png" },
		wield_image = 'homedecor_'..m..'_table_small_round_inv.png',
		inventory_image = 'homedecor_'..m..'_table_small_round_inv.png',
		use_texture_alpha = alpha,
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = s,
		selection_box = tables_cbox,
		collision_box = tables_cbox,
		on_place = minetest.rotate_node
	})

-- Large square table pieces

	homedecor.register(m..'_table_large', {
		description = large,
		tiles = {
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_tb.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png',
			'homedecor_'..m..'_table_large_edges.png'
		},
		wield_image = 'homedecor_'..m..'_table_large_inv.png',
		inventory_image = 'homedecor_'..m..'_table_large_inv.png',
		use_texture_alpha = alpha,
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		sounds = s,
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
		},
		selection_box = tables_cbox,
		on_place = minetest.rotate_node
	})

	minetest.register_alias('homedecor:'..m..'_table_large_b', 'homedecor:'..m..'_table_large')
	minetest.register_alias('homedecor:'..m..'_table_small_square_b', 'homedecor:'..m..'_table_small_square')
	minetest.register_alias('homedecor:'..m..'_table_small_round_b', 'homedecor:'..m..'_table_small_round')

end

-- other tables

homedecor.register("utility_table_top", {
	description = S("Utility Table"),
	tiles = {
		'homedecor_utility_table_tb.png',
		'homedecor_utility_table_tb.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png',
		'homedecor_utility_table_edges.png'
	},
	wield_image = 'homedecor_utility_table_tb.png',
	inventory_image = 'homedecor_utility_table_tb.png',
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "wallmounted",
	node_box = {
		type = "wallmounted",
		wall_bottom = { -0.5, -0.5,    -0.5,  0.5,   -0.4375, 0.5 },
		wall_top =    { -0.5,  0.4375, -0.5,  0.5,    0.5,    0.5 },
		wall_side =   { -0.5, -0.5,    -0.5, -0.4375, 0.5,    0.5 },
	},
	selection_box = {
		type = "wallmounted",
		wall_bottom = { -0.5, -0.5,    -0.5,  0.5,   -0.4375, 0.5 },
		wall_top =    { -0.5,  0.4375, -0.5,  0.5,    0.5,    0.5 },
		wall_side =   { -0.5, -0.5,    -0.5, -0.4375, 0.5,    0.5 },
	},
})

-- Various kinds of table legs

-- local above
materials = {
	{ "brass",          S("brass") },
	{ "wrought_iron",   S("wrought iron") },
}

for _, t in ipairs(materials) do
local name, desc = unpack(t)
homedecor.register("table_legs_"..name, {
	description = S("Table Legs (@1)", desc),
	drawtype = "plantlike",
	tiles = {"homedecor_table_legs_"..name..".png"},
	inventory_image = "homedecor_table_legs_"..name..".png",
	wield_image = "homedecor_table_legs_"..name..".png",
	walkable = false,
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})
end

homedecor.register("utility_table_legs", {
	description = S("Legs for Utility Table"),
	drawtype = "plantlike",
	tiles = { 'homedecor_utility_table_legs.png' },
	inventory_image = 'homedecor_utility_table_legs_inv.png',
	wield_image = 'homedecor_utility_table_legs.png',
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})

-- homedecor_trash_cans

local tg_cbox = {
	type = "fixed",
	fixed = { -0.35, -0.5, -0.35, 0.35, 0.4, 0.35 }
}

local trashcan_green = 0x00006000

homedecor.register("trash_can_green", {
	drawtype = "mesh",
	mesh = "homedecor_trash_can_green.obj",
	tiles = { { name = "homedecor_generic_plastic.png", color = trashcan_green } },
	inventory_image = "homedecor_trash_can_green_inv.png",
	description = S("Green Trash Can"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = tg_cbox,
	collision_box = tg_cbox,
})

homedecor.register("trash_can_green_open", {
	drawtype = "mesh",
	mesh = "homedecor_trash_can_green_open.obj",
	tiles = { { name = "homedecor_generic_plastic.png", color = trashcan_green } },
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = tg_cbox,
	collision_box = tg_cbox,
	drop = "homedecor:trash_can_green",
})

local trash_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.125, 0.25 }
}

homedecor.register("trash_can", {
	drawtype = "mesh",
	mesh = "homedecor_trash_can.obj",
	tiles = { "homedecor_trash_can.png" },
	inventory_image = "homedecor_trash_can_inv.png",
	use_texture_alpha = "clip",
	description = S("Small Trash Can"),
	groups = {not_in_creative_inventory = 1, snappy=3},
	selection_box = trash_cbox,
	collision_box = trash_cbox,
})

-- homedecor_wardrobe
local wd_cbox = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}}

local def = {
	description = S("Wardrobe"),
	drawtype = "mesh",
	mesh = "homedecor_bedroom_wardrobe.obj",
	tiles = {
		{name = "homedecor_generic_wood_plain.png", color = 0xffa76820},
		"homedecor_wardrobe_drawers.png",
		"homedecor_wardrobe_doors.png"
	},
	inventory_image = "homedecor_wardrobe_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy = 3},
	selection_box = wd_cbox,
	collision_box = wd_cbox,
	sounds = default.node_sound_wood_defaults(),
	on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple or nil,
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_vertically(itemstack, placer, pointed_thing,
				itemstack:get_name(), "placeholder")
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		return meta:get_inventory():is_empty("main")
	end,
}
minetest.register_node(":homedecor:wardrobe", def)

-- homedecor_windows_and_treatments

homedecor_windows_and_treatments = {}

homedecor.register("window_quartered", {
	description = S("Window (quartered)"),
	tiles = {
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_quartered.png",
		"homedecor_window_quartered.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.025, 0.5, 0.5, 0}, -- NodeBox1
			{-0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox2
			{-0.5, -0.5, -0.0625, 0.5, -0.4375, 0.0625}, -- NodeBox3
			{-0.5, -0.0625, -0.025, 0.5, 0.0625, 0.025}, -- NodeBox4
			{0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox5
			{-0.5, -0.5, -0.0625, -0.4375, 0.5, 0.0625}, -- NodeBox6
			{-0.0625, -0.5, -0.025, 0.0625, 0.5, 0.025}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}
	}
})

homedecor.register("window_plain", {
	description = S("Window (plain)"),
	tiles = {
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_sides.png",
		"homedecor_window_frame.png",
		"homedecor_window_frame.png"
	},
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.025, 0.5, 0.5, 0}, -- NodeBox1
			{-0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox2
			{-0.5, -0.5, -0.0625, 0.5, -0.4375, 0.0625}, -- NodeBox3
			{0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox4
			{-0.5, -0.5, -0.0625, -0.4375, 0.5, 0.0625}, -- NodeBox5
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}
	}
})

local wb1_cbox = {
	type = "fixed",
	fixed = { -8/16, -8/16, 5/16, 8/16, 8/16, 8/16 },
}

homedecor.register("blinds_thick", {
	description = S("Window Blinds (thick)"),
	mesh = "homedecor_windowblind_thick.obj",
	inventory_image = "homedecor_windowblind_thick_inv.png",
	tiles = {
		"homedecor_windowblind_strings.png",
		"homedecor_windowblinds.png"
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = wb1_cbox
})

local wb2_cbox = {
	type = "fixed",
	fixed = { -8/16, -8/16, 6/16, 8/16, 8/16, 8/16 },
}

homedecor.register("blinds_thin", {
	description = S("Window Blinds (thin)"),
	mesh = "homedecor_windowblind_thin.obj",
	inventory_image = "homedecor_windowblind_thin_inv.png",
	tiles = {
		"homedecor_windowblind_strings.png",
		"homedecor_windowblinds.png"
	},
	walkable = false,
	groups = {not_in_creative_inventory = 1, snappy=3},
	sounds = default.node_sound_wood_defaults(),
	selection_box = wb2_cbox
})

minetest.register_node(":homedecor:curtain_closed", {
	description = S("Curtains"),
	tiles = { "homedecor_curtain.png" },
	inventory_image = "homedecor_curtain.png",
	drawtype = 'signlike',
	use_texture_alpha = "clip",
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3, ud_param2_colorable = 1},
	sounds = default.node_sound_leaves_defaults(),
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	selection_box = { type = "wallmounted" },
})

minetest.register_node(":homedecor:curtain_open", {
	description = S("Curtains (open)"),
	tiles = { "homedecor_curtain_open.png" },
	inventory_image = "homedecor_curtain_open.png",
	drawtype = 'signlike',
	use_texture_alpha = "clip",
	walkable = false,
	groups = {not_in_creative_inventory = 1,  snappy = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_leaves_defaults(),
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	selection_box = { type = "wallmounted" },
})

local mats = {
	{ "brass", S("brass"), "homedecor_generic_metal_brass.png" },
	{ "wrought_iron", S("wrought iron"), "homedecor_generic_metal_wrought_iron.png" },
	{ "wood", S("wood"), "default_wood.png" }
}

for _, m in ipairs(mats) do
	local material, mat_name, texture = unpack(m)
	homedecor.register("curtainrod_"..material, {
		tiles = { texture },
		inventory_image  = "homedecor_curtainrod_"..material.."_inv.png",
		description = S("Curtain Rod (@1)", mat_name),
		groups = {not_in_creative_inventory = 1,  snappy = 3 },
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.375, 0.5, -0.4375, 0.4375},
				{-0.4375, -0.5, 0.4375, -0.375, -0.4375, 0.5},
				{0.375, -0.5, 0.4375, 0.4375, -0.4375, 0.5}
			}
		}
	})
end

homedecor.register("window_flowerbox", {
	description = S("Window flowerbox"),
	tiles = {
		"homedecor_flowerbox_top.png",
		"homedecor_flowerbox_bottom.png",
		"homedecor_flowerbox_sides.png"
	},
	inventory_image = "homedecor_flowerbox_inv.png",
	use_texture_alpha = "clip",
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0.25, -0.125, 0.375, 0.5, 0.375}, -- NodeBox1
			{-0.3125, 0.4375, 0.375, -0.25, 0.4875, 0.5}, -- NodeBox2
			{0.25, 0.4375, 0.375, 0.3125, 0.4875, 0.5}, -- NodeBox3
		}
	}
})

homedecor.register("stained_glass", {
	description = S("Stained Glass"),
	tiles = {"homedecor_stained_glass.png"},
	inventory_image = "homedecor_stained_glass.png",
	groups = {not_in_creative_inventory = 1, snappy=3},
	use_texture_alpha = "clip",
	light_source = 3,
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, 0.46875, 0.5, 0.5, 0.5} }
	}
})

-- Various kinds of window shutters

local shutters = {
	"mahogany",
	"red",
	"yellow",
	"forest_green",
	"light_blue",
	"violet",
	"black",
	"dark_grey",
	"grey",
	"white",
}

local shutter_cbox = {
	type = "wallmounted",
	wall_top =		{ -0.5,  0.4375, -0.5,  0.5,     0.5,    0.5 },
	wall_bottom =	{ -0.5, -0.5,    -0.5,  0.5,    -0.4375, 0.5 },
	wall_side =		{ -0.5, -0.5,    -0.5, -0.4375,  0.5,    0.5 }
}

local inv = "homedecor_window_shutter_inv.png^[colorize:#a87034:150"

homedecor.register("shutter", {
	mesh = "homedecor_window_shutter.obj",
	tiles = {
		{ name = "homedecor_window_shutter.png", color = 0xffa87034 }
	},
	description = S("Wooden Shutter"),
	inventory_image = inv,
	wield_image = inv,
	paramtype2 = "colorwallmounted",
	airbrush_replacement_node = "homedecor:shutter_colored",
	groups = {not_in_creative_inventory = 1,  snappy = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_wood_defaults(),
	selection_box = shutter_cbox,
	node_box = shutter_cbox,
})

homedecor.register("shutter_colored", {
	mesh = "homedecor_window_shutter.obj",
	tiles = { "homedecor_window_shutter.png" },
	description = S("Wooden Shutter"),
	inventory_image = "homedecor_window_shutter_inv.png",
	wield_image = "homedecor_window_shutter_inv.png",
	paramtype2 = "colorwallmounted",
	groups = {not_in_creative_inventory = 1, snappy = 3, ud_param2_colorable = 1},
	sounds = default.node_sound_wood_defaults(),
	selection_box = shutter_cbox,
	node_box = shutter_cbox,
})

