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
-- minetest.register_alias("darkage:slate_cobble", "blocks:slate_cobble")
-- sc.convert_stairsplus("darkage:slate_cobble", "blocks:slate_cobble")
minetest.register_alias("darkage:slate_cobble", "variations:slate_brick")
sc.convert_stairsplus("darkage:slate_cobble", "variations:slate_brick")
-- minetest.register_alias("darkage:basalt_cobble", "blocks:basalt_cobble")
-- sc.convert_stairsplus("darkage:basalt_cobble", "blocks:basalt_cobble")
minetest.register_alias("darkage:basalt_cobble", "variations:basalt_brick")
sc.convert_stairsplus("darkage:basalt_cobble", "variations:basalt_brick")

minetest.register_alias("darkage:stone_brick", "variations:cobble_small_brick")
sc.convert_stairsplus("darkage:stone_brick", "variations:cobble_small_brick")

minetest.register_alias("darkage:marble_tile", "variations:marble_big_tile")
sc.convert_stairsplus("darkage:marble_tile", "variations:marble_big_tile")

minetest.register_alias("darkage:reinforced_chalk", "variations:chalk_support_wood")
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
sc.convert_stairsplus("darkage:ors_cobble", "variations:mineral_salt_brick")

-- default
-- blocks / brick.lua
minetest.register_alias("default:clay_brick", "blocks:clay_brick")
minetest.register_alias("default:clay_lump", "blocks:clay_lump")
minetest.register_alias("default:clay", "blocks:clay")
minetest.register_alias("default:brick", "blocks:brick")
sc.convert_stairsplus("moreblocks:brick", "blocks:brick")

-- blocks / book.lua
minetest.register_alias("default:paper", "blocks:paper")
minetest.register_alias("default:book", "blocks:book")
minetest.register_alias("default:book_written", "blocks:book_written")
minetest.register_alias("default:bookshelf", "blocks:bookshelf")

-- blocks / ladder.lua
minetest.register_alias("default:ladder_wood", "blocks:ladder_wood")
minetest.register_alias("default:ladder_steel", "blocks:ladder_steel")

-- blocks / sign.lua
minetest.register_alias("default:sign_wall_wood", "blocks:sign_wood")
minetest.register_alias("default:sign_wall_steel", "blocks:sign_steel")

-- blocks / cloud.lua
minetest.register_alias("default:cloud", "blocks:cloud")

-- blocks / liquid.lua
minetest.register_alias("default:water_source", "blocks:water_source")
minetest.register_alias("default:water_flowing", "blocks:water_flowing")
minetest.register_alias("default:river_water_source", "blocks:river_water_source")
minetest.register_alias("default:river_water_flowing", "blocks:river_water_flowing")
minetest.register_alias("default:lava_source", "blocks:lava_source")
minetest.register_alias("default:lava_flowing", "blocks:lava_flowing")

-- blocks / glass.lua
minetest.register_alias("default:glass", "blocks:glass")
sc.convert_stairsplus("moreblocks:glass", "blocks:glass")
minetest.register_alias("default:obsidian_glass", "blocks:obsidian_glass")
sc.convert_stairsplus("moreblocks:obsidian_glass", "blocks:obsidian_glass")

-- blocks / ore.lua
minetest.register_alias("default:coal_lump", "blocks:coal_lump")
minetest.register_alias("default:stone_with_coal", "blocks:stone_with_coal")
minetest.register_alias("default:coalblock", "blocks:coalblock")
minetest.register_alias("default:iron_lump", "blocks:iron_lump")
minetest.register_alias("default:stone_with_iron", "blocks:stone_with_iron")
minetest.register_alias("default:steel_ingot", "blocks:steel_ingot")
minetest.register_alias("default:copper_ingot", "blocks:copper_ingot")
minetest.register_alias("default:copper_lump", "blocks:copper_lump")
minetest.register_alias("default:stone_with_copper", "blocks:stone_with_copper")
minetest.register_alias("default:tin_ingot", "blocks:tin_ingot")
minetest.register_alias("default:tin_lump", "blocks:tin_lump")
minetest.register_alias("default:stone_with_tin", "blocks:stone_with_tin")
minetest.register_alias("default:bronze_ingot", "blocks:bronze_ingot")
minetest.register_alias("default:mese_crystal", "blocks:mese_crystal")
minetest.register_alias("default:mese_crystal_fragment", "blocks:mese_crystal_fragment")
minetest.register_alias("default:stone_with_mese", "blocks:stone_with_mese")
minetest.register_alias("default:mese", "blocks:mese")
minetest.register_alias("default:gold_ingot", "blocks:gold_ingot")
minetest.register_alias("default:gold_lump", "blocks:gold_lump")
minetest.register_alias("default:stone_with_gold", "blocks:stone_with_gold")
minetest.register_alias("default:diamond", "blocks:diamond")
minetest.register_alias("default:stone_with_diamond", "blocks:stone_with_diamond")
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

-- blocks / dirt.lua
minetest.register_alias("default:dirt", "blocks:dirt")
minetest.register_alias("default:dirt_with_grass", "blocks:dirt_with_grass")
minetest.register_alias("default:dirt_with_grass_footsteps", "blocks:dirt_with_grass_footsteps")
minetest.register_alias("default:dirt_with_dry_grass", "blocks:dirt_with_dry_grass")
minetest.register_alias("default:dirt_with_snow", "blocks:dirt_with_snow")
minetest.register_alias("default:dirt_with_rainforest_litter", "blocks:dirt_with_rainforest_litter")
minetest.register_alias("default:dirt_with_coniferous_litter", "blocks:dirt_with_coniferous_litter")
minetest.register_alias("default:dry_dirt", "blocks:dry_dirt")
minetest.register_alias("default:dry_dirt_with_dry_grass", "blocks:dry_dirt_with_dry_grass")

-- blocks / sand.lua
minetest.register_alias("default:sand", "blocks:sand")
minetest.register_alias("default:desert_sand", "blocks:desert_sand")
minetest.register_alias("default:silver_sand", "blocks:silver_sand")
minetest.register_alias("default:flint", "blocks:flint")
minetest.register_alias("default:gravel", "blocks:gravel")

-- blocks / snow.lua
minetest.register_alias("default:permafrost", "blocks:permafrost")
minetest.register_alias("default:permafrost_with_stones", "blocks:permafrost_with_stones")
minetest.register_alias("default:permafrost_with_moss", "blocks:permafrost_with_moss")
minetest.register_alias("default:snow", "blocks:snow")
minetest.register_alias("default:snowblock", "blocks:snowblock")
minetest.register_alias("default:ice", "blocks:ice")
sc.convert_stairsplus("moreblocks:ice", "blocks:ice")
minetest.register_alias("default:cave_ice", "blocks:cave_ice")

-- blocks / plank.lua
minetest.register_alias("default:stick", "blocks:stick")
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

-- blocks / stone.lua
minetest.register_alias("default:obsidian_shard", "blocks:obsidian_shard")
minetest.register_alias("default:obsidian", "blocks:obsidian")
sc.convert_stairsplus("moreblocks:obsidian", "blocks:obsidian")
minetest.register_alias("default:obsidian_block", "variations:obsidian_big_tile")
sc.convert_stairsplus("moreblocks:obsidian_block", "variations:obsidian_big_tile")
minetest.register_alias("default:obsidianbrick", "variations:obsidian_brick")
sc.convert_stairsplus("moreblocks:obsidianbrick", "variations:obsidian_brick")
minetest.register_alias("default:stone", "blocks:stone")
sc.convert_stairsplus("moreblocks:stone", "blocks:stone")
minetest.register_alias("default:cobble", "blocks:cobble")
sc.convert_stairsplus("moreblocks:cobble", "blocks:cobble")
minetest.register_alias("blocks:stonebrick", "variations:stone_brick")
minetest.register_alias("default:stonebrick", "variations:stone_brick")
sc.convert_stairsplus("moreblocks:stonebrick", "variations:stone_brick")
minetest.register_alias("default:stone_block", "variations:stone_big_tile")
sc.convert_stairsplus("moreblocks:stone_block", "variations:stone_big_tile")
minetest.register_alias("default:mossycobble", "blocks:mossycobble")
sc.convert_stairsplus("moreblocks:mossycobble", "blocks:mossycobble")
minetest.register_alias("default:sandstone", "blocks:sandstone")
sc.convert_stairsplus("moreblocks:sandstone", "blocks:sandstone")
minetest.register_alias("default:sandstonebrick", "variations:sandstone_brick")
sc.convert_stairsplus("moreblocks:sandstonebrick", "variations:sandstone_brick")
minetest.register_alias("default:sandstone_block", "variations:sandstone_big_tile")
sc.convert_stairsplus("moreblocks:sandstone_block", "variations:sandstone_big_tile")
minetest.register_alias("default:desert_stone", "blocks:desert_stone")
sc.convert_stairsplus("moreblocks:desert_stone", "blocks:desert_stone")
minetest.register_alias("default:desert_stone_block", "variations:desert_stone_big_tile")
sc.convert_stairsplus("moreblocks:desert_stone_block", "variations:desert_stone_big_tile")
minetest.register_alias("default:desert_cobble", "blocks:desert_cobble")
sc.convert_stairsplus("moreblocks:desert_cobble", "blocks:desert_cobble")
minetest.register_alias("default:desert_stonebrick", "variations:desert_stone_brick")
sc.convert_stairsplus("moreblocks:desert_stonebrick", "variations:desert_stone_brick")
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

-- blocks / torch.lua
minetest.register_alias("default:torch", "blocks:torch")
minetest.register_alias("default:torch_wall", "blocks:torch_wall")
minetest.register_alias("default:torch_ceiling", "blocks:torch_ceiling")

-- blocks / chest.lua
minetest.register_alias("default:chest_locked", "blocks:chest_locked")
minetest.register_alias("default:chest", "blocks:chest")

-- blocks / furnace.lua
-- minetest.register_alias("default:furnace", "blocks:furnace")

-- blocks / lamp.lua
minetest.register_alias("default:mese_post_light", "blocks:mese_post_light")

-- flora / coral.lua
minetest.register_alias("default:sand_with_kelp", "flora:sand_with_kelp")
minetest.register_alias("default:coral_green", "flora:coral_green")
minetest.register_alias("default:coral_pink", "flora:coral_pink")
minetest.register_alias("default:coral_cyan", "flora:coral_cyan")
minetest.register_alias("default:coral_brown", "flora:coral_brown")
minetest.register_alias("default:coral_orange", "flora:coral_orange")
minetest.register_alias("default:coral_skeleton", "flora:coral_skeleton")

-- tools / key.lua
minetest.register_alias("default:key", "tools:key")
minetest.register_alias("default:skeleton_key", "tools:skeleton_key")

-- tools / basic.lua
minetest.register_alias("default:pick_wood", "tools:pick_wood")
minetest.register_alias("default:pick_stone", "tools:pick_stone")
minetest.register_alias("default:pick_bronze", "tools:pick_bronze")
minetest.register_alias("default:pick_steel", "tools:pick_steel")
minetest.register_alias("default:pick_mese", "tools:pick_mese")
minetest.register_alias("default:pick_diamond", "tools:pick_diamond")
minetest.register_alias("default:shovel_wood", "tools:shovel_wood")
minetest.register_alias("default:shovel_stone", "tools:shovel_stone")
minetest.register_alias("default:shovel_bronze", "tools:shovel_bronze")
minetest.register_alias("default:shovel_steel", "tools:shovel_steel")
minetest.register_alias("default:shovel_mese", "tools:shovel_mese")
minetest.register_alias("default:shovel_diamond", "tools:shovel_diamond")
minetest.register_alias("default:axe_wood", "tools:axe_wood")
minetest.register_alias("default:axe_stone", "tools:axe_stone")
minetest.register_alias("default:axe_bronze", "tools:axe_bronze")
minetest.register_alias("default:axe_steel", "tools:axe_steel")
minetest.register_alias("default:axe_mese", "tools:axe_mese")
minetest.register_alias("default:axe_diamond", "tools:axe_diamond")
minetest.register_alias("default:sword_wood", "tools:sword_wood")
minetest.register_alias("default:sword_stone", "tools:sword_stone")
minetest.register_alias("default:sword_bronze", "tools:sword_bronze")
minetest.register_alias("default:sword_steel", "tools:sword_steel")
minetest.register_alias("default:sword_mese", "tools:sword_mese")
minetest.register_alias("default:sword_diamond", "tools:sword_diamond")

-- flora / plant.lua
minetest.register_alias("default:cactus", "flora:cactus")
minetest.register_alias("default:large_cactus_seedling", "flora:large_cactus_seedling")
minetest.register_alias("default:papyrus", "flora:papyrus")
minetest.register_alias("default:dry_shrub", "flora:dry_shrub")
minetest.register_alias("default:junglegrass", "flora:junglegrass_1")
minetest.register_alias("default:grass_1", "flora:grass_1")
minetest.register_alias("default:grass_2", "flora:grass_2")
minetest.register_alias("default:grass_3", "flora:grass_3")
minetest.register_alias("default:grass_4", "flora:grass_4")
minetest.register_alias("default:grass_5", "flora:grass_5")
minetest.register_alias("default:dry_grass_1", "flora:dry_grass_1")
minetest.register_alias("default:dry_grass_2", "flora:dry_grass_2")
minetest.register_alias("default:dry_grass_3", "flora:dry_grass_3")
minetest.register_alias("default:dry_grass_4", "flora:dry_grass_4")
minetest.register_alias("default:dry_grass_5", "flora:dry_grass_5")
minetest.register_alias("default:fern_1", "flora:fern_1")
minetest.register_alias("default:fern_2", "flora:fern_2")
minetest.register_alias("default:fern_3", "flora:fern_3")
minetest.register_alias("default:marram_grass_1", "flora:marram_grass_1")
minetest.register_alias("default:marram_grass_2", "flora:marram_grass_2")
minetest.register_alias("default:marram_grass_3", "flora:marram_grass_3")

-- flora / coral.lua
minetest.register_alias("default:sand_with_kelp", "flora:sand_with_kelp")
minetest.register_alias("default:coral_green", "flora:coral_green")
minetest.register_alias("default:coral_pink", "flora:coral_pink")
minetest.register_alias("default:coral_cyan", "flora:coral_cyan")
minetest.register_alias("default:coral_brown", "flora:coral_brown")
minetest.register_alias("default:coral_orange", "flora:coral_orange")
minetest.register_alias("default:coral_skeleton", "flora:coral_skeleton")

-- flora / bush.lua
minetest.register_alias("default:bush_stem", "flora:bush_stem")
minetest.register_alias("default:bush_leaves", "flora:bush_leaves")
minetest.register_alias("default:bush_sapling", "flora:bush_sapling")
minetest.register_alias("default:blueberries", "flora:blueberries")
minetest.register_alias("default:blueberry_bush_leaves_with_berries", "flora:blueberry_bush_leaves_with_berries")
minetest.register_alias("default:blueberry_bush_leaves", "flora:blueberry_bush_leaves")
minetest.register_alias("default:blueberry_bush_sapling", "flora:blueberry_bush_sapling")
minetest.register_alias("default:acacia_bush_stem", "flora:acacia_bush_stem")
minetest.register_alias("default:acacia_bush_leaves", "flora:acacia_bush_leaves")
minetest.register_alias("default:acacia_bush_sapling", "flora:acacia_bush_sapling")
minetest.register_alias("default:pine_bush_stem", "flora:pine_bush_stem")
minetest.register_alias("default:pine_bush_needles", "flora:pine_bush_needles")
minetest.register_alias("default:pine_bush_sapling", "flora:pine_bush_sapling")

-- flora / tree.lua
minetest.register_alias("default:tree", "flora:tree")
sc.convert_stairsplus("moreblocks:tree", "flora:tree")
minetest.register_alias("default:sapling", "flora:sapling")
minetest.register_alias("default:leaves", "flora:leaves")
minetest.register_alias("default:apple", "flora:apple")
minetest.register_alias("default:apple_mark", "flora:apple_mark")
minetest.register_alias("default:jungletree", "flora:jungletree")
sc.convert_stairsplus("moreblocks:jungletree", "flora:jungletree")
minetest.register_alias("default:jungleleaves", "flora:jungleleaves")
minetest.register_alias("default:junglesapling", "flora:junglesapling")
minetest.register_alias("default:emergent_jungle_sapling", "flora:emergent_jungle_sapling")
minetest.register_alias("default:pine_tree", "flora:pine_tree")
sc.convert_stairsplus("moreblocks:pine_tree", "flora:pine_tree")
minetest.register_alias("default:pine_needles", "flora:pine_needles")
minetest.register_alias("default:pine_sapling", "flora:pine_sapling")
minetest.register_alias("default:acacia_tree", "flora:acacia_tree")
sc.convert_stairsplus("moreblocks:acacia_tree", "flora:acacia_tree")
minetest.register_alias("default:acacia_leaves", "flora:acacia_leaves")
minetest.register_alias("default:acacia_sapling", "flora:acacia_sapling")
minetest.register_alias("default:aspen_tree", "flora:aspen_tree")
sc.convert_stairsplus("moreblocks:aspen_tree", "flora:aspen_tree")
minetest.register_alias("default:aspen_leaves", "flora:aspen_leaves")
minetest.register_alias("default:aspen_sapling", "flora:aspen_sapling")

-- blocks / wool.lua
minetest.register_alias("wool:red", "blocks:wool_red")
minetest.register_alias("wool:blue", "blocks:wool_blue")
minetest.register_alias("wool:cyan", "blocks:wool_cyan")
minetest.register_alias("wool:grey", "blocks:wool_grey")
minetest.register_alias("wool:pink", "blocks:wool_pink")
minetest.register_alias("wool:black", "blocks:wool_black")
minetest.register_alias("wool:brown", "blocks:wool_brown")
minetest.register_alias("wool:green", "blocks:wool_green")
minetest.register_alias("wool:white", "blocks:wool_white")
minetest.register_alias("wool:orange", "blocks:wool_orange")
minetest.register_alias("wool:violet", "blocks:wool_violet")
minetest.register_alias("wool:yellow", "blocks:wool_yellow")
minetest.register_alias("wool:magenta", "blocks:wool_magenta")
minetest.register_alias("wool:dark_grey", "blocks:wool_dark_grey")
minetest.register_alias("wool:dark_green", "blocks:wool_dark_green")

-- tools / screwdriver.lua
minetest.register_alias("screwdriver:screwdriver", "tools:screwdriver")

-- flora / flower.lua
minetest.register_alias("flowers:rose", "flora:rose")
minetest.register_alias("flowers:flowers", "flora:flowers")
minetest.register_alias("flowers:dandelion_yellow", "flora:dandelion_yellow")
minetest.register_alias("flowers:geranium", "flora:geranium")
minetest.register_alias("flowers:viola", "flora:viola")
minetest.register_alias("flowers:dandelion_white", "flora:dandelion_white")
minetest.register_alias("flowers:mushroom_brown", "flora:mushroom_brown")
minetest.register_alias("flowers:mushroom_red", "flora:mushroom_red")
minetest.register_alias("flowers:tulip", "flora:tulip")
minetest.register_alias("flowers:tulip_black", "flora:tulip_black")
minetest.register_alias("flowers:chrysanthemum_green", "flora:chrysanthemum_green")
minetest.register_alias("flowers:waterlily", "flora:waterlily")
minetest.register_alias("flowers:waterlily_waving", "flora:waterlily_waving")

-- blocks / vessels.lua
minetest.register_alias("vessels:shelf", "blocks:vesselshelf")
minetest.register_alias("vessels:glass_bottle", "blocks:glass_bottle")
minetest.register_alias("vessels:drinking_glass", "blocks:drinking_glass")
minetest.register_alias("vessels:steel_bottle", "blocks:steel_bottle")
minetest.register_alias("vessels:glass_fragments", "blocks:glass_fragments")