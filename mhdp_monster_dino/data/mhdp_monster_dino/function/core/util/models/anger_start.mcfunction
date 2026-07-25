#> mhdp_monster_dino:core/util/models/anger_start
#
# 怒り開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 頭
    # 通常
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger"'\
    }
    # 喉赤熱化
    execute if entity @s[tag=!Mns.Break.Head,tag=Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge"'\
    }
    # 部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_break"'\
    }
    # 喉赤熱化・部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge_break"'\
    }

# 胴体
    function animated_java_dino:dino/as_node {name: 'body_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/body_0_anger"'\
    }
    function animated_java_dino:dino/as_node {name: 'body_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/body_1_anger"'\
    }

# 尻尾
    # 共通
        function animated_java_dino:dino/as_node {name: 'tail_0', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_0_anger"'\
        }
    # 通常時
        execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_anger"'\
        }
    # 尻尾赤熱化
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_heat_anger"'\
        }
    # 尻尾錆び
        execute if entity @s[tag=Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_rust_anger"'\
        }
