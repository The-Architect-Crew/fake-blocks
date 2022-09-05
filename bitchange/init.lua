-- BitChange mod by Krock
-- Players will get money every day by digging or placing blocks

minetest.register_node("bitchange:shop", {
	description = "Shop",
	tiles = {"bitchange_shop_top.png", "bitchange_shop_top.png",
			 "bitchange_shop_side.png", "bitchange_shop_side.png",
			 "bitchange_shop_side.png", "bitchange_shop_front.png"},
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, choppy=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("bitchange:donationbox", {
	description = "Donation box",
	tiles = {"default_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {not_in_creative_inventory = 1, choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.4375,0.25,-0.375,0.425}, --NodeBox1
			{0.25,-0.5,-0.4375,0.425,0.25,0.425}, --NodeBox2
			{-0.4375,-0.5,-0.4375,-0.25,0.25,0.425}, --NodeBox3
			{-0.3125,-0.5,-0.4375,0.25,0.0625,-0.25}, --NodeBox4
			{-0.25,-0.5,0.25,0.25,0.25,0.425}, --NodeBox5
			{-0.5,0.25,-0.5,0.5,0.375,0.5}, --NodeBox6
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4,-0.5,-0.4,0.4,0.35,0.4},
		},
	},
})

-- Bitcoin Block
minetest.register_node("bitchange:bitcoin_block", {
	description = "BitBlock",
	tiles = {"bitchange_bitcoin_block.png"},
	groups = {not_in_creative_inventory = 1, cracky=2},
	sounds = default.node_sound_stone_defaults(),
})
