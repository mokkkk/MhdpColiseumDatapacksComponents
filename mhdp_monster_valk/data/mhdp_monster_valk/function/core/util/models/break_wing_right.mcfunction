#> mhdp_monster_valk:core/util/models/break_wing_right
#
# right 翼部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink
#
# TODO: item_model の値は仮のプレースホルダ。AJ 再エクスポート後の実際の aj_sub / blueprint モデル名に差し替えること。

# モデル変更
    execute if entity @s[tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_anger_break"'\
    }
    execute if entity @s[tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_anger_break"'\
    }
    execute if entity @s[tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_anger_break"'\
    }
