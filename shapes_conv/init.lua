sc = {}

sc.stairsplus_list = {

    -- cubic
    {"slab_", "_1",             "_slab1"},
    {"slab_", "_2",             "_slab2"},
    {"slab_", "_quarter",       "_slab4"},
    {"slab_", "",               "_slab"},
    {"slab_", "_three_quarter", "_slab12"},
    {"slab_", "_14",            "_slab14"},
    {"slab_", "_15",            "_slab14"},

    {"stair_", "_alt_1",        "_splitstair1"},
    {"stair_", "_alt_2",        "_splitstair1"},
    {"stair_", "_alt_4",        "_splitstair4"},
    {"stair_", "_alt",          "_splitstair"},

    {"micro_", "_1",            "_cube1"},
    {"micro_", "_2",            "_cube2"},
    {"micro_", "_4",            "_cube4"},
    {"micro_", "",              "_cube"},
    {"micro_", "_12",           "_cube12"},
    {"micro_", "_14",           "_cube14"},
    {"micro_", "_15",           "_cube14"},

    {"panel_", "_1",            "_step"},
    {"panel_", "_2",            "_step"},
    {"panel_", "_4",            "_step"},
    {"panel_", "",              "_step"},
    {"panel_", "_12",           "_step"},
    {"panel_", "_14",           "_step"},
    {"panel_", "_15",           "_step"},

    {"stair_", "_outer",        "_outerstair"},
    {"stair_", "",              "_stair"},
    {"stair_", "_inner",        "_innerstair"},
    {"stair_", "_half",         "_halfstair"},
    {"stair_", "_right_half",   "_righthalfstair"},

    {"slab_", "_two_sides",     "_slab1"},
    {"slab_", "_three_sides",   "block"},
    {"slab_", "_three_sides_u", "block"},

    -- slope
    {"slope_", "",                          "_slope"},
    {"slope_", "_half",                     "_slope2"},
    {"slope_", "_half_raised",              "_slope3"},
    {"slope_", "_inner",                    "_innerslope"},
    {"slope_", "_inner_half",               "_innerslope2"},
    {"slope_", "_inner_half_raised",        "_innerslope3"},
    {"slope_", "_inner_cut",                "_cutinnerslope"},
    {"slope_", "_inner_cut_half",           "_cutinnerslope2"},
    {"slope_", "_inner_cut_half_raised",    "_cutinnerslope3"},
    {"slope_", "_outer",                    "_outerslope"},
    {"slope_", "_outer_half",               "_outerslope2"},
    {"slope_", "_outer_half_raised",        "_outerslope3"},
    {"slope_", "_outer_half_raised",        "_outerslope3"},
    {"slope_", "_outer_cut",                "_cutouterslope"},
    {"slope_", "_outer_cut_half",           "_cutouterslope2"},
    {"slope_", "_outer_cut_half_raised",    "_cutouterslope3"},
    {"slope_", "_cut",                      "_cutouterslope4"},
}

function sc.convert_stairsplus(oldname, newname)
    for i in ipairs(sc.stairsplus_list) do
        local old_mname = string.match(oldname, '(.*):')
        local old_nname = string.match(oldname, ':(.*)')

        local new_mname = string.match(newname, '(.*):')
        local new_nname = string.match(newname, ':(.*)')
        if sc.stairsplus_list[i][3] == "block" then
            minetest.register_alias(old_mname..":"..sc.stairsplus_list[i][1]..""..old_nname..""..sc.stairsplus_list[i][2], newname)
        else
            minetest.register_alias(old_mname..":"..sc.stairsplus_list[i][1]..""..old_nname..""..sc.stairsplus_list[i][2], new_mname..":shapes_"..new_nname..""..sc.stairsplus_list[i][3])
        end
    end
end

sc.columnia_list = {
    {"_mid_",       "_pillar"},
    {"_top_",       "_pillarcrown"},
    {"_link_",      "_beam"},
    {"_bottom_",    "_pillarcrown"},
    {"_linkdown_",  "_linkdown"},
    {"_crosslink_", "_crosscrown"},
}

function sc.convert_columnia(oldname, newname)
    for i in ipairs(sc.columnia_list) do
        local new_mname = string.match(newname, '(.*):')
        local new_nname = string.match(newname, ':(.*)')
        if sc.columnia_list[i][2] == "block" then
            minetest.register_alias("columnia:column"..sc.columnia_list[i][1]..""..oldname, newname)
        else
            minetest.register_alias("columnia:column"..sc.columnia_list[i][1]..""..oldname, new_mname..":shapes_"..new_nname..""..sc.columnia_list[i][2])
        end
    end
end