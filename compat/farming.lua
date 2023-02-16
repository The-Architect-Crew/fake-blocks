-- farming/init.lua

-- Global farming namespace
farming = {}
farming.path = minetest.get_modpath("farming")

-- farming/api.lua
farming.registered_plants = {}

-- Register plants
farming.register_plant = function(name, def)
	local mname = name:split(":")[1]
	local pname = name:split(":")[2]

	-- Check def table
	if not def.description then
		def.description = "Seed"
	end
	if not def.harvest_description then
		def.harvest_description = pname:gsub("^%l", string.upper)
	end
	if not def.inventory_image then
		def.inventory_image = "unknown_item.png"
	end
	if not def.steps then
		return nil
	end
	if not def.minlight then
		def.minlight = 1
	end
	if not def.maxlight then
		def.maxlight = 14
	end
	if not def.fertility then
		def.fertility = {}
	end

	farming.registered_plants[pname] = def

	-- Register seed
	local lbm_nodes = {mname .. ":seed_" .. pname}
	local g = {not_in_creative_inventory = 1, seed = 1, snappy = 3, attached_node = 1, flammable = 2}
	for k, v in pairs(def.fertility) do
		g[v] = 1
	end
	minetest.register_node(":" .. mname .. ":seed_" .. pname, {
		description = def.description,
		tiles = {def.inventory_image},
		inventory_image = def.inventory_image,
		wield_image = def.inventory_image,
		drawtype = "signlike",
		groups = g,
		paramtype = "light",
		paramtype2 = "wallmounted",
		place_param2 = def.place_param2 or nil, -- this isn't actually used for placement
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		fertility = def.fertility,
		sounds = default.node_sound_dirt_defaults({
			dig = {name = "", gain = 0},
			dug = {name = "default_grass_footstep", gain = 0.2},
			place = {name = "default_place_node", gain = 0.25},
		}),
	})

	-- Register growing steps
	for i = 1, def.steps do
		local base_rarity = 1
		if def.steps ~= 1 then
			base_rarity =  8 - (i - 1) * 7 / (def.steps - 1)
		end
		local nodegroups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1}
		nodegroups[pname] = i

		local next_plant = nil

		if i < def.steps then
			next_plant = mname .. ":" .. pname .. "_" .. (i + 1)
			lbm_nodes[#lbm_nodes + 1] = mname .. ":" .. pname .. "_" .. i
		end

		minetest.register_node(":" .. mname .. ":" .. pname .. "_" .. i, {
			drawtype = "plantlike",
			waving = 1,
			tiles = {mname .. "_" .. pname .. "_" .. i .. ".png"},
			paramtype = "light",
			paramtype2 = def.paramtype2 or nil,
			place_param2 = def.place_param2 or nil,
			walkable = false,
			buildable_to = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			groups = nodegroups,
			sounds = default.node_sound_leaves_defaults(),
		})
	end
end

-- farming/init.lua
-- Wheat

farming.register_plant("farming:wheat", {
	description = "Wheat Seed (Deprecated)",
	harvest_description = "Wheat",
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
	description = "Cotton Seed (Deprecated)",
	harvest_description = "Cotton",
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

minetest.register_node(":farming:soil", {
	description = "Soil (Deprecated)",
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node(":farming:soil_wet", {
	description = "Wet Soil (Deprecated)",
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node(":farming:dry_soil", {
	description = "Savanna Soil (Deprecated)",
	tiles = {"default_dry_dirt.png^farming_soil.png", "default_dry_dirt.png"},
	drop = "default:dry_dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node(":farming:dry_soil_wet", {
	description = "Wet Savanna Soil (Deprecated)",
	tiles = {"default_dry_dirt.png^farming_soil_wet.png", "default_dry_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dry_dirt",
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node(":farming:desert_sand_soil", {
	description = "Desert Sand Soil (Deprecated)",
	drop = "default:desert_sand",
	tiles = {"farming_desert_sand_soil.png", "default_desert_sand.png"},
	groups = {crumbly=3, not_in_creative_inventory = 1, falling_node=1, sand=1, soil = 2, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node(":farming:desert_sand_soil_wet", {
	description = "Wet Desert Sand Soil (Deprecated)",
	drop = "default:desert_sand",
	tiles = {"farming_desert_sand_soil_wet.png", "farming_desert_sand_soil_wet_side.png"},
	groups = {crumbly=3, falling_node=1, sand=1, not_in_creative_inventory=1, soil=3, wet = 1, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node(":farming:straw", {
	description = "Straw (Deprecated)",
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

	stairs.register_stair("straw", recipe, groups, images, "Straw Stair",
		sounds, true)
	stairs.register_stair_inner("straw", recipe, groups, images, "",
		sounds, true, "Inner Straw Stair")
	stairs.register_stair_outer("straw", recipe, groups, images, "",
		sounds, true, "Outer Straw Stair")
	stairs.register_slab("straw", recipe, groups, images, "Straw Slab",
		sounds, true)
end

-- Wild cotton as a source of cotton seed

minetest.register_node(":farming:cotton_wild", {
	description = "Wild Cotton (Deprecated)",
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
