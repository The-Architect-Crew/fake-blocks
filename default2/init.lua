local S = minetest.get_translator("default")
dofile(minetest.get_modpath("default2").."/alias.lua")

minetest.register_node(":default:furnace", {
	description = S("Furnace (Deprecated)"),
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "default_furnace_front.png"
	},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:furnace_active", {
	description = S("Furnace (Deprecated)"),
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png",
		{
			image = "default_furnace_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "default:furnace",
	groups = {not_in_creative_inventory = 1, cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

default.chest = {}
function default.chest.register_chest(prefixed_name, d)
	local name = prefixed_name:sub(1,1) == ':' and prefixed_name:sub(2,-1) or prefixed_name
	local def = table.copy(d)
	def.drawtype = "mesh"
	def.visual = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.legacy_facedir_simple = true
	def.is_ground_content = false
	local def_opened = table.copy(def)
	local def_closed = table.copy(def)
	def_opened.mesh = "chest_open.obj"
	for i = 1, #def_opened.tiles do
		if type(def_opened.tiles[i]) == "string" then
			def_opened.tiles[i] = {name = def_opened.tiles[i], backface_culling = true}
		elseif def_opened.tiles[i].backface_culling == nil then
			def_opened.tiles[i].backface_culling = true
		end
	end
	def_opened.drop = name
	def_opened.groups.not_in_creative_inventory = 1
	def_opened.selection_box = {
		type = "fixed",
		fixed = { -1/2, -1/2, -1/2, 1/2, 3/16, 1/2 },
	}
	def_closed.mesh = nil
	def_closed.drawtype = nil
	def_closed.tiles[6] = def.tiles[5] -- swap textures around for "normal"
	def_closed.tiles[5] = def.tiles[3] -- drawtype to make them match the mesh
	def_closed.tiles[3] = def.tiles[3].."^[transformFX"
	minetest.register_node(prefixed_name, def_closed)
	minetest.register_node(prefixed_name .. "_open", def_opened)
end

default.chest.register_chest(":default:chest", {
	description = S("Chest (Deprecated)"),
	tiles = {
		"default_chest_top.png",
		"default_chest_top.png",
		"default_chest_side.png",
		"default_chest_side.png",
		"default_chest_front.png",
		"default_chest_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2},
})

default.chest.register_chest(":default:chest_locked", {
	description = S("Locked Chest (Deprecated)"),
	tiles = {
		"default_chest_top.png",
		"default_chest_top.png",
		"default_chest_side.png",
		"default_chest_side.png",
		"default_chest_lock.png",
		"default_chest_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2},
})

--[[ Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

--]]


--[[ Index:

Stone
-----
(1. Material 2. Cobble variant 3. Brick variant 4. Modified forms)

default:stone
default:cobble
default:stonebrick
default:stone_block
default:mossycobble

default:desert_stone
default:desert_cobble
default:desert_stonebrick
default:desert_stone_block

default:sandstone
default:sandstonebrick
default:sandstone_block
default:desert_sandstone
default:desert_sandstone_brick
default:desert_sandstone_block
default:silver_sandstone
default:silver_sandstone_brick
default:silver_sandstone_block

default:obsidian
default:obsidianbrick
default:obsidian_block

Soft / Non-Stone
----------------
(1. Material 2. Modified forms)

default:dirt
default:dirt_with_grass
default:dirt_with_grass_footsteps
default:dirt_with_dry_grass
default:dirt_with_snow
default:dirt_with_rainforest_litter
default:dirt_with_coniferous_litter
default:dry_dirt
default:dry_dirt_with_dry_grass

default:permafrost
default:permafrost_with_stones
default:permafrost_with_moss

default:sand
default:desert_sand
default:silver_sand

default:gravel

default:clay

default:snow
default:snowblock
default:ice
default:cave_ice

Trees
-----
(1. Trunk 2. Fabricated trunk 3. Leaves 4. Sapling 5. Fruits)

default:tree
default:wood
default:leaves
default:sapling
default:apple

default:jungletree
default:junglewood
default:jungleleaves
default:junglesapling
default:emergent_jungle_sapling

default:pine_tree
default:pine_wood
default:pine_needles
default:pine_sapling

default:acacia_tree
default:acacia_wood
default:acacia_leaves
default:acacia_sapling

default:aspen_tree
default:aspen_wood
default:aspen_leaves
default:aspen_sapling

Ores
----
(1. In stone 2. Blocks)

default:stone_with_coal
default:coalblock

default:stone_with_iron
default:steelblock

default:stone_with_copper
default:copperblock

default:stone_with_tin
default:tinblock

default:bronzeblock

default:stone_with_gold
default:goldblock

default:stone_with_mese
default:mese

default:stone_with_diamond
default:diamondblock

Plantlife
---------

default:cactus
default:large_cactus_seedling

default:papyrus
default:dry_shrub
default:junglegrass

default:grass_1
default:grass_2
default:grass_3
default:grass_4
default:grass_5

default:dry_grass_1
default:dry_grass_2
default:dry_grass_3
default:dry_grass_4
default:dry_grass_5

default:fern_1
default:fern_2
default:fern_3

default:marram_grass_1
default:marram_grass_2
default:marram_grass_3

default:bush_stem
default:bush_leaves
default:bush_sapling
default:acacia_bush_stem
default:acacia_bush_leaves
default:acacia_bush_sapling
default:pine_bush_stem
default:pine_bush_needles
default:pine_bush_sapling
default:blueberry_bush_leaves_with_berries
default:blueberry_bush_leaves
default:blueberry_bush_sapling

default:sand_with_kelp

Corals
------

default:coral_brown
default:coral_orange
default:coral_skeleton

Liquids
-------
(1. Source 2. Flowing)

default:water_source
default:water_flowing

default:river_water_source
default:river_water_flowing

default:lava_source
default:lava_flowing

Tools / "Advanced" crafting / Non-"natural"
-------------------------------------------

default:bookshelf

default:sign_wall_wood
default:sign_wall_steel

default:ladder_wood
default:ladder_steel

default:fence_wood
default:fence_acacia_wood
default:fence_junglewood
default:fence_pine_wood
default:fence_aspen_wood

default:glass
default:obsidian_glass

default:brick

default:meselamp
default:mese_post_light

Misc
----

default:cloud

--]]

-- kept for stairs & slab (stairs)
--[[
default:wood
default:junglewood
default:pine_wood
default:acacia_wood
default:aspen_wood
default:stone
default:cobble
default:mossycobble
default:stonebrick
default:stone_block
default:desert_stone
default:desert_cobble
default:desert_stonebrick
default:desert_stone_block
default:sandstone
default:sandstonebrick
default:sandstone_block
default:desert_sandstone
default:desert_sandstone_brick
default:desert_sandstone_block
default:silver_sandstone
default:silver_sandstone_brick
default:silver_sandstone_block
default:obsidian
default:obsidianbrick
default:obsidian_block
default:brick
default:steelblock
default:tinblock
default:copperblock
default:bronzeblock
default:goldblock
default:ice
default:snowblock
default:glass
default:obsidian_glass
]]

--[[ kept for stairplus (moreblocks)
local default_nodes = {
	"diamondblock",
	"tinblock",
	"desert_stone",
	"desert_stone_block",
	"desert_cobble",
	"meselamp",
	"glass",
	"tree",
	"wood",
	"jungletree",
	"junglewood",
	"pine_tree",
	"pine_wood",
	"acacia_tree",
	"acacia_wood",
	"aspen_tree",
	"aspen_wood",
	"obsidian",
	"obsidian_block",
	"obsidianbrick",
	"obsidian_glass",
	"stonebrick",
	"desert_stonebrick",
	"sandstonebrick",
	"silver_sandstone",
	"silver_sandstone_brick",
	"silver_sandstone_block",
	"desert_sandstone",
	"desert_sandstone_brick",
	"desert_sandstone_block",
	"sandstone_block",
	"coral_skeleton",
	"ice",
}
]]

--
-- Stone
--

minetest.register_node(":default:stone", {
	description = S("Stone (Deprecated)"),
	tiles = {"default_stone.png"},
	groups = {not_in_creative_inventory = 1, cracky = 3, stone = 1},
	drop = "default:cobble",
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:cobble", {
	description = S("Cobblestone (Deprecated)"),
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:stonebrick", {
	description = S("Stone Brick (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:stone_block", {
	description = S("Stone Block (Deprecated)"),
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:mossycobble", {
	description = S("Mossy Cobblestone (Deprecated)"),
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node(":default:desert_stone", {
	description = S("Desert Stone (Deprecated)"),
	tiles = {"default_desert_stone.png"},
	groups = {not_in_creative_inventory = 1, cracky = 3, stone = 1},
	drop = "default:desert_cobble",
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:desert_cobble", {
	description = S("Desert Cobblestone (Deprecated)"),
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:desert_stonebrick", {
	description = S("Desert Stone Brick (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:desert_stone_block", {
	description = S("Desert Stone Block (Deprecated)"),
	tiles = {"default_desert_stone_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:sandstone", {
	description = S("Sandstone (Deprecated)"),
	tiles = {"default_sandstone.png"},
	groups = {not_in_creative_inventory = 1, crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:sandstonebrick", {
	description = S("Sandstone Brick (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:sandstone_block", {
	description = S("Sandstone Block (Deprecated)"),
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:desert_sandstone", {
	description = S("Desert Sandstone (Deprecated)"),
	tiles = {"default_desert_sandstone.png"},
	groups = {not_in_creative_inventory = 1, crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:desert_sandstone_brick", {
	description = S("Desert Sandstone Brick (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:desert_sandstone_block", {
	description = S("Desert Sandstone Block (Deprecated)"),
	tiles = {"default_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:silver_sandstone", {
	description = S("Silver Sandstone (Deprecated)"),
	tiles = {"default_silver_sandstone.png"},
	groups = {not_in_creative_inventory = 1, crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:silver_sandstone_brick", {
	description = S("Silver Sandstone Brick (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:silver_sandstone_block", {
	description = S("Silver Sandstone Block (Deprecated)"),
	tiles = {"default_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:obsidian", {
	description = S("Obsidian (Deprecated)"),
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
})

minetest.register_node(":default:obsidianbrick", {
	description = S("Obsidian Brick (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
})

minetest.register_node(":default:obsidian_block", {
	description = S("Obsidian Block (Deprecated)"),
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
})

--
-- Soft / Non-Stone
--

minetest.register_node(":default:snowblock", {
	description = S("Snow Block (Deprecated)"),
	tiles = {"default_snow.png"},
	groups = {not_in_creative_inventory = 1, crumbly = 3, cools_lava = 1, snowy = 1},
	sounds = default.node_sound_snow_defaults(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

-- 'is ground content = false' to avoid tunnels in sea ice or ice rivers
minetest.register_node(":default:ice", {
	description = S("Ice (Deprecated)"),
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {not_in_creative_inventory = 1, cracky = 3, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_glass_defaults(),
})

--
-- Trees
--

minetest.register_node(":default:tree", {
	description = S("Apple Tree (Deprecated)"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node(":default:wood", {
	description = S("Apple Wood Planks (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_wood.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:jungletree", {
	description = S("Jungle Tree (Deprecated)"),
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png",
		"default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node(":default:junglewood", {
	description = S("Jungle Wood Planks (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:pine_tree", {
	description = S("Pine Tree (Deprecated)"),
	tiles = {"default_pine_tree_top.png", "default_pine_tree_top.png",
		"default_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:pine_wood", {
	description = S("Pine Wood Planks (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_pine_wood.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:acacia_tree", {
	description = S("Acacia Tree (Deprecated)"),
	tiles = {"default_acacia_tree_top.png", "default_acacia_tree_top.png",
		"default_acacia_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:acacia_wood", {
	description = S("Acacia Wood Planks (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_acacia_wood.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:aspen_tree", {
	description = S("Aspen Tree (Deprecated)"),
	tiles = {"default_aspen_tree_top.png", "default_aspen_tree_top.png",
		"default_aspen_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:aspen_wood", {
	description = S("Aspen Wood Planks (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_aspen_wood.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

--
-- Ores
--
minetest.register_node(":default:steelblock", {
	description = S("Steel Block (Deprecated)"),
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node(":default:copperblock", {
	description = S("Copper Block (Deprecated)"),
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node(":default:tinblock", {
	description = S("Tin Block (Deprecated)"),
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node(":default:bronzeblock", {
	description = S("Bronze Block (Deprecated)"),
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node(":default:mese", {
	description = S("Mese Block (Deprecated)"),
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})

minetest.register_node(":default:goldblock", {
	description = S("Gold Block (Deprecated)"),
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node(":default:diamondblock", {
	description = S("Diamond Block (Deprecated)"),
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

--
-- Plantlife (non-cubic)
--
minetest.register_node(":default:marram_grass_1", {
	description = S("Marram Grass (Deprecated)"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_marram_grass_1.png"},
	inventory_image = "default_marram_grass_1.png",
	wield_image = "default_marram_grass_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {not_in_creative_inventory = 1, snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
})

for i = 2, 3 do
	minetest.register_node(":default:marram_grass_" .. i, {
		description = S("Marram Grass (Deprecated)"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_" .. i .. ".png"},
		inventory_image = "default_marram_grass_" .. i .. ".png",
		wield_image = "default_marram_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {not_in_creative_inventory = 1, snappy = 3, flammable = 3, attached_node = 1,
			not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
end

--
-- Corals
--
minetest.register_node(":default:coral_skeleton", {
	description = S("Coral Skeleton (Deprecated)"),
	tiles = {"default_coral_skeleton.png"},
	groups = {not_in_creative_inventory = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

--
-- Fence registration helper
--
local fence_collision_extra = minetest.settings:get_bool("enable_fence_tall") and 3/8 or 0

function default.register_fence(name, def)
	local fence_texture = "default_fence_overlay.png^" .. def.texture ..
			"^default_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,  3/16, -1/2,   1/16,  5/16, -1/8 },
				         {-1/16, -5/16, -1/2,   1/16, -3/16, -1/8 }},
			connect_left =  {{-1/2,   3/16, -1/16, -1/8,   5/16,  1/16},
				         {-1/2,  -5/16, -1/16, -1/8,  -3/16,  1/16}},
			connect_back =  {{-1/16,  3/16,  1/8,   1/16,  5/16,  1/2 },
				         {-1/16, -5/16,  1/8,   1/16, -3/16,  1/2 }},
			connect_right = {{ 1/8,   3/16, -1/16,  1/2,   5/16,  1/16},
				         { 1/8,  -5/16, -1/16,  1/2,  -3/16,  1/16}}
		},
		collision_box = {
			type = "connected",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2 + fence_collision_extra, 1/8},
			-- connect_top =
			-- connect_bottom =
			connect_front = {-1/8, -1/2, -1/2,  1/8, 1/2 + fence_collision_extra, -1/8},
			connect_left =  {-1/2, -1/2, -1/8, -1/8, 1/2 + fence_collision_extra,  1/8},
			connect_back =  {-1/8, -1/2,  1/8,  1/8, 1/2 + fence_collision_extra,  1/2},
			connect_right = { 1/8, -1/2, -1/8,  1/2, 1/2 + fence_collision_extra,  1/8}
		},
		connects_to = {"group:fence", "group:wood", "group:tree", "group:wall"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, },
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end
	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1
	def.texture = nil
	def.material = nil
	minetest.register_node(name, def)
end


--
-- Fence rail registration helper
--

function default.register_fence_rail(name, def)
	local fence_rail_texture = "default_fence_rail_overlay.png^" .. def.texture ..
			"^default_fence_rail_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/16,  3/16, -1/16, 1/16,  5/16, 1/16},
				 {-1/16, -3/16, -1/16, 1/16, -5/16, 1/16}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,  3/16, -1/2,   1/16,  5/16, -1/16},
				         {-1/16, -5/16, -1/2,   1/16, -3/16, -1/16}},
			connect_left =  {{-1/2,   3/16, -1/16, -1/16,  5/16,  1/16},
				         {-1/2,  -5/16, -1/16, -1/16, -3/16,  1/16}},
			connect_back =  {{-1/16,  3/16,  1/16,  1/16,  5/16,  1/2 },
				         {-1/16, -5/16,  1/16,  1/16, -3/16,  1/2 }},
			connect_right = {{ 1/16,  3/16, -1/16,  1/2,   5/16,  1/16},
		                         { 1/16, -5/16, -1/16,  1/2,  -3/16,  1/16}}
		},
		collision_box = {
			type = "connected",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2 + fence_collision_extra, 1/8},
			-- connect_top =
			-- connect_bottom =
			connect_front = {-1/8, -1/2, -1/2,  1/8, 1/2 + fence_collision_extra, -1/8},
			connect_left =  {-1/2, -1/2, -1/8, -1/8, 1/2 + fence_collision_extra,  1/8},
			connect_back =  {-1/8, -1/2,  1/8,  1/8, 1/2 + fence_collision_extra,  1/2},
			connect_right = { 1/8, -1/2, -1/8,  1/2, 1/2 + fence_collision_extra,  1/8}
		},
		connects_to = {"group:fence", "group:wall"},
		inventory_image = fence_rail_texture,
		wield_image = fence_rail_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, },
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1
	def.texture = nil
	def.material = nil
	minetest.register_node(name, def)
end

default.register_fence(":default:fence_wood", {
	description = S("Apple Wood Fence (Deprecated)"),
	texture = "default_fence_wood.png",
	inventory_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood",
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence(":default:fence_acacia_wood", {
	description = S("Acacia Wood Fence (Deprecated)"),
	texture = "default_fence_acacia_wood.png",
	inventory_image = "default_fence_overlay.png^default_acacia_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_acacia_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:acacia_wood",
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence(":default:fence_junglewood", {
	description = S("Jungle Wood Fence (Deprecated)"),
	texture = "default_fence_junglewood.png",
	inventory_image = "default_fence_overlay.png^default_junglewood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_junglewood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:junglewood",
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence(":default:fence_pine_wood", {
	description = S("Pine Wood Fence (Deprecated)"),
	texture = "default_fence_pine_wood.png",
	inventory_image = "default_fence_overlay.png^default_pine_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_pine_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:pine_wood",
	groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence(":default:fence_aspen_wood", {
	description = S("Aspen Wood Fence (Deprecated)"),
	texture = "default_fence_aspen_wood.png",
	inventory_image = "default_fence_overlay.png^default_aspen_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_aspen_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:aspen_wood",
	groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail(":default:fence_rail_wood", {
	description = S("Apple Wood Fence Rail (Deprecated)"),
	texture = "default_fence_rail_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:wood",
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail(":default:fence_rail_acacia_wood", {
	description = S("Acacia Wood Fence Rail (Deprecated)"),
	texture = "default_fence_rail_acacia_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_acacia_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_acacia_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:acacia_wood",
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail(":default:fence_rail_junglewood", {
	description = S("Jungle Wood Fence Rail (Deprecated)"),
	texture = "default_fence_rail_junglewood.png",
	inventory_image = "default_fence_rail_overlay.png^default_junglewood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_junglewood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:junglewood",
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail(":default:fence_rail_pine_wood", {
	description = S("Pine Wood Fence Rail (Deprecated)"),
	texture = "default_fence_rail_pine_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_pine_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_pine_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:pine_wood",
	groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail(":default:fence_rail_aspen_wood", {
	description = S("Aspen Wood Fence Rail (Deprecated)"),
	texture = "default_fence_rail_aspen_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_aspen_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_aspen_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:aspen_wood",
	groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node(":default:glass", {
	description = S("Glass (Deprecated)"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node(":default:obsidian_glass", {
	description = S("Obsidian Glass (Deprecated)"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, cracky = 3},
})


minetest.register_node(":default:brick", {
	description = S("Brick Block (Deprecated)"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {
		"default_brick.png^[transformFX",
		"default_brick.png",
	},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node(":default:meselamp", {
	description = S("Mese Lamp (Deprecated)"),
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
})

--
-- Old fences
--

default.register_fence(":default:fence_cobble", {
 	description = "Cobbblestone Fence (Deprecated)",
 	texture = "default_cobble.png",
 	material = "default:cobble",
 	groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
 	sounds = default.node_sound_stone_defaults()
})

default.register_fence(":default:fence_desert_cobble", {
	description = "Desert Cobbblestone Fence (Deprecated)",
 	texture = "default_desert_cobble.png",
 	material = "default:desert_cobble",
 	groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
 	sounds = default.node_sound_stone_defaults()
})

default.register_fence(":default:fence_sandstone", {
 	description = "Sandstone Fence (Deprecated)",
 	texture = "default_sandstone.png",
 	material = "default:sandstone",
 	groups = {not_in_creative_inventory = 1, cracky=3, crumbly=2},
 	sounds = default.node_sound_stone_defaults()
})

default.register_fence(":default:fence_stone_brick", {
 	description = "Stone Brick Fence (Deprecated)",
 	texture = "default_stone_brick.png",
 	material = "default:stonebrick",
 	groups = {not_in_creative_inventory = 1, cracky=2, stone=1},
 	sounds = default.node_sound_stone_defaults()
})

default.register_fence(":default:fence_sandstone_brick", {
 	description = "Sandstone Brick Fence (Deprecated)",
 	texture = "default_sandstone_brick.png",
 	material = "default:sandstonebrick",
 	groups = {not_in_creative_inventory = 1, cracky=2},
 	sounds = default.node_sound_stone_defaults()
})

default.register_fence(":default:fence_desert_stone_brick", {
 	description = "Desert Stone Brick Fence (Deprecated)",
 	texture = "default_desert_stone_brick.png",
 	material = "default:desert_stonebrick",
 	groups = {not_in_creative_inventory = 1, cracky=2, stone=1},
 	sounds = default.node_sound_stone_defaults()
})