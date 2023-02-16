-- Aliases for compatibility with 0gb.us's chests_0gb_us mod.
minetest.register_alias("chests_0gb_us:cobble", "more_chests:cobble")
minetest.register_alias("chests_0gb_us:wifi", "more_chests:wifi")
minetest.register_alias("chests_0gb_us:shared", "more_chests:shared")
minetest.register_alias("chests_0gb_us:secret", "more_chests:secret")
minetest.register_alias("chests_0gb_us:dropbox", "more_chests:dropbox")

local S = minetest.get_translator("more_chests")

minetest.register_node("more_chests:cobble", {
	description = "Cobble Chest (Deprecated)",
	tiles = {"default_cobble.png", "default_cobble.png", "default_cobble.png",
		"default_cobble.png", "default_cobble.png", "cobblechest_front.png"},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=2, choppy=2, oddly_breakable_by_hand=2, tubedevice = 1, tubedevice_receiver = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("more_chests:dropbox", {
	description = "Dropbox (Deprecated)",
	tiles = {"dropbox_top.png", "dropbox_top.png", "dropbox_side.png",
		"dropbox_side.png", "dropbox_side.png", "dropbox_front.png"},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=2, choppy=2, oddly_breakable_by_hand=2, tubedevice = 1, tubedevice_receiver = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("more_chests:wifi", {
	description = "Wifi Chest (Deprecated)",
	tiles = {"wifi_top.png", "wifi_top.png", "wifi_side.png",
		"wifi_side.png", "wifi_side.png",
		{name="wifi_front_animated.png", animation={type="vertical_frames",
			aspect_w=16, aspect_h=16, length=2.0}}},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=2, choppy=2, oddly_breakable_by_hand=2, tubedevice = 1, tubedevice_receiver = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("more_chests:secret", {
	description = "Secret Chest (Deprecated)",
	tiles = {"secret_top.png", "secret_top.png", "secret_side.png",
		"secret_side.png", "secret_side.png", "secret_front.png"},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=2, choppy=2, oddly_breakable_by_hand=2, tubedevice = 1, tubedevice_receiver = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("more_chests:shared", {
	description = "Shared Chest (Deprecated)",
	tiles = {"shared_top.png", "shared_top.png", "shared_side.png",
		"shared_side.png", "shared_side.png", "shared_front.png"},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, snappy=2, choppy=2, oddly_breakable_by_hand=2, tubedevice = 1, tubedevice_receiver = 1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
})