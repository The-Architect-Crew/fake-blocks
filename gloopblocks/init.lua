--[[
GloopBlocks
Originally written by GloopMaster

Maintained by VanessaE.

--]]

gloopblocks = {}

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-- Nodes

minetest.register_node("gloopblocks:rainbow_block_diagonal", {
	description = S("Diagonal Rainbow Block (Deprecated)"),
	tiles = {"gloopblocks_rainbow_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_defaults(),
})
minetest.register_alias("gloopblocks:rainbow_block", "gloopblocks:rainbow_block_diagonal")

minetest.register_node("gloopblocks:rainbow_block_horizontal", {
	description = S("Horizontal Rainbow Block (Deprecated)"),
	tiles = {
		"gloopblocks_rainbow_horizontal.png^[transformR90",
		"gloopblocks_rainbow_horizontal.png^[transformR90",
		"gloopblocks_rainbow_horizontal.png"
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("gloopblocks:evil_block", {
	description = S("Evil Block (Deprecated)"),
	tiles = {"gloopblocks_evil_block.png"},
	light_source = 5,
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:basalt", {
	description = S("Basalt (Deprecated)"),
	tiles = {"gloopblocks_basalt.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:pumice", {
	description = S("Pumice (Deprecated)"),
	tiles = {"gloopblocks_pumice.png"},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("gloopblocks:pavement", {
	description = S("Pavement (Deprecated)"),
	tiles = {"gloopblocks_pavement.png"},
	groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:oerkki_block", {
	drawtype = "nodebox",
	description = S("Oerkki Block (Deprecated)"),
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_front.png"
	},
	groups = {not_in_creative_inventory = 1, cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox2
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox5
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox6
		}
	}
})

minetest.register_node("gloopblocks:stone_brick_mossy", {
	description = S("Mossy Stone Brick (Deprecated)"),
	tiles = {"gloopblocks_stone_brick_mossy.png"},
	groups = {not_in_creative_inventory = 1, cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_mossy", {
	description = S("Mossy Stone (Deprecated)"),
	tiles = {"gloopblocks_stone_mossy.png"},
	groups = {not_in_creative_inventory = 1, cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:mossycobble"
})

minetest.register_node("gloopblocks:cobble_road", {
	description = S("Cobblestone Road Bed (Deprecated)"),
	tiles = {"gloopblocks_cobble_road.png"},
	groups = {not_in_creative_inventory = 1, cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:cobble_road_mossy", {
	description = S("Mossy Cobblestone Road Bed (Deprecated)"),
	tiles = {"gloopblocks_cobble_road_mossy.png"},
	groups = {not_in_creative_inventory = 1, cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:scaffolding", {
	description = S("Wooden Scaffold (Deprecated)"),
	drawtype = "allfaces",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"gloopblocks_scaffold.png"},
	groups = {not_in_creative_inventory = 1, choppy=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_alias("gloopblocks:obsidian", "default:obsidian")

-- Nodes imported from Usesdirt ================================================================================

if not minetest.get_modpath("usesdirt") then

	local dirt_brick_tex  = "default_dirt.png^gloopblocks_dirt_brick_overlay.png"
	local dirt_cobble_tex = "default_cobble.png^(default_dirt.png^[mask:gloopblocks_dirt_cobble_mask.png)"
	local dirt_stone_tex  = "default_stone.png^(default_dirt.png^[mask:gloopblocks_dirt_stone_mask.png)"

	local dirt_ladder_tex = "(default_dirt.png^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_brick_ladder_tex = "(("..dirt_brick_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_cobble_ladder_tex = "(("..dirt_cobble_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_stone_ladder_tex = "(("..dirt_stone_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"

	minetest.register_node(":usesdirt:dirt_brick", {
		tiles = { dirt_brick_tex },
		description = "Dirt Brick (Deprecated)",
		groups = {not_in_creative_inventory = 1, snappy=2,choppy=1,oddly_breakable_by_hand=2},
	})

	minetest.register_node(":usesdirt:dirt_brick_ladder", {
		description = "Dirt Brick Ladder (Deprecated)",
		drawtype = "signlike",
		tiles = { dirt_brick_ladder_tex },
		inventory_image = dirt_brick_ladder_tex,
		wield_image     = dirt_brick_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
		legacy_wallmounted = true,
	})

	--[[default.register_fence(":usesdirt:dirt_brick_fence", {
		description = "Dirt Brick Fence",
		texture = dirt_brick_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_brick",
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})]]

	minetest.register_node(":usesdirt:dirt_ladder", {
		description = "Dirt Ladder",
		drawtype = "signlike",
		tiles = { dirt_ladder_tex },
		inventory_image = dirt_ladder_tex,
		wield_image     = dirt_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {not_in_creative_inventory = 1, snappy=2,choppy=2,oddly_breakable_by_hand=3},
		legacy_wallmounted = true,
	})

	--[[default.register_fence(":usesdirt:dirt_fence", {
		description = "Dirt Fence",
		texture = "default_dirt.png",
		inventory_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
		material = "default:dirt",
		groups = {not_in_creative_inventory = 1, snappy=2,choppy=1,oddly_breakable_by_hand=3},
		sounds = default.node_sound_dirt_defaults(),
		check_for_pole = true
	})]]

----

	minetest.register_node(":usesdirt:dirt_cobble_stone", {
		tiles = { dirt_cobble_tex },
		description = "Dirt Cobble Stone",
		is_ground_content = true,
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
	})

	minetest.register_node(":usesdirt:dirt_cobble_stone_ladder", {
		description = "Dirt Cobble Stone Ladder",
		drawtype = "signlike",
		tiles = { dirt_cobble_ladder_tex },
		inventory_image = dirt_cobble_ladder_tex,
		wield_image     = dirt_cobble_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
		legacy_wallmounted = true,
	})

	--[[default.register_fence(":usesdirt:dirt_cobble_stone_fence", {
		description = "Dirt Cobble Stone Fence",
		texture = dirt_cobble_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_cobble_stone",
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})]]

----

	minetest.register_node(":usesdirt:dirt_stone", {
		tiles = { dirt_stone_tex },
		description = "Dirt Stone",
		is_ground_content = true,
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
	})

	minetest.register_node(":usesdirt:dirt_stone_ladder", {
		description = "Dirt Stone Ladder",
		drawtype = "signlike",
		tiles = { dirt_stone_ladder_tex },
		inventory_image = dirt_stone_ladder_tex,
		wield_image     = dirt_stone_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	--[[default.register_fence(":usesdirt:dirt_stone_fence", {
		description = "Dirt Stone Fence",
		texture = dirt_stone_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_stone",
		groups = {not_in_creative_inventory = 1, cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})]]
end

-- Stairs/slabs defs, conversion of normal -> mossy items

if minetest.get_modpath("stairs") then

	--stairs.register_stair(subname, recipeitem, groups, images, description, sounds)

	-- stairs:xxxx_stone_mossy ; xxxx = stair or slab
	stairs.register_stair_and_slab("stone_mossy", "gloopblocks:stone_mossy",
		{cracky=3},
		{"gloopblocks_stone_mossy.png"},
		S("Mossy Stone Stair (Deprecated)"),
		S("Mossy Stone Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	--[[ stairs:xxxx_mossycobble
	stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
		{cracky=3},
		{"default_mossycobble.png"},
		S("Mossy Cobble Stair (Deprecated)"),
		S("Mossy Cobble Slab (Deprecated)"),
		default.node_sound_stone_defaults())
	]]

	-- stairs:xxxx_stone_brick_mossy
	stairs.register_stair_and_slab("stone_brick_mossy", "gloopblocks:stone_brick_mossy",
		{cracky=3},
		{"gloopblocks_stone_brick_mossy.png"},
		S("Mossy Stone Brick Stair (Deprecated)"),
		S("Mossy Stone Brick Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road
	stairs.register_stair_and_slab("cobble_road", "gloopblocks:cobble_road",
		{cracky=3},
		{"gloopblocks_cobble_road.png"},
		S("Cobble Roadbed Stair (Deprecated)"),
		S("Cobble Roadbed Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road_mossy
	stairs.register_stair_and_slab("cobble_road_mossy", "gloopblocks:cobble_road_mossy",
		{cracky=3},
		{"gloopblocks_cobble_road_mossy.png"},
		S("Mossy Cobble Roadbed Stair (Deprecated)"),
		S("Mossy Cobble Roadbed Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cement
	stairs.register_stair_and_slab("cement", "gloopblocks:cement",
		{cracky=2},
		{"basic_materials_cement_block.png"},
		S("Cement Stair (Deprecated)"),
		S("Cement Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_pavement
	stairs.register_stair_and_slab("pavement", "gloopblocks:pavement",
		{cracky=3, oddly_breakable_by_hand=3},
		{"gloopblocks_pavement.png"},
		S("Pavement Stair (Deprecated)"),
		S("Pavement Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("basalt", "gloopblocks:basalt",
		{cracky=2},
		{"gloopblocks_basalt.png"},
		S("Basalt Stair (Deprecated)"),
		S("Basalt Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("pumice", "gloopblocks:pumice",
		{cracky=3},
		{"gloopblocks_pumice.png"},
		S("Pumice Stair (Deprecated)"),
		S("Pumice Slab (Deprecated)"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("rainbow_block", "gloopblocks:rainbow_block",
		{cracky=3},
		{"gloopblocks_rainbow_block.png"},
		S("Rainbow Block Stair (Deprecated)"),
		S("Rainbow Block Slab (Deprecated)"),
		default.node_sound_defaults())

	minetest.register_alias("default:stair_mossycobble", "stairs:stair_mossycobble")
	minetest.register_alias("default:slab_mossycobble", "stairs:slab_mossycobble")
	minetest.register_alias("gloopblocks:stair_cobble_road", "stairs:stair_cobble_road")
	minetest.register_alias("gloopblocks:slab_cobble_road", "stairs:slab_cobble_road")
	minetest.register_alias("gloopblocks:stair_cobble_road_mossy", "stairs:stair_cobble_road_mossy")
	minetest.register_alias("gloopblocks:slab_cobble_road_mossy", "stairs:slab_cobble_road_mossy")
	minetest.register_alias("gloopblocks:stair_stone_brick_mossy", "stairs:stair_stone_brick_mossy")
	minetest.register_alias("gloopblocks:slab_stone_brick_mossy", "stairs:slab_stone_brick_mossy")
	minetest.register_alias("gloopblocks:stair_stone_mossy", "stairs:stair_stone_mossy")
	minetest.register_alias("gloopblocks:slab_stone_mossy", "stairs:slab_stone_mossy")
	minetest.register_alias("gloopblocks:stair_pavement", "stairs:stair_pavement")
	minetest.register_alias("gloopblocks:slab_pavement", "stairs:slab_pavement")
	minetest.register_alias("gloopblocks:stair_pumice", "stairs:stair_pumice")
	minetest.register_alias("gloopblocks:slab_pumice", "stairs:slab_pumice")
	minetest.register_alias("gloopblocks:stair_basalt", "stairs:stair_basalt")
	minetest.register_alias("gloopblocks:slab_basalt", "stairs:slab_basalt")
	minetest.register_alias("gloopblocks:stair_rainbow_block", "stairs:stair_rainbow_block")
	minetest.register_alias("gloopblocks:slab_rainbow_block", "stairs:slab_rainbow_block")
end

local fence_texture =
	"default_fence_overlay.png^default_steel_block.png^default_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("gloopblocks:fence_steel", {
	description = S("Steel Fence (Deprecated)"),
	drawtype = "fencelike",
	tiles = {"default_steel_block.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {not_in_creative_inventory = 1, choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = default.node_sound_stone_defaults(),
})

print(S("Gloopblocks Loaded!"))
