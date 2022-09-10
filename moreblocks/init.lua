--[[
=====================================================================
** More Blocks **
By Calinou, with the help of ShadowNinja and VanessaE.

Copyright © 2011-2020 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
=====================================================================
--]]

moreblocks = {}

local modpath = minetest.get_modpath("moreblocks")

local S, NS = dofile(modpath .. "/intllib.lua")
moreblocks.S = S
moreblocks.NS = NS

dofile(modpath .. "/config.lua")
dofile(modpath .. "/stairsplus/init.lua")
dofile(modpath .. "/aliases.lua")

minetest.register_node("moreblocks:circular_saw",  {
	description = S("Circular Saw (Deprecated)"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4, -0.5, -0.4, -0.25, 0.25, -0.25}, -- Leg
			{0.25, -0.5, 0.25, 0.4, 0.25, 0.4}, -- Leg
			{-0.4, -0.5, 0.25, -0.25, 0.25, 0.4}, -- Leg
			{0.25, -0.5, -0.4, 0.4, 0.25, -0.25}, -- Leg
			{-0.5, 0.25, -0.5, 0.5, 0.375, 0.5}, -- Tabletop
			{-0.01, 0.4375, -0.125, 0.01, 0.5, 0.125}, -- Saw blade (top)
			{-0.01, 0.375, -0.1875, 0.01, 0.4375, 0.1875}, -- Saw blade (bottom)
			{-0.25, -0.0625, -0.25, 0.25, 0.25, 0.25}, -- Motor case
		},
	},
	tiles = {"moreblocks_circular_saw_top.png",
		"moreblocks_circular_saw_bottom.png",
		"moreblocks_circular_saw_side.png"},
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, choppy = 2,oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
})


local S = moreblocks.S
local sound_dirt = default.node_sound_dirt_defaults()
local sound_wood = default.node_sound_wood_defaults()
local sound_stone = default.node_sound_stone_defaults()
local sound_glass = default.node_sound_glass_defaults()
local sound_leaves = default.node_sound_leaves_defaults()

-- Don't break on 0.4.14 and earlier.
local sound_metal = (default.node_sound_metal_defaults
		and default.node_sound_metal_defaults() or sound_stone)

local function tile_tiles(name)
	local tex = "moreblocks_" ..name.. ".png"
	return {tex, tex, tex, tex, tex.. "^[transformR90", tex.. "^[transformR90"}
end

local function wood_tile_replace(itemstack, placer, pointed_thing)
	local substack
	if itemstack:get_name() == "moreblocks:wood_tile_flipped" then
		substack = ItemStack("moreblocks:wood_tile")
	else -- right, left, and down variants
		substack = ItemStack("moreblocks:wood_tile_offset")
	end
	local _, success = minetest.item_place(substack, placer, pointed_thing)
	if success then
		itemstack:take_item()
	end
	return itemstack
end

local deprecated = (" (%s)"):format(S('Deprecated'))
local nodes = {
	["wood_tile"] = {
		description = S("Wooden Tile (Deprecated)"),
		groups = {not_in_creative_inventory = 1, wood = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		is_ground_content = false,
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"default_wood.png^moreblocks_wood_tile.png",
		"default_wood.png^moreblocks_wood_tile.png",
		"default_wood.png^moreblocks_wood_tile.png",
		"default_wood.png^moreblocks_wood_tile.png",
		"default_wood.png^moreblocks_wood_tile.png^[transformR90",
		"default_wood.png^moreblocks_wood_tile.png^[transformR90"},
		sounds = sound_wood,
	},
	["wood_tile_flipped"] = {
		description = S("Wooden Tile") .. deprecated,
		tiles = {"default_wood.png^moreblocks_wood_tile.png^[transformR90",
		"default_wood.png^moreblocks_wood_tile.png^[transformR90",
		"default_wood.png^moreblocks_wood_tile.png^[transformR90",
		"default_wood.png^moreblocks_wood_tile.png^[transformR90",
		"default_wood.png^moreblocks_wood_tile.png^[transformR180",
		"default_wood.png^moreblocks_wood_tile.png^[transformR180"},
		groups = {not_in_creative_inventory = 1},
		no_stairs = true,
		on_place = wood_tile_replace
	},
	["wood_tile_center"] = {
		description = S("Centered Wooden Tile (Deprecated)"),
		groups = {not_in_creative_inventory = 1, wood = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		is_ground_content = false,
		tiles = {"default_wood.png^moreblocks_wood_tile_center.png"},
		sounds = sound_wood,
	},
	["wood_tile_full"] = {
		description = S("Full Wooden Tile (Deprecated)"),
		groups = {not_in_creative_inventory = 1, wood = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		is_ground_content = false,
		tiles = tile_tiles("wood_tile_full"),
		sounds = sound_wood,
	},
	["wood_tile_offset"] = {
		description = S("Offset Wooden Tile (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {not_in_creative_inventory = 1, wood = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		is_ground_content = false,
		tiles = {"default_wood.png^moreblocks_wood_tile_offset.png"},
		sounds = sound_wood,
		no_stairs = true,
	},
	["wood_tile_down"] = {
		description = S("Downwards Wooden Tile") .. deprecated,
		tiles = {"default_wood.png^[transformR180^moreblocks_wood_tile_offset.png^[transformR180"},
		groups = {not_in_creative_inventory = 1},
		no_stairs = true,
		on_place = wood_tile_replace
	},
	["wood_tile_left"] = {
		description = S("Leftwards Wooden Tile") .. deprecated,
		tiles = {"default_wood.png^[transformR270^moreblocks_wood_tile_offset.png^[transformR270"},
		groups = {not_in_creative_inventory = 1},
		no_stairs = true,
		on_place = wood_tile_replace
	},
	["wood_tile_right"] = {
		description = S("Rightwards Wooden Tile") .. deprecated,
		tiles = {"default_wood.png^[transformR90^moreblocks_wood_tile_offset.png^[transformR90"},
		groups = {not_in_creative_inventory = 1},
		no_stairs = true,
		on_place = wood_tile_replace
	},
	["circle_stone_bricks"] = {
		description = S("Circle Stone Bricks (Deprecated)"),
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["grey_bricks"] = {
		description = S("Stone Bricks (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {not_in_creative_inventory = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["coal_stone_bricks"] = {
		description = S("Coal Stone Bricks (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["iron_stone_bricks"] = {
		description = S("Iron Stone Bricks (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["stone_tile"] = {
		description = S("Stone Tile (Deprecated)"),
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["split_stone_tile"] = {
		description = S("Split Stone Tile (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"moreblocks_split_stone_tile_top.png",
			"moreblocks_split_stone_tile.png"},
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["checker_stone_tile"] = {
		description = S("Checker Stone Tile (Deprecated)"),
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["tar"] = {
		description = S("Tar (Deprecated)"),
		groups = {not_in_creative_inventory = 1, cracky=2, tar_block=1},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["dirt_compressed"] = {
		description = S("Compressed Dirt (Deprecated)"),
		groups = {not_in_creative_inventory = 1, crumbly=2},
		is_ground_content = false,
		sounds = sound_dirt,
	},
	["cobble_compressed"] = {
		description = S("Compressed Cobblestone (Deprecated)"),
		groups = {not_in_creative_inventory = 1, cracky = 1},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["desert_cobble_compressed"] = {
		description = S("Compressed Desert Cobblestone (Deprecated)"),
		groups = {not_in_creative_inventory = 1, cracky = 1},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["plankstone"] = {
		description = S("Plankstone (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {not_in_creative_inventory = 1, cracky = 3},
		is_ground_content = false,
		tiles = tile_tiles("plankstone"),
		sounds = sound_stone,
	},
	["iron_glass"] = {
		description = S("Iron Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^[colorize:#DEDEDE", "default_glass_detail.png^[colorize:#DEDEDE"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["coal_glass"] = {
		description = S("Coal Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^[colorize:#828282", "default_glass_detail.png^[colorize:#828282"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["clean_glass"] = {
		description = S("Clean Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"moreblocks_clean_glass.png", "moreblocks_clean_glass_detail.png"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["cactus_brick"] = {
		description = S("Cactus Brick (Deprecated)"),
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {not_in_creative_inventory = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["cactus_checker"] = {
		description = S("Cactus Checker (Deprecated)"),
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		tiles = {"default_stone.png^moreblocks_cactus_checker.png",
		"default_stone.png^moreblocks_cactus_checker.png",
		"default_stone.png^moreblocks_cactus_checker.png",
		"default_stone.png^moreblocks_cactus_checker.png",
		"default_stone.png^moreblocks_cactus_checker.png^[transformR90",
		"default_stone.png^moreblocks_cactus_checker.png^[transformR90"},
		sounds = sound_stone,
	},
	["empty_shelf"] = {
		description = S("Empty Shelf (Deprecated)"),
		paramtype2 = "facedir",
		tiles = {"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "moreblocks_empty_shelf.png", "moreblocks_empty_shelf.png"},
		groups = {not_in_creative_inventory = 1, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		is_ground_content = false,
		sounds = sound_wood,
		furnace_burntime = 15,
		no_stairs = true,
	},
	["coal_stone"] = {
		description = S("Coal Stone (Deprecated)"),
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["iron_stone"] = {
		description = S("Iron Stone (Deprecated)"),
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["coal_checker"] = {
		description = S("Coal Checker (Deprecated)"),
		tiles = {"default_stone.png^moreblocks_coal_checker.png",
		"default_stone.png^moreblocks_coal_checker.png",
		"default_stone.png^moreblocks_coal_checker.png",
		"default_stone.png^moreblocks_coal_checker.png",
		"default_stone.png^moreblocks_coal_checker.png^[transformR90",
		"default_stone.png^moreblocks_coal_checker.png^[transformR90"},
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["iron_checker"] = {
		description = S("Iron Checker (Deprecated)"),
		tiles = {"default_stone.png^moreblocks_iron_checker.png",
		"default_stone.png^moreblocks_iron_checker.png",
		"default_stone.png^moreblocks_iron_checker.png",
		"default_stone.png^moreblocks_iron_checker.png",
		"default_stone.png^moreblocks_iron_checker.png^[transformR90",
		"default_stone.png^moreblocks_iron_checker.png^[transformR90"},
		groups = {not_in_creative_inventory = 1, stone = 1, cracky = 3},
		is_ground_content = false,
		sounds = sound_stone,
	},
	["trap_stone"] = {
		description = S("Trap Stone (Deprecated)"),
		drawtype = "glasslike_framed",
		tiles = {"default_stone.png^moreblocks_trap_box.png"},
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3},
		paramtype = "light",
		is_ground_content = false,
		sounds = sound_stone,
		no_stairs = true,
	},
	["trap_desert_stone"] = {
		description = S("Trap Desert Stone (Deprecated)"),
		drawtype = "glasslike_framed",
		tiles = {"default_desert_stone.png^moreblocks_trap_box.png"},
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3},
		paramtype = "light",
		is_ground_content = false,
		sounds = sound_stone,
		no_stairs = true,
	},
	["trap_glass"] = {
		description = S("Trap Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^moreblocks_trap_box_glass.png", "default_glass_detail.png"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["trap_obsidian_glass"] = {
		description = S("Trap Obsidian Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_obsidian_glass.png^moreblocks_trap_box_glass.png", "default_obsidian_glass_detail.png"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["trap_obsidian"] = {
		description = S("Trap Obsidian (Deprecated)"),
		drawtype = "glasslike_framed",
		tiles = {"default_obsidian.png^moreblocks_trap_box.png"},
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
		paramtype = "light",
		is_ground_content = false,
		sounds = sound_stone,
		no_stairs = true,
	},
	["trap_clean_glass"] = {
		description = S("Trap Clean Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"moreblocks_clean_glass.png^moreblocks_trap_box_glass.png", "moreblocks_clean_glass_detail.png"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["trap_sandstone"] = {
		description = S("Trap Sandstone (Deprecated)"),
		drawtype = "glasslike_framed",
		tiles = {"default_sandstone.png^moreblocks_trap_box.png"},
		walkable = false,
		groups = {not_in_creative_inventory = 1, crumbly = 1, cracky = 3},
		paramtype = "light",
		is_ground_content = false,
		sounds = sound_stone,
		no_stairs = true,
	},
	["all_faces_tree"] = {
		description = S("All-faces Tree (Deprecated)"),
		tiles = {"default_tree_top.png"},
		groups = {not_in_creative_inventory = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = sound_wood,
		furnace_burntime = 30,
	},
	["all_faces_jungle_tree"] = {
		description = S("All-faces Jungle Tree (Deprecated)"),
		tiles = {"default_jungletree_top.png"},
		groups = {not_in_creative_inventory = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = sound_wood,
		furnace_burntime = 38,
	},
	["all_faces_pine_tree"] = {
		description = S("All-faces Pine Tree (Deprecated)"),
		tiles = {"default_pine_tree_top.png"},
		groups = {not_in_creative_inventory = 1, tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = sound_wood,
		furnace_burntime = 26,
	},
	["all_faces_acacia_tree"] = {
		description = S("All-faces Acacia Tree (Deprecated)"),
		tiles = {"default_acacia_tree_top.png"},
		groups = {not_in_creative_inventory = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = sound_wood,
		furnace_burntime = 34,
	},
	["all_faces_aspen_tree"] = {
		description = S("All-faces Aspen Tree (Deprecated)"),
		tiles = {"default_aspen_tree_top.png"},
		groups = {not_in_creative_inventory = 1, tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = sound_wood,
		furnace_burntime = 22,
	},
	["glow_glass"] = {
		description = S("Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^[colorize:#E9CD61", "default_glass_detail.png^[colorize:#E9CD61"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 11,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["clean_glow_glass"] = {
		description = S("Clean Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"moreblocks_clean_glass.png^[colorize:#E9CD61", "moreblocks_clean_glass_detail.png^[colorize:#E9CD61"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 11,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["trap_glow_glass"] = {
		description = S("Trap Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^[colorize:#E9CD61^moreblocks_trap_box_glass.png", "default_glass_detail.png^[colorize:#E9CD61"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 11,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["trap_clean_glow_glass"] = {
		description = S("Trap Clean Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"moreblocks_clean_glass.png^[colorize:#E9CD61^moreblocks_trap_box_glass.png", "moreblocks_clean_glass_detail.png^[colorize:#E9CD61"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 11,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["super_glow_glass"] = {
		description = S("Super Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^[colorize:#FFFF78", "default_glass_detail.png^[colorize:#FFFF78"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = default.LIGHT_MAX,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["clean_super_glow_glass"] = {
		description = S("Clean Super Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"moreblocks_clean_glass.png^[colorize:#FFFF78", "moreblocks_clean_glass_detail.png^[colorize:#FFFF78"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = default.LIGHT_MAX,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
	},
	["trap_super_glow_glass"] = {
		description = S("Trap Super Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"default_glass.png^[colorize:#FFFF78^moreblocks_trap_box_glass.png", "default_glass_detail.png^[colorize:#FFFF78"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = default.LIGHT_MAX,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["trap_clean_super_glow_glass"] = {
		description = S("Trap Clean Super Glow Glass (Deprecated)"),
		drawtype = "glasslike_framed_optional",
		tiles = {"moreblocks_clean_glass.png^[colorize:#FFFF78^moreblocks_trap_box_glass.png", "moreblocks_clean_glass_detail.png^[colorize:#FFFF78"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = default.LIGHT_MAX,
		walkable = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, oddly_breakable_by_hand = 3},
		sounds = sound_glass,
		no_stairs = true,
	},
	["rope"] = {
		description = S("Rope (Deprecated)"),
		drawtype = "signlike",
		inventory_image = "moreblocks_rope.png",
		wield_image = "moreblocks_rope.png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		paramtype2 = "wallmounted",
		walkable = false,
		climbable = true,
		selection_box = {type = "wallmounted",},
		groups = {not_in_creative_inventory = 1, snappy = 3, flammable = 2},
		sounds = sound_leaves,
		no_stairs = true,
	},
	["copperpatina"] = {
		description = S("Copper Patina Block (Deprecated)"),
		groups = {not_in_creative_inventory = 1, cracky = 1, level = 2},
		is_ground_content = false,
		sounds = sound_metal,
	},
}

for name, def in pairs(nodes) do
	def.tiles = def.tiles or {"moreblocks_" ..name.. ".png"}
	minetest.register_node("moreblocks:" ..name, def)
	minetest.register_alias(name, "moreblocks:" ..name)

	def_copy = table.copy(def)

	-- Use the primary tile for all sides of cut glasslike nodes.
	-- This makes them easier to see
	if
		#def_copy.tiles > 1 and
		def_copy.drawtype and
		def_copy.drawtype == "glasslike_framed" or
		def_copy.drawtype == "glasslike_framed_optional"
	then
		def.tiles = {def_copy.tiles[1]}
	end


	if not def.no_stairs then
		local groups = {not_in_creative_inventory = 1, }
		for k, v in pairs(def.groups) do groups[k] = v end
		stairsplus:register_all("moreblocks", name, "moreblocks:" ..name, {
			description = def.description,
			groups = groups,
			tiles = def.tiles,
			sunlight_propagates = def.sunlight_propagates,
			light_source = def.light_source,
			sounds = def.sounds,
		})
	end
end