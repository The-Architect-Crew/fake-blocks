minetest.register_node(":currency:safe", {
	description = "Safe (Deprecated)",
	inventory_image = "safe_front.png",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"safe_side.png",
			"safe_side.png",
			"safe_side.png",
			"safe_side.png",
			"safe_side.png",
			"safe_front.png",},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1 ,cracky=1},
})

minetest.register_node(":currency:barter", {
	drawtype = "nodebox",
	description = "Barter Table (Deprecated)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"barter_top.png",
					"barter_base.png",
					"barter_side.png"},
	inventory_image = "barter_top.png",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.312500,-0.500000,0.500000,0.500000,0.500000},
			{-0.437500,-0.500000,-0.437500,-0.250000,0.500000,-0.250000},
			{-0.437500,-0.500000,0.250000,-0.250000,0.500000,0.437500},
			{0.250000,-0.500000,-0.437500,0.437500,0.500000,-0.250000},
			{0.250000,-0.500000,0.250000,0.437500,0.500000,0.447500},
		},
	},
	groups = {not_in_creative_inventory = 1, choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":currency:shop", {
	description = "Shop (Deprecated)",
	paramtype2 = "facedir",
	tiles = {"shop_top.png",
			"shop_top.png",
			"shop_side.png",
			"shop_side.png",
			"shop_side.png",
			"shop_front.png"},
	inventory_image = "shop_front.png",
	groups = {not_in_creative_inventory = 1, choppy=2,oddly_breakable_by_hand=2,tubedevice=1,tubedevice_receiver=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":currency:shop_empty", {
	description = "Shop (out of stock) (Deprecated)",
	paramtype2 = "facedir",
	tiles = {"shop_top.png",
			"shop_top.png",
			"shop_side_empty.png",
			"shop_side_empty.png",
			"shop_side_empty.png",
			"shop_front_empty.png"},
	drop = "currency:shop",
	groups = {not_in_creative_inventory = 1, choppy=2,oddly_breakable_by_hand=2,tubedevice=1,tubedevice_receiver=1},
	sounds = default.node_sound_wood_defaults(),
})