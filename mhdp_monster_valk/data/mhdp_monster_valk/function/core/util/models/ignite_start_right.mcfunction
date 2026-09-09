#> mhdp_monster_valk:core/util/models/ignite_start_right
#
# 翼点火時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink
#
# TODO: item_model の値は仮のプレースホルダ。AJ 再エクスポート後の実際の aj_sub / blueprint モデル名に差し替えること。

# モデル変更
    execute if entity @s[tag=!Mns.Break.Wing.R,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_ignite"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.R,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_ignite_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_ignite_anger"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_ignite_anger_break"'\
    }

    execute if entity @s[tag=!Mns.Break.Wing.R,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_ignite"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.R,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_ignite_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_ignite_anger"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_ignite_anger_break"'\
    }

    execute if entity @s[tag=!Mns.Break.Wing.R,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_ignite"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.R,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_ignite_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_ignite_anger"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_ignite_anger_break"'\
    }

