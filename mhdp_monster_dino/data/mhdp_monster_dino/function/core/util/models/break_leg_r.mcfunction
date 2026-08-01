#> mhdp_monster_dino:core/util/models/break_leg_r
#
# 尻尾部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 右脚
    function animated_java_dino:dino/as_node {name: 'leg_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/leg_right_0_break"'\
    }
    function animated_java_dino:dino/as_node {name: 'leg_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/leg_right_2_break"'\
    }
    function animated_java_dino:dino/as_node {name: 'leg_right_3', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/leg_right_3_break"'\
    }
