minetest.register_node(":travelnet:travelnet", {
	description = "Travelnet-Box (Deprecated)",
	drawtype = "mesh",
	mesh = "travelnet.obj",
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "facedir",
	wield_scale = {x=0.6, y=0.6, z=0.6},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ 0.45, -0.5,-0.5,  0.5,  1.45, 0.5},
			{-0.5 , -0.5, 0.45, 0.45, 1.45, 0.5},
			{-0.5,  -0.5,-0.5 ,-0.45, 1.45, 0.5},

			--groundplate to stand on
			{ -0.5,-0.5,-0.5,0.5,-0.45, 0.5},
			--roof
			{ -0.5, 1.45,-0.5,0.5, 1.5, 0.5},

			-- control panel
			{ -0.2, 0.6,  0.3, 0.2, 1.1,  0.5},
		},
	},
	tiles = {
		"travelnet_travelnet_front.png",  -- backward view
		"travelnet_travelnet_back.png", -- front view
		"travelnet_travelnet_side.png", -- sides :)
		"default_steel_block.png",  -- view from top
		"default_clay.png",  -- view from bottom
	},
	inventory_image = "travelnet_inv.png",
	groups = {cracky=1,choppy=1,snappy=1,not_in_creative_inventory=1},
	use_texture_alpha = "clip",
    light_source = 10,
    -- TNT and overenthusiastic DMs do not destroy travelnets
    on_blast = function(pos, intensity)
    end,
    -- taken from VanessaEs homedecor fridge
    on_place = function(itemstack, placer, pointed_thing)
       local pos = pointed_thing.above;
       local def = minetest.registered_nodes[
             minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name]
       if not def or not def.buildable_to then

          minetest.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place the travelnet box!')
          return;
       end
       return minetest.item_place(itemstack, placer, pointed_thing);
    end,

})

minetest.register_node(":travelnet:elevator", {
	description = "Elevator (Deprecated)",
	drawtype = "mesh",
	mesh = "travelnet_elevator.obj",
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = "facedir",
	wield_scale = {x=0.6, y=0.6, z=0.6},

	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},

	collision_box = {
		type = "fixed",
		fixed = {

			{ 0.48, -0.5,-0.5,  0.5,  0.5, 0.5},
			{-0.5 , -0.5, 0.48, 0.48, 0.5, 0.5},
			{-0.5,  -0.5,-0.5 ,-0.48, 0.5, 0.5},

			--groundplate to stand on
			{ -0.5,-0.5,-0.5,0.5,-0.48, 0.5},
		},
	},

	tiles = {
		"travelnet_elevator_front.png",
		"travelnet_elevator_inside_controls.png",
		"travelnet_elevator_sides_outside.png",
		"travelnet_elevator_inside_ceiling.png",
		"travelnet_elevator_inside_floor.png",
		"default_steel_block.png"
	},
	inventory_image = "travelnet_elevator_inv.png",
	groups = {cracky=1,choppy=1,snappy=1,not_in_creative_inventory=1},
    light_source = 10,
    -- TNT and overenthusiastic DMs do not destroy elevators either
    on_blast = function(pos, intensity)
    end,
    -- taken from VanessaEs homedecor fridge
    on_place = function(itemstack, placer, pointed_thing)
       local pos  = pointed_thing.above;
       local node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z});
       -- leftover elevator_top nodes can be removed by placing a new elevator underneath
       if( node ~= nil and node.name ~= "air" and node.name ~= 'travelnet:elevator_top') then
          minetest.chat_send_player( placer:get_player_name(), 'Not enough vertical space to place the travelnet box!')
          return;
       end
       return minetest.item_place(itemstack, placer, pointed_thing);
    end,
    on_destruct = function(pos)
            local p = {x=pos.x, y=pos.y+1, z=pos.z}
	    minetest.remove_node(p)
    end
})
minetest.register_alias("travelnet:elevator_top", "air")

travelnet = {}
travelnet.register_door = function( node_base_name, def_tiles )
	minetest.register_node(":"..node_base_name.."_open", {
		description = "elevator door (open) (Deprecated)",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = def_tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		use_texture_alpha = "clip",
		-- only the closed variant is in creative inventory
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
                -- larger than one node but slightly smaller than a half node so that wallmounted torches pose no problem
		node_box = {
			type = "fixed",
			fixed = {
				{-0.90, -0.5,  0.4, -0.49, 1.5,  0.5},
				{ 0.49, -0.5,  0.4,  0.9, 1.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.9, -0.5,  0.4,  0.9, 1.5,  0.5},
			},
		},
		drop = node_base_name.."_closed",
                on_rightclick = function(pos, node, puncher)
                    minetest.add_node(pos, {name = node_base_name.."_closed", param2 = node.param2})
                end,
	})

	minetest.register_node(":"..node_base_name.."_closed", {
		description = "elevator door (closed) (Deprecated)",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = def_tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		use_texture_alpha = "clip",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,  -0.5,  0.4, -0.01, 1.5,  0.5},
				{ 0.01, -0.5,  0.4,  0.5,  1.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5,  0.4,  0.5, 1.5,  0.5},
			},
		},
        on_rightclick = function(pos, node, puncher)
            minetest.add_node(pos, {name = node_base_name.."_open", param2 = node.param2})
        end,
	})
end

-- actually register the doors
travelnet.register_door( "travelnet:elevator_door_steel", {"default_stone.png"});
travelnet.register_door( "travelnet:elevator_door_glass", {"travelnet_elevator_door_glass.png"});
travelnet.register_door( "travelnet:elevator_door_tin", {"default_clay.png"});