local S = minetest.get_translator("fake_fire")

minetest.register_node("fake_fire:ice_fire", {
	inventory_image = "ice_fire_inv.png",
	description = S("Ice fire (Deprecated)"),
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, dig_immediate=3, not_in_creative_inventory=1},
	sunlight_propagates = true,
	buildable_to = true,
	walkable = false,
	light_source = 14,
	waving = 1,
	tiles = {
		{name="ice_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}},
	},
	drop = ""
})

minetest.register_alias("fake_fire:fake_fire", "fire:permanent_flame")

local sbox = {
	type = 'fixed',
	fixed = { -8/16, -8/16, -8/16, 8/16, -6/16, 8/16},
}

minetest.register_node("fake_fire:fancy_fire", {
	inventory_image = "fancy_fire_inv.png",
	description = S("Fancy Fire (Deprecated)"),
	drawtype = "mesh",
	mesh = "fancy_fire.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand=3, flammable=0},
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	light_source = 13,
	walkable = false,
	buildable_to = false,
	damage_per_second = 3,
	selection_box = sbox,
	tiles = {
		"basic_materials_concrete_block.png",
		"default_junglewood.png",
		"fake_fire_empty_tile.png"
	},
	drop = {
		max_items = 3,
		items = {
			{
				items = { "default:torch", "default:torch", "building_blocks:sticks" },
				rarity = 1,
			}
		}
	}
})

-- EMBERS
minetest.register_node("fake_fire:embers", {
    description = S("Glowing Embers (Deprecated)"),
	tiles = {
		{name="embers_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
	},
	light_source = 9,
	groups = {not_in_creative_inventory = 1, crumbly=3},
	paramtype = "light",
	sounds = default.node_sound_dirt_defaults(),
})

-- CHIMNEYS
local materials = {
	{ "stone",     S("Stone chimney top (Deprecated)") },
	{ "sandstone", S("Sandstone chimney top (Deprecated)") },
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

	minetest.register_craft({
		type = "shapeless",
		output = 'fake_fire:chimney_top_'..name,
		recipe = {"default:torch", "stairs:slab_"..name}
	})
end

-- ALIASES

minetest.register_alias("fake_fire:smokeless_fire", "fake_fire:fake_fire")
minetest.register_alias("fake_fire:smokeless_ice_fire", "fake_fire:ice_fire")
minetest.register_alias("fake_fire:smokeless_chimney_top_stone", "fake_fire:chimney_top_stone")
minetest.register_alias("fake_fire:smokeless_chimney_top_sandstone", "fake_fire:chimney_top_sandstone")