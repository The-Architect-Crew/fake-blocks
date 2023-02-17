-- arrow_signs mod
minetest.register_alias("arrow_signs:wall", "blocks:arrowsign_wood")
minetest.register_alias("arrow_signs:steel", "blocks:arrowsign_steel")

-- locked_sign mod
minetest.register_alias("locked_sign:sign_wall_locked", "blocks:sign_wood")

-- itemframes mod
minetest.register_alias("itemframes:frame", "blocks:itemframe_steel")

-- moreores
minetest.register_alias("moreores:mineral_tin", "blocks:stone_with_tin")
minetest.register_alias("moreores:tin_block", "variations:tinblock_big_tile")
minetest.register_alias("moreores:mineral_silver", "blocks:stone_with_silver")
minetest.register_alias("moreores:silver_block", "variations:silverblock_big_tile")
minetest.register_alias("moreores:mineral_mithril", "blocks:stone_with_mithril")
minetest.register_alias("moreores:mithril_block", "variations:mithrilblock_big_tile")

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

-- columnia
sc.convert_columnia("stone", "blocks:stone")
sc.convert_columnia("stonebrick", "variations:stone_brick")
sc.convert_columnia("desert_stonebrick", "variations:desert_stone_brick")
sc.convert_columnia("desert_stone", "blocks:desert_stone")
sc.convert_columnia("cobble", "blocks:cobble")
sc.convert_columnia("brick", "blocks:brick")
sc.convert_columnia("sandstone", "blocks:sandstone")
sc.convert_columnia("sandstonebrick", "variations:sandstone_brick")
sc.convert_columnia("wood", "blocks:wood")
sc.convert_columnia("junglewood", "blocks:junglewood")
sc.convert_columnia("pinewood", "blocks:pinewood")

-- darkage
minetest.register_alias("darkage:chalk", "blocks:chalk")
sc.convert_stairsplus("darkage:chalk", "blocks:chalk")
minetest.register_alias("darkage:marble", "blocks:marble")
sc.convert_stairsplus("darkage:marble", "blocks:marble")
minetest.register_alias("darkage:serpentine", "blocks:serpentine")
sc.convert_stairsplus("darkage:serpentine", "blocks:serpentine")
minetest.register_alias("darkage:mud", "blocks:mud")
minetest.register_alias("darkage:slate", "blocks:slate")
sc.convert_stairsplus("darkage:slate", "blocks:slate")

minetest.register_alias("darkage:basalt", "blocks:basalt")
sc.convert_stairsplus("darkage:basalt", "blocks:basalt")
minetest.register_alias("darkage:slate_cobble", "blocks:slate_cobble")
sc.convert_stairsplus("darkage:slate_cobble", "blocks:slate_cobble")
minetest.register_alias("darkage:basalt_cobble", "blocks:basalt_cobble")
sc.convert_stairsplus("darkage:basalt_cobble", "blocks:basalt_cobble")

minetest.register_alias("darkage:stone_brick", "variations:cobble_small_brick")
shapes:register_shape("variations:cobble_small_brick")
sc.convert_stairsplus("darkage:stone_brick", "variations:cobble_small_brick")

minetest.register_alias("darkage:marble_tile", "variations:marble_big_tile")
shapes:register_shape("variations:marble_big_tile")
sc.convert_stairsplus("darkage:marble_tile", "variations:marble_big_tile")

minetest.register_alias("darkage:reinforced_chalk", "variations:chalk_support_wood")
shapes:register_shape("variations:chalk_support_wood")
sc.convert_stairsplus("darkage:reinforced_chalk", "variations:chalk_support_wood")

minetest.register_alias("darkage:darkdirt", "blocks:dark_dirt")
minetest.register_alias("darkage:dry_leaves", "flora:dry_leaves")

minetest.register_alias("darkage:glass", "blocks:medieval_glass")
sc.convert_stairsplus("darkage:glass", "blocks:medieval_glass")

minetest.register_alias("darkage:wood_bars", "blocks:wood_bars")
minetest.register_alias("darkage:wood_grille", "blocks:wood_grille")
minetest.register_alias("darkage:chain", "blocks:chain")
minetest.register_alias("darkage:iron_bars", "blocks:steel_bars")
minetest.register_alias("darkage:iron_grille", "blocks:steel_grille")

minetest.register_alias("darkage:ors", "blocks:mineral_salt")
sc.convert_stairsplus("darkage:ors", "blocks:mineral_salt")
minetest.register_alias("darkage:ors_cobble", "variations:mineral_salt_brick")
shapes:register_shape("variations:mineral_salt_brick")
sc.convert_stairsplus("darkage:ors_cobble", "variations:mineral_salt_brick")

-- default
minetest.register_alias("default:stone", "blocks:stone")
sc.convert_stairsplus("moreblocks:stone", "blocks:stone")
minetest.register_alias("default:cobble", "blocks:cobble")
sc.convert_stairsplus("moreblocks:cobble", "blocks:cobble")
minetest.register_alias("default:stone_block", "variations:stone_big_tile")
sc.convert_stairsplus("moreblocks:stone_block", "variations:stone_big_tile")
minetest.register_alias("default:mossycobble", "blocks:mossycobble")
sc.convert_stairsplus("moreblocks:mossycobble", "blocks:mossycobble")
minetest.register_alias("default:brick", "blocks:brick")
sc.convert_stairsplus("moreblocks:brick", "blocks:brick")
minetest.register_alias("default:sandstone", "blocks:sandstone")
sc.convert_stairsplus("moreblocks:sandstone", "blocks:sandstone")
minetest.register_alias("default:steelblock", "variations:steelblock_big_tile")
sc.convert_stairsplus("moreblocks:steelblock", "variations:steelblock_big_tile")
minetest.register_alias("default:goldblock", "variations:goldblock_big_tile")
sc.convert_stairsplus("moreblocks:goldblock", "variations:goldblock_big_tile")
minetest.register_alias("default:copperblock", "variations:copperblock_big_tile")
sc.convert_stairsplus("moreblocks:copperblock", "variations:copperblock_big_tile")
minetest.register_alias("default:bronzeblock", "variations:bronzeblock_big_tile")
sc.convert_stairsplus("moreblocks:bronzeblock", "variations:bronzeblock_big_tile")
minetest.register_alias("default:diamondblock", "blocks:diamondblock")
sc.convert_stairsplus("moreblocks:diamondblock", "blocks:diamondblock")
minetest.register_alias("default:tinblock", "variations:tinblock_big_tile")
sc.convert_stairsplus("moreblocks:tinblock", "variations:tinblock_big_tile")
minetest.register_alias("default:desert_stone", "blocks:desert_stone")
sc.convert_stairsplus("moreblocks:desert_stone", "blocks:desert_stone")
minetest.register_alias("default:desert_stone_block", "variations:desert_stone_big_tile")
sc.convert_stairsplus("moreblocks:desert_stone_block", "variations:desert_stone_big_tile")
minetest.register_alias("default:desert_cobble", "blocks:desert_cobble")
sc.convert_stairsplus("moreblocks:desert_cobble", "blocks:desert_cobble")
minetest.register_alias("default:glass", "blocks:glass")
sc.convert_stairsplus("moreblocks:glass", "blocks:glass")
minetest.register_alias("default:wood", "blocks:wood")
sc.convert_stairsplus("moreblocks:wood", "blocks:wood")
minetest.register_alias("default:junglewood", "blocks:junglewood")
sc.convert_stairsplus("moreblocks:junglewood", "blocks:junglewood")
minetest.register_alias("default:pine_wood", "blocks:pine_wood")
sc.convert_stairsplus("moreblocks:pine_wood", "blocks:pine_wood")
minetest.register_alias("default:acacia_wood", "blocks:acacia_wood")
sc.convert_stairsplus("moreblocks:acacia_wood", "blocks:acacia_wood")
minetest.register_alias("default:aspen_wood", "blocks:aspen_wood")
sc.convert_stairsplus("moreblocks:aspen_wood", "blocks:aspen_wood")
minetest.register_alias("default:obsidian", "blocks:obsidian")
sc.convert_stairsplus("moreblocks:obsidian", "blocks:obsidian")
minetest.register_alias("default:obsidian_block", "variations:obsidian_big_tile")
sc.convert_stairsplus("moreblocks:obsidian_block", "variations:obsidian_big_tile")
minetest.register_alias("default:obsidianbrick", "variations:obsidian_brick")
sc.convert_stairsplus("moreblocks:obsidianbrick", "variations:obsidian_brick")
minetest.register_alias("default:obsidian_glass", "blocks:obsidian_glass")
sc.convert_stairsplus("moreblocks:obsidian_glass", "blocks:obsidian_glass")
minetest.register_alias("default:stonebrick", "variations:stone_brick")
sc.convert_stairsplus("moreblocks:stonebrick", "variations:stone_brick")
minetest.register_alias("default:desert_stonebrick", "variations:desert_stone_brick")
sc.convert_stairsplus("moreblocks:desert_stonebrick", "variations:desert_stone_brick")
minetest.register_alias("default:sandstonebrick", "variations:sandstone_brick")
sc.convert_stairsplus("moreblocks:sandstonebrick", "variations:sandstone_brick")
minetest.register_alias("default:silver_sandstone", "blocks:silver_sandstone")
sc.convert_stairsplus("moreblocks:silver_sandstone", "blocks:silver_sandstone")
minetest.register_alias("default:silver_sandstone_brick", "variations:silver_sandstone_brick")
sc.convert_stairsplus("moreblocks:silver_sandstone_brick", "variations:silver_sandstone_brick")
minetest.register_alias("default:silver_sandstone_block", "variations:silver_sandstone_big_tile")
sc.convert_stairsplus("moreblocks:silver_sandstone_block", "variations:silver_sandstone_big_tile")
minetest.register_alias("default:desert_sandstone", "blocks:desert_sandstone")
sc.convert_stairsplus("moreblocks:desert_sandstone", "blocks:desert_sandstone")
minetest.register_alias("default:desert_sandstone_brick", "variations:desert_sandstone_brick")
sc.convert_stairsplus("moreblocks:desert_sandstone_brick", "variations:desert_sandstone_brick")
minetest.register_alias("default:desert_sandstone_block", "variations:desert_sandstone_big_tile")
sc.convert_stairsplus("moreblocks:desert_sandstone_block", "variations:desert_sandstone_big_tile")
minetest.register_alias("default:sandstone_block", "variations:sandstone_big_tile")
sc.convert_stairsplus("moreblocks:sandstone_block", "variations:sandstone_big_tile")
minetest.register_alias("default:ice", "blocks:ice")
sc.convert_stairsplus("moreblocks:ice", "blocks:ice")