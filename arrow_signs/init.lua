--[[
	Arrow signs mod for Minetest.

	This mods adds arrowsigns into Minetest. Rotatable in all directions.

	Thanks to:
		Jat15 for the place and rotate system
		Hectic for the new Textures that fit into Minetest  0.4.14

	This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
]]

arrow_signs={}

arrow_signs.on_place = function(itemstack, placer, pointed_thing)

	local posabove = pointed_thing.above
	local posunder = pointed_thing.under
	local vector = placer:get_look_dir()
	local param2 = 0

	-- I wonder if there is a way to calculate the param2 instad of using so much if here.
	-- +Y
	if posabove.y>posunder.y then
		if(vector.z>0.5 and vector.z<=1) then
			param2 = 10
		elseif (vector.x>0.5 and vector.x<=1) then
			param2 = 19
		elseif(-0.5>vector.z and -1<=vector.z) then
			param2 = 4
		elseif (-0.5>vector.x and -1<=vector.x) then
			param2 = 13
		end
	-- -Y
	elseif posabove.y<posunder.y then
		if(vector.z>0.5 and vector.z<=1) then
			param2 = 8
		elseif (vector.x>0.5 and vector.x<=1) then
			param2 = 17
		elseif(-0.5>vector.z and -1<=vector.z) then
			param2 = 6
		elseif (-0.5>vector.x and -1<=vector.x) then
			param2 = 15
		end
	-- +Z
	elseif posabove.z>posunder.z then
		if(vector.y>0.75 and vector.y<=1) then
			param2 = 22
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 2
		elseif (vector.x>=0 and vector.x<=1) then
			param2 = 18
		elseif (vector.x<0 and vector.x>=-1) then
			param2 = 14
		end
	-- -Z
	elseif posabove.z<posunder.z then
		if(vector.y>0.75 and vector.y<=1) then
			param2 = 20
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 0
		elseif (vector.x>=0 and vector.x<=1) then
			param2 = 16
		elseif (vector.x<0 and vector.x>=-1) then
			param2 = 12
		end
	-- +X
	elseif posabove.x>posunder.x then
		if(vector.y>0.75 and vector.y<=1) then
			 param2 = 21
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 3
		elseif (vector.z>=0 and vector.z<=1) then
			param2 = 11
		elseif (vector.z<0 and vector.z>=-1) then
			param2 = 7
		end
	-- -X
	elseif posabove.x<posunder.x then
		if(vector.y>0.75 and vector.y<=1) then
			param2 = 23
		elseif (vector.y>=-1 and vector.y<-0.75) then
			param2 = 1
		elseif (vector.z>=0 and vector.z<=1) then
			param2 = 9
		elseif (vector.z<0 and vector.z>=-1) then
			param2 = 5
		end
	end

	return minetest.item_place_node(itemstack, placer, pointed_thing, param2)
end

local matrix = {
	-- Mounted on Ground (-Y)
	[10]=19,
	[19]=4,
	[4]=13,
	[13]=10,

	-- Mounted on Top (+Y)
	[8]=17,
	[17]=6,
	[6]=15,
	[15]=8,

	-- Mounted at South (-Z)
	[2]=18, -- down
	[18]=22, -- left
	[22]=14, -- up
	[14]=2, -- right

	-- Mounted at North (+Z)
	[0]=12, -- down
	[12]=20, -- left
	[20]=16, -- up
	[16]=0, -- right

	-- Mounted at West (-X)
	[3]=7, -- down
	[7]=21, -- left
	[21]=11, -- up
	[11]=3, -- right

	-- Mounted at East (+X)
	[1]=9, -- down
	[9]=23, -- left
	[23]=5, -- up
	[5]=1, -- right
}

arrow_signs.on_rotate = function(pos, node, player, mode, new_param2)
	node.param2 = matrix[node.param2] or 0 --in case of error
	minetest.swap_node(pos,node)
	return true
end

arrow_signs.nodebox = {
	type = "fixed",
	fixed = {
		{ 0.25, -0.25, 0.4375, -0.25, 0.5, 0.5},
		{ 0.1875, -0.3125, 0.4375, -0.1875, -0.25, 0.5},
		{ 0.125, -0.3125, 0.4375, -0.125, -0.375, 0.5},
		{ 0.0625, -0.375, 0.4375, -0.0625, -0.437, 0.5}
	}
}

arrow_signs.selection_box = {
		type = "fixed",
		fixed = {
			{ 0.30, -0.5, 0.4375, -0.30, 0.5, 0.5}
		}
	}

local MODPATH = minetest.get_modpath("arrow_signs")

minetest.register_node("arrow_signs:wall", {
	description = "Arrow sign",
	drawtype = "nodebox",
	node_box = arrow_signs.nodebox,
	selection_box = arrow_signs.selection_box,
	tiles = {"arrow_signs_wood.png^arrow_signs_wood_border.png"},
	inventory_image = "arrow_signs_wood.png^[transformR90",
	wield_image = "arrow_signs_wood.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {not_in_creative_inventory = 1, choppy = 2, flammable = 2, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_defaults(),
	on_place = arrow_signs.on_place,
	on_rotate = arrow_signs.on_rotate,
})

minetest.register_node("arrow_signs:steel", {
	description = "Steel Arrow Sign",
	drawtype = "nodebox",
	node_box = arrow_signs.nodebox,
	selection_box = arrow_signs.selection_box,
	tiles = {"arrow_signs_steel.png^arrow_signs_steel_border.png"},
	inventory_image = "arrow_signs_steel.png^[transformR90",
	wield_image = "arrow_signs_steel.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {not_in_creative_inventory = 1, cracky = 2},
	sounds = default.node_sound_defaults(),
	on_place = arrow_signs.on_place,
	on_rotate = arrow_signs.on_rotate,
})