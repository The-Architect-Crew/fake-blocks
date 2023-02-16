-- CHIMNEYS
local materials = {
	{ "stone",     "Stone chimney top (Deprecated)" },
	{ "sandstone", "Sandstone chimney top (Deprecated)" },
}

for _, mat in ipairs(materials) do
	local name, desc = unpack(mat)
	minetest.register_node("fake_fire:chimney_top_"..name, {
		description = desc,
		tiles = {"default_"..name..".png^chimney_top.png", "default_"..name..".png"},
		groups = {not_in_creative_inventory = 1, snappy=3},
		paramtype = "light",
		sounds = default.node_sound_stone_defaults(),
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	})
end

-- ALIASES
minetest.register_alias("fake_fire:smokeless_chimney_top_stone", "fake_fire:chimney_top_stone")
minetest.register_alias("fake_fire:smokeless_chimney_top_sandstone", "fake_fire:chimney_top_sandstone")