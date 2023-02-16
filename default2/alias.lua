-- arrow_signs mod
minetest.register_alias("arrow_signs:wall", "blocks:arrowsign_wood")
minetest.register_alias("arrow_signs:steel", "blocks:arrowsign_steel")

-- locked_sign mod
minetest.register_alias("locked_sign:sign_wall_locked", "blocks:sign_wood")

-- itemframes mod
minetest.register_alias("itemframes:frame", "blocks:itemframe_steel")

-- moreores
minetest.register_alias("moreores:mineral_tin", "blocks:stone_with_tin")
minetest.register_alias("moreores:tin_block", "blocks:tinblock")
minetest.register_alias("moreores:mineral_silver", "blocks:stone_with_silver")
minetest.register_alias("moreores:silver_block", "blocks:silverblock")
minetest.register_alias("moreores:mineral_mithril", "blocks:stone_with_mithril")
minetest.register_alias("moreores:mithril_block", "blocks:mithrilblock")

-- gloopblocks
minetest.register_alias("moreores:mineral_tin", "blocks:stone_with_tin")

-- fake_fire mod
minetest.register_alias("fake_fire:ice_fire", "blocks:fire_diamond")
minetest.register_alias("fake_fire:smokeless_ice_fire", "blocks:fire_diamond")
minetest.register_alias("fake_fire:fake_fire", "blocks:fire")
minetest.register_alias("fake_fire:smokeless_fire", "blocks:fire")
minetest.register_alias("fire:permanent_flame", "blocks:fire")
minetest.register_alias("fake_fire:fancy_fire", "blocks:campfire")
minetest.register_alias("fake_fire:embers", "blocks:embers")

-- colouredstonebricks
local COLOURS2 = {
    "black",
    "cyan",
    "brown",
    "dark_blue",
    "dark_green",
    "dark_grey",
    "dark_pink",
    "green",
    "grey",
    "orange",
    "pink",
    "purple",
    "red",
    "white",
    "yellow"
}

for number = 1, 15 do
    local colour2 = COLOURS2[number]
    minetest.register_alias("colouredstonebricks:"..colour2, "variations:stone_"..colour2.."_brick")
    sc.convert_stairsplus("colouredstonebricks:"..colour2, "variations:stone_"..colour2.."_brick")
end

-- MTG wool
local dyes = dye.dyes
for i = 1, #dyes do
	local name = unpack(dyes[i])
	minetest.register_alias("wool:"..name, "blocks:wool_"..name)
	sc.convert_stairsplus("wool:"..name, "blocks:wool_"..name)
end

-- streets mod
minetest.register_alias("streets:asphalt", "blocks:asphalt")
sc.convert_stairsplus("streets:asphalt", "blocks:asphalt")

minetest.register_alias("streets:concrete", "blocks:concrete")
sc.convert_stairsplus("streets:concrete", "blocks:concrete")

minetest.register_alias("streets:steel_support", "furniture:scaffolding_steel")