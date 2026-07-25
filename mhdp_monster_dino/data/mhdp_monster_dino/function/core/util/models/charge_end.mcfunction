#> mhdp_monster_dino:core/util/models/charge_end
#
# 喉赤熱化終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 頭
    # 通常
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/head_upper"'\
    }
    # 怒り
    execute if entity @s[tag=!Mns.Break.Head,tag=Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger"'\
    }
    # 部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_break"'\
    }
    # 怒り・部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_break"'\
    }

# 喉
    function animated_java_dino:dino/as_node {name: 'neck_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/neck_0"'\
    }
    function animated_java_dino:dino/as_node {name: 'neck_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/neck_1"'\
    }
    function animated_java_dino:dino/as_node {name: 'neck_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/neck_2"'\
    }
