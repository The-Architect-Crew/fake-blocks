-- Naturally spawning blocks
minetest.register_node("darkage:chalk", {
	description = "Chalk (Deprecated)",
	tiles = {"darkage_chalk.png"},
	is_ground_content = true,
	drop = "darkage:chalk_powder 4",
	groups = {not_in_creative_inventory = 1, crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:marble", {
	description = "Marble (Deprecated)",
	tiles = {"darkage_marble.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3,marble=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:serpentine", {
	description = "Serpentine (Deprecated)",
	tiles = {"darkage_serpentine.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:mud", {
	description = "Mud (Deprecated)",
	tiles = {"darkage_mud_top.png", "darkage_mud.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, crumbly=3},
	drop = "darkage:mud_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("darkage:schist", {
	description = "Schist (Deprecated)",
	tiles = {"darkage_schist.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:shale", {
	description = "Shale (Deprecated)",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:silt", {
	description = "Silt (Deprecated)",
	tiles = {"darkage_silt.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, crumbly=3},
	drop = "darkage:silt_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("darkage:slate", {
	description = "Slate (Deprecated)",
	tiles = {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	is_ground_content = true,
	drop = "darkage:slate_cobble",
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:ors", {
	description = "Old Red Sandstone (Deprecated)",
	tiles = {"darkage_ors.png"},
	is_ground_content = true,
	drop = "darkage:ors_cobble",
	groups = {not_in_creative_inventory = 1, crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:gneiss", {
	description = "Gneiss (Deprecated)",
	tiles = {"darkage_gneiss.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	drop = "darkage:gneiss_cobble",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt", {
	description = "Basalt (Deprecated)",
	tiles = {"darkage_basalt.png"},
	is_ground_content = true,
	drop = "darkage:basalt_cobble",
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

-- Cobble
minetest.register_node("darkage:slate_cobble", {
	description = "Slate Cobble (Deprecated)",
	tiles = {"darkage_slate_brick.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:ors_cobble", {
	description = "Old Red Sandstone Cobble (Deprecated)",
	tiles = {"darkage_ors_brick.png"},
	groups = {not_in_creative_inventory = 1, crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:gneiss_cobble", {
	description = "Gneiss Cobble (Deprecated)",
	tiles = {"darkage_gneiss_brick.png"},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt_cobble", {
	description = "Basalt Cobble (Deprecated)",
	tiles = {"darkage_basalt_brick.png"},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

-- Brick
minetest.register_node("darkage:stone_brick", {
	description = "Darkage Stone Brick (Deprecated)",
	tiles = {"darkage_stone_brick.png"},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

-- Other Blocks
minetest.register_node("darkage:straw", {
	description = "Straw (Deprecated)",
	tiles = {"darkage_straw.png"},
	groups = {not_in_creative_inventory = 1, snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("darkage:straw_bale", {
	description = "Straw Bale (Deprecated)",
	tiles = {"darkage_straw_bale.png"},
	drop = "darkage:straw 4",
	groups = {not_in_creative_inventory = 1, snappy=2, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("darkage:slate_tile", {
	description = "Slate Tile (Deprecated)",
	tiles = {"darkage_slate_tile.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:marble_tile", {
	description = "Marble Tile (Deprecated)",
	tiles = {"darkage_marble_tile.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:reinforced_chalk", {
	description = "Reinforced Chalk (Deprecated)",
	tiles = {"darkage_chalk.png^darkage_reinforce.png"},
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:adobe", {
	description = "Adobe (Deprecated)",
	tiles = {"darkage_adobe.png"},
	groups = {not_in_creative_inventory = 1, crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("darkage:lamp", {
	description = "Lamp (Deprecated)",
	tiles = {"darkage_lamp.png"},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	groups = {not_in_creative_inventory = 1, snappy=2,cracky=3,oddly_breakable_by_hand=3,flammable=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:cobble_with_plaster", {
	description = "Cobblestone With Plaster (Deprecated)",
	tiles = {"darkage_cobble_with_plaster_D.png", "darkage_cobble_with_plaster_B.png", "darkage_cobble_with_plaster_C.png",
		"darkage_cobble_with_plaster_A.png", "default_cobble.png", "darkage_chalk.png"},
	paramtype2 = "facedir",
	drop = "default:cobble",
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("darkage:darkdirt", {
	description = "Dark Dirt (Deprecated)",
	tiles = {"darkage_darkdirt.png"},
	groups = {not_in_creative_inventory = 1, crumbly=2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("darkage:dry_leaves", {
	description = "Dry Leaves (Deprecated)",
	tiles = {"darkage_dry_leaves.png"},
	paramtype = "light",
	groups = {not_in_creative_inventory = 1, snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults()
})

-- Storage blocks (boxes, shelves, ect.)
minetest.register_node("darkage:box", {
	description = "Box (Deprecated)",
	tiles = { "darkage_box_top.png","darkage_box_top.png","darkage_box.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {not_in_creative_inventory = 1,  snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("darkage:wood_shelves", {
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
minetest.register_node("darkage:glass", {
	description = "Medieval Glass (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:glow_glass", {
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

-- Reinforced Wood
minetest.register_node("darkage:reinforced_wood", {
	description = "Reinforced Wood (Deprecated)",
	tiles = {"default_wood.png^darkage_reinforce.png"},
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:reinforced_wood_left", {
	description = "Reinforced Wood Left (Deprecated)",
	tiles = {"darkage_reinforced_wood_left.png"},
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:reinforced_wood_right", {
	description = "Reinforced Wood Right (Deprecated)",
	tiles = {"darkage_reinforced_wood_right.png"},
	groups = {not_in_creative_inventory = 1, snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

-- Wood based deco items
minetest.register_node("darkage:wood_bars", {
	description = "Wooden Bars (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_wood_bars.png"},
	inventory_image = "darkage_wood_bars.png",
	wield_image = "darkage_wood_bars.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:wood_grille", {
	description = "Wooden Grille (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_wood_grille.png"},
	inventory_image = "darkage_wood_grille.png",
	wield_image = "darkage_wood_grille.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:wood_frame", {
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

-- Metal based deco items
minetest.register_node("darkage:chain", {
	description = "Chain (Deprecated)",
	drawtype = "signlike",
	tiles = {"darkage_chain.png"},
	inventory_image = "darkage_chain.png",
	wield_image = "darkage_chain.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	selection_box = {
		type = "wallmounted",
	},
	groups = {not_in_creative_inventory = 1, snappy=1,cracky=2,oddly_breakable_by_hand=2},
	legacy_wallmounted = true
})

minetest.register_node("darkage:iron_bars", {
	description = "Iron Bars (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_iron_bars.png"},
	inventory_image = "darkage_iron_bars.png",
	wield_image = "darkage_iron_bars.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:iron_grille", {
	description = "Iron Grille (Deprecated)",
	drawtype = "glasslike",
	tiles = {"darkage_iron_grille.png"},
	inventory_image = "darkage_iron_grille.png",
	wield_image = "darkage_iron_grille.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, cracky=3},
	sounds = default.node_sound_stone_defaults()
})
