minetest.register_node("nyancat:nyancat", {
	description = "Nyan Cat (Deprecated)",
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("nyancat:nyancat_rainbow", {
	description = "Nyan Cat Rainbow (Deprecated)",
	tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

-- Legacy
minetest.register_alias("default:nyancat", "nyancat:nyancat")
minetest.register_alias("default:nyancat_rainbow", "nyancat:nyancat_rainbow")
minetest.register_alias("nyancat", "nyancat:nyancat")
minetest.register_alias("nyancat_rainbow", "nyancat:nyancat_rainbow")