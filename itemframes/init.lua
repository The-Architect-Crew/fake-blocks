local S = minetest.get_translator("itemframes")

minetest.register_node("itemframes:pedestal",{
	description = S("Pedestal (Deprecated)"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed", fixed = {
			{-7/16, -8/16, -7/16, 7/16, -7/16, 7/16}, -- bottom plate
			{-6/16, -7/16, -6/16, 6/16, -6/16, 6/16}, -- bottom plate (upper)
			{-0.25, -6/16, -0.25, 0.25, 11/16, 0.25}, -- pillar
			{-7/16, 11/16, -7/16, 7/16, 12/16, 7/16}, -- top plate
		}
	},
	--selection_box = {
	--	type = "fixed",
	--	fixed = {-7/16, -0.5, -7/16, 7/16, 12/16, 7/16}
	--},
	tiles = {"itemframes_pedestal.png"},
	paramtype = "light",
	groups = {not_in_creative_inventory = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})