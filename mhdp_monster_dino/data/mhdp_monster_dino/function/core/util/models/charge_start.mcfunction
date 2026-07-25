#> mhdp_monster_dino:core/util/models/charge_start
#
# 喉赤熱化開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 頭
    # 通常
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge"'\
    }
    # 怒り
    execute if entity @s[tag=!Mns.Break.Head,tag=Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge"'\
    }
    # 部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge_break"'\
    }
    # 怒り・部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge_break"'\
    }

# 喉
    function animated_java_dino:dino/as_node {name: 'neck_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/neck_0_charge"'\
    }
    function animated_java_dino:dino/as_node {name: 'neck_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/neck_1_charge"'\
    }
    function animated_java_dino:dino/as_node {name: 'neck_2', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/neck_2_charge"'\
    }
