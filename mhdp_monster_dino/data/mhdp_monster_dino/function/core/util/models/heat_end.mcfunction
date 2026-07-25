#> mhdp_monster_dino:core/util/models/head_end
#
# 尻尾赤熱化開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 尻尾
    # 通常時
        execute if entity @s[tag=!Mns.Dino.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/tail_1"'\
        }
        execute if entity @s[tag=!Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/tail_2"'\
        }
        execute if entity @s[tag=!Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/tail_3"'\
        }
        execute if entity @s[tag=!Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/tail_4"'\
        }
    # 怒り
        execute if entity @s[tag=1Mns.Dino.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_anger"'\
        }
    # 部位破壊
        execute if entity @s[tag=Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_2_break"'\
        }
        execute if entity @s[tag=Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_3_break"'\
        }
        execute if entity @s[tag=Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_break"'\
        }
    # 部位破壊・切断
        execute if entity @s[tag=Mns.Break.Tail,tag=Mns.Break.Tail.Cut] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_break_cut"'\
        }
