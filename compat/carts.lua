carts = {}
carts.modpath = minetest.get_modpath("carts")
carts.railparams = {}

function carts:register_rail(name, def_overwrite, railparams)
	local def = {
		drawtype = "raillike",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
		},
		sounds = default.node_sound_metal_defaults()
	}
	for k, v in pairs(def_overwrite) do
		def[k] = v
	end
	if not def.inventory_image then
		def.wield_image = def.tiles[1]
		def.inventory_image = def.tiles[1]
	end

	if railparams then
		carts.railparams[name] = table.copy(railparams)
	end

	minetest.register_node(":"..name, def)
end

function carts:get_rail_groups(additional_groups)
	-- Get the default rail groups and add more when a table is given
	local groups = {
        not_in_creative_inventory = 1,
		dig_immediate = 2,
		attached_node = 1,
		rail = 1,
		connect_to_raillike = minetest.raillike_group("rail")
	}
	if type(additional_groups) == "table" then
		for k, v in pairs(additional_groups) do
			groups[k] = v
		end
	end
	return groups
end

carts:register_rail("carts:rail", {
	description = "Rail (Deprecated)",
	tiles = {
		"carts_rail_straight.png", "carts_rail_curved.png",
		"carts_rail_t_junction.png", "carts_rail_crossing.png"
	},
	inventory_image = "carts_rail_straight.png",
	wield_image = "carts_rail_straight.png",
	groups = carts:get_rail_groups(),
}, {})

minetest.register_alias("default:rail", "carts:rail")

carts:register_rail("carts:powerrail", {
	description = "Powered Rail (Deprecated)",
	tiles = {
		"carts_rail_straight_pwr.png", "carts_rail_curved_pwr.png",
		"carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = 5})

carts:register_rail("carts:brakerail", {
	description = "Brake Rail (Deprecated)",
	tiles = {
		"carts_rail_straight_brk.png", "carts_rail_curved_brk.png",
		"carts_rail_t_junction_brk.png", "carts_rail_crossing_brk.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = -3})