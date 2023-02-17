-- Naturally spawning blocks
minetest.register_node(":darkage:schist", {
	description = "Schist (Deprecated)",
	tiles = {"darkage_schist.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

stairsplus:register_all("darkage", "schist", "darkage:schist", {
    description = "Schist (Deprecated)",
    tiles = {"darkage_schist.png"},
    groups = {not_in_creative_inventory = 1, cracky=3,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

minetest.register_node(":darkage:shale", {
	description = "Shale (Deprecated)",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":darkage:silt", {
	description = "Silt (Deprecated)",
	tiles = {"darkage_silt.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, crumbly=3},
	drop = "darkage:silt_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node(":darkage:gneiss", {
	description = "Gneiss (Deprecated)",
	tiles = {"darkage_gneiss.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	drop = "darkage:gneiss_cobble",
	sounds = default.node_sound_stone_defaults()
})

stairsplus:register_all("darkage", "gneiss", "darkage:gneiss", {
    description = "Gneiss (Deprecated)",
    tiles = {"darkage_gneiss.png"},
    groups = {not_in_creative_inventory = 1, cracky=3,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

-- Cobble
minetest.register_node(":darkage:gneiss_cobble", {
	description = "Gneiss Cobble (Deprecated)",
	tiles = {"darkage_gneiss_brick.png"},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

stairsplus:register_all("darkage", "gneiss_cobble", "darkage:gneiss_cobble", {
    description = "Gneiss Cobble (Deprecated)",
    tiles = {"darkage_gneiss_brick.png"},
    groups = {not_in_creative_inventory = 1, cracky=3,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

-- Other Blocks
minetest.register_node(":darkage:straw", {
	description = "Straw (Deprecated)",
	tiles = {"darkage_straw.png"},
	groups = {not_in_creative_inventory = 1, snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

stairsplus:register_all("darkage", "straw", "darkage:straw", {
    description = "Straw (Deprecated)",
    tiles = {"darkage_straw.png"},
    groups = {not_in_creative_inventory = 1, snappy=3, flammable=2,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

minetest.register_node(":darkage:straw_bale", {
	description = "Straw Bale (Deprecated)",
	tiles = {"darkage_straw_bale.png"},
	drop = "darkage:straw 4",
	groups = {not_in_creative_inventory = 1, snappy=2, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

stairsplus:register_all("darkage", "straw_bale", "darkage:straw_bale", {
    description = "Straw Bale (Deprecated)",
    tiles = {"darkage_straw_bale.png"},
    groups = {not_in_creative_inventory = 1, snappy=2, flammable=2,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

minetest.register_node(":darkage:slate_tile", {
	description = "Slate Tile (Deprecated)",
	tiles = {"darkage_slate_tile.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults()
})

stairsplus:register_all("darkage", "slate_tile", "darkage:slate_tile", {
    description = "Slate Tile (Deprecated)",
    tiles = {"darkage_slate_tile.png"},
    groups = {not_in_creative_inventory = 1, cracky=2,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

minetest.register_node(":darkage:adobe", {
	description = "Adobe (Deprecated)",
	tiles = {"darkage_adobe.png"},
	groups = {not_in_creative_inventory = 1, crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node(":darkage:lamp", {
	description = "Lamp (Deprecated)",
	tiles = {"darkage_lamp.png"},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	groups = {not_in_creative_inventory = 1, snappy=2,cracky=3,oddly_breakable_by_hand=3,flammable=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node(":darkage:cobble_with_plaster", {
	description = "Cobblestone With Plaster (Deprecated)",
	tiles = {"darkage_cobble_with_plaster_D.png", "darkage_cobble_with_plaster_B.png", "darkage_cobble_with_plaster_C.png",
		"darkage_cobble_with_plaster_A.png", "default_cobble.png", "darkage_chalk.png"},
	paramtype2 = "facedir",
	drop = "default:cobble",
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Storage blocks (boxes, shelves, ect.)
minetest.register_node(":darkage:box", {
	description = "Box (Deprecated)",
	tiles = { "darkage_box_top.png","darkage_box_top.png","darkage_box.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":darkage:wood_shelves", {
	description = "Wooden Shelves (Deprecated)",
	tiles = { "darkage_shelves.png","darkage_shelves.png","darkage_shelves.png",
			"darkage_shelves.png","darkage_shelves.png","darkage_shelves_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {not_in_creative_inventory = 1, snappy = 3},
	sounds = default.node_sound_wood_defaults(),
})

-- Glass / Glow Glass
minetest.register_node(":darkage:glow_glass", {
	description = "Medieval Glow Glass (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

stairsplus:register_all("darkage", "glow_glass", "darkage:glow_glass", {
    description = "Medieval Glow Glass (Deprecated)",
    tiles = {"darkage_glass.png"},
    paramtype = "light",
    light_source = minetest.LIGHT_MAX,
    groups = {not_in_creative_inventory = 1, snappy=2,cracky=3,oddly_breakable_by_hand=3,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

-- Reinforced Wood
minetest.register_node(":darkage:reinforced_wood", {
	description = "Reinforced Wood (Deprecated)",
	tiles = {"default_wood.png^darkage_reinforce.png"},
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

stairsplus:register_all("darkage", "reinforced_wood", "darkage:reinforced_wood", {
    description = "Reinforced Wood (Deprecated)",
    tiles = {"default_wood.png^darkage_reinforce.png"},
    groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3,not_in_craft_guide=1},
    sounds = default.node_sound_stone_defaults(),
    sunlight_propagates = true,
})

minetest.register_node(":darkage:reinforced_wood_left", {
	description = "Reinforced Wood Left (Deprecated)",
	tiles = {"darkage_reinforced_wood_left.png"},
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node(":darkage:reinforced_wood_right", {
	description = "Reinforced Wood Right (Deprecated)",
	tiles = {"darkage_reinforced_wood_right.png"},
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

-- Wood based deco items
minetest.register_node(":darkage:wood_frame", {
	description = "Wooden Frame (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_wood_frame.png"},
	inventory_image = "darkage_wood_frame.png",
	wield_image = "darkage_wood_frame.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})