#> mhdp_monster_dino:core/util/models/anger_end
#
# 怒り終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 頭
    # 通常
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/head_upper"'\
    }
    # 喉赤熱化
    execute if entity @s[tag=!Mns.Break.Head,tag=Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge"'\
    }
    # 部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_break"'\
    }
    # 喉赤熱化・部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge_break"'\
    }

# 胴体
    function animated_java_dino:dino/as_node {name: 'body_0', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/body_0"'\
    }
    function animated_java_dino:dino/as_node {name: 'body_1', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/body_1"'\
    }

# 尻尾
    # 共通
        function animated_java_dino:dino/as_node {name: 'tail_0', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/tail_0"'\
        }
    # 通常時
        execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/tail_1"'\
        }
    # 尻尾赤熱化
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_heat"'\
        }
    # 尻尾錆び
        execute if entity @s[tag=Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_rust"'\
        }
