--[[
	Mod by kotolegokot
	Version 2012.8.13.0
]]

minetest.register_node("locked_sign:sign_wall_locked", {
	description = "Locked Sign",
	drawtype = "nodebox",
	tiles = {"locked_sign_sign_wall_lock.png"},
	inventory_image = "locked_sign_sign_wall_lock_inv.png",
	wield_image = "locked_sign_sign_wall_lock_inv.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
		wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
		wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
	},
	groups = {choppy=2,dig_immediate=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_alias("sign_wall_locked", "locked_sign:sign_wall_locked")
