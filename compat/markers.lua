minetest.register_node(":markers:mark", {
	description = "Area Marker (Deprecated)",
	tiles = {"markers_mark.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=1}, --fixed on both buttons dig client crash
	light_source = 1,
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.1, -0.5, -0.1, 0.1, 1.5, 0.1 },
		},
	},
})

minetest.register_node(":markers:stone", {
	description = "Area Editing Stone (Deprecated)",
	tiles = {"markers_stone.png", "markers_stone.png", "markers_stone_side.png",
                "markers_stone_side.png", "markers_stone_side.png", "markers_stone_side.png" },
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
})