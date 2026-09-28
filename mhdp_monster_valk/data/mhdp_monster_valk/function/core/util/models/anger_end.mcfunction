#> mhdp_monster_valk:core/util/models/anger_end
#
# 怒り終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink
#
# TODO: item_model の値は仮のプレースホルダ。AJ 再エクスポート後の実際の aj_sub / blueprint モデル名に差し替えること。

# モデル変更 (Mns.State.IsAnger タグは end_anger.m 側で除去済み)
    execute if entity @s[tag=!Mns.Break.Head] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/head_upper"'\
    }
    execute if entity @s[tag=Mns.Break.Head] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_break"'\
    }

    function animated_java_valk:valk/as_node {name: 'neck_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/neck_0"'\
    }
    function animated_java_valk:valk/as_node {name: 'neck_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/neck_1"'\
    }
    function animated_java_valk:valk/as_node {name: 'neck_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/neck_2"'\
    }

    execute if entity @s[tag=!Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/finger_right_0"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_0_break"'\
    }
    execute if entity @s[tag=!Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/finger_right_1"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_1_break"'\
    }
    execute if entity @s[tag=!Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/finger_right_2"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.R] run function animated_java_valk:valk/as_node {name: 'finger_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_right_2_break"'\
    }

    execute if entity @s[tag=!Mns.Break.Wing.L] run function animated_java_valk:valk/as_node {name: 'finger_left_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/finger_left_0"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.L] run function animated_java_valk:valk/as_node {name: 'finger_left_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_left_0_break"'\
    }
    execute if entity @s[tag=!Mns.Break.Wing.L] run function animated_java_valk:valk/as_node {name: 'finger_left_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/finger_left_1"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.L] run function animated_java_valk:valk/as_node {name: 'finger_left_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_left_1_break"'\
    }
    execute if entity @s[tag=!Mns.Break.Wing.L] run function animated_java_valk:valk/as_node {name: 'finger_left_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/finger_left_2"'\
    }
    execute if entity @s[tag=Mns.Break.Wing.L] run function animated_java_valk:valk/as_node {name: 'finger_left_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/finger_left_2_break"'\
    }

    function animated_java_valk:valk/as_node {name: 'leg_right_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/leg_right_0"'\
    }
    function animated_java_valk:valk/as_node {name: 'leg_right_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/leg_right_1"'\
    }
    function animated_java_valk:valk/as_node {name: 'leg_right_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/leg_right_2"'\
    }
    function animated_java_valk:valk/as_node {name: 'leg_left_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/leg_left_0"'\
    }
    function animated_java_valk:valk/as_node {name: 'leg_left_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/leg_left_1"'\
    }
    function animated_java_valk:valk/as_node {name: 'leg_left_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/leg_left_2"'\
    }
