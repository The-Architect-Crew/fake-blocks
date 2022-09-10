-- Basic materials mod
-- by Vanessa Dannenberg

-- This mod supplies all those little random craft items that everyone always
-- seems to need, such as metal bars (ala rebar), plastic, wire, and so on.

local modpath = minetest.get_modpath("basic_materials")
local S = minetest.get_translator("basic_materials")

basic_materials = {}
basic_materials.mod = { author = "Vanessa Dannenberg" }

minetest.register_node("basic_materials:cement_block", {
	description = S("Cement (Deprecated)"),
	tiles = {"basic_materials_cement_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("basic_materials:concrete_block", {
	description = S("Concrete Block (Deprecated)"),
	tiles = {"basic_materials_concrete_block.png",},
	groups = {not_in_creative_inventory = 1, cracky=1, level=2, concrete=1},
	sounds = default.node_sound_stone_defaults(),
})

local chains_sbox = {
	type = "fixed",
	fixed = { -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 }
}

minetest.register_node("basic_materials:chain_steel", {
	description = S("Chain (steel, hanging) (Deprecated)"),
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_steel.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_steel_inv.png",
	groups = {not_in_creative_inventory = 1, cracky=3},
	selection_box = chains_sbox,
})

minetest.register_node("basic_materials:chain_brass", {
	description = S("Chain (brass, hanging) (Deprecated)"),
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_brass.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_brass_inv.png",
	groups = {not_in_creative_inventory = 1, cracky=3},
	selection_box = chains_sbox,
})

minetest.register_node("basic_materials:brass_block", {
	description = S("Brass Block (Deprecated)"),
	tiles = { "basic_materials_brass_block.png" },
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1, cracky=1, level=2},
	sounds = default.node_sound_metal_defaults()
})