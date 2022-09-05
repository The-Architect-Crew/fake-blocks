-- farming/init.lua

-- Load support for MT game translation.
local S = minetest.get_translator("farming")

-- Global farming namespace

farming = {}
farming.path = minetest.get_modpath("farming")
farming.get_translator = S

-- Load files

dofile(farming.path .. "/api.lua")

-- Wheat

farming.register_plant("farming:wheat", {
	description = S("Wheat Seed"),
	harvest_description = S("Wheat"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_wheat_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {not_in_creative_inventory = 1, food_wheat = 1, flammable = 4},
	place_param2 = 3,
})

-- Cotton

farming.register_plant("farming:cotton", {
	description = S("Cotton Seed"),
	harvest_description = S("Cotton"),
	inventory_image = "farming_cotton_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland", "desert"},
	groups = {not_in_creative_inventory = 1, flammable = 4},
})

-- farming/nodes.lua

-- support for MT game translation.
local S = farming.get_translator

minetest.register_node("farming:soil", {
	description = S("Soil"),
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("farming:soil_wet", {
	description = S("Wet Soil"),
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("farming:dry_soil", {
	description = S("Savanna Soil"),
	tiles = {"default_dry_dirt.png^farming_soil.png", "default_dry_dirt.png"},
	drop = "default:dry_dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("farming:dry_soil_wet", {
	description = S("Wet Savanna Soil"),
	tiles = {"default_dry_dirt.png^farming_soil_wet.png", "default_dry_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dry_dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("farming:desert_sand_soil", {
	description = S("Desert Sand Soil"),
	drop = "default:desert_sand",
	tiles = {"farming_desert_sand_soil.png", "default_desert_sand.png"},
	groups = {crumbly=3, not_in_creative_inventory = 1, falling_node=1, sand=1, soil = 2, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("farming:desert_sand_soil_wet", {
	description = S("Wet Desert Sand Soil"),
	drop = "default:desert_sand",
	tiles = {"farming_desert_sand_soil_wet.png", "farming_desert_sand_soil_wet_side.png"},
	groups = {crumbly=3, falling_node=1, sand=1, not_in_creative_inventory=1, soil=3, wet = 1, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("farming:straw", {
	description = S("Straw"),
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, snappy=3, flammable=4, fall_damage_add_percent=-30},
	sounds = default.node_sound_leaves_defaults(),
})

do
	local recipe = "farming:straw"
	local groups = {not_in_creative_inventory = 1, snappy = 3, flammable = 4}
	local images = {"farming_straw.png"}
	local sounds = default.node_sound_leaves_defaults()

	stairs.register_stair("straw", recipe, groups, images, S("Straw Stair"),
		sounds, true)
	stairs.register_stair_inner("straw", recipe, groups, images, "",
		sounds, true, S("Inner Straw Stair"))
	stairs.register_stair_outer("straw", recipe, groups, images, "",
		sounds, true, S("Outer Straw Stair"))
	stairs.register_slab("straw", recipe, groups, images, S("Straw Slab"),
		sounds, true)
end

-- Wild cotton as a source of cotton seed

minetest.register_node("farming:cotton_wild", {
	description = S("Wild Cotton"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"farming_cotton_wild.png"},
	inventory_image = "farming_cotton_wild.png",
	wield_image = "farming_cotton_wild.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {not_in_creative_inventory = 1, snappy = 3, attached_node = 1, flammable = 4},
	drop = "farming:seed_cotton",
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -8 / 16, -6 / 16, 6 / 16, 5 / 16, 6 / 16},
	},
})
