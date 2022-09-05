local modpath = minetest.get_modpath("currency")

minetest.log("info", "Currency mod loading...")
local S = minetest.get_translator("currency")

currency = {}
if minetest.global_exists("default") then
	currency.node_sound_wood_defaults = default.node_sound_wood_defaults
else
	currency.node_sound_wood_defaults = function() end
end

minetest.register_node("currency:barter", {
	drawtype = "nodebox",
	description = S("Barter Table"),
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"barter_top.png",
					"barter_base.png",
					"barter_side.png"},
	inventory_image = "barter_top.png",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.312500,-0.500000,0.500000,0.500000,0.500000},
			{-0.437500,-0.500000,-0.437500,-0.250000,0.500000,-0.250000},
			{-0.437500,-0.500000,0.250000,-0.250000,0.500000,0.437500},
			{0.250000,-0.500000,-0.437500,0.437500,0.500000,-0.250000},
			{0.250000,-0.500000,0.250000,0.437500,0.500000,0.447500},
		},
	},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	sounds = currency.node_sound_wood_defaults(),
})

minetest.register_node("currency:shop", {
	description = S("Shop"),
	paramtype2 = "facedir",
	tiles = {"shop_top.png",
			"shop_top.png",
			"shop_side.png",
			"shop_side.png",
			"shop_side.png",
			"shop_front.png"},
	inventory_image = "shop_front.png",
	groups = {choppy=2,oddly_breakable_by_hand=2,tubedevice=1,tubedevice_receiver=1},
	sounds = currency.node_sound_wood_defaults(),
})

minetest.register_node("currency:shop_empty", {
	description = S("Shop") .. " (" .. S("out of stock") .. ")",
	paramtype2 = "facedir",
	tiles = {"shop_top.png",
			"shop_top.png",
			"shop_side_empty.png",
			"shop_side_empty.png",
			"shop_side_empty.png",
			"shop_front_empty.png"},
	drop = "currency:shop",
	groups = {choppy=2,oddly_breakable_by_hand=2,tubedevice=1,tubedevice_receiver=1,not_in_creative_inventory=1},
	sounds = currency.node_sound_wood_defaults(),
})
