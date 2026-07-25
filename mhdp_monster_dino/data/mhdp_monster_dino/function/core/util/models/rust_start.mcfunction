#> mhdp_monster_dino:core/util/models/rust_start
#
# 尻錆び開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 尻尾
    # 通常時
        execute if entity @s[tag=!Mns.Dino.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_rust"'\
        }
        execute if entity @s[tag=!Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_2_rust"'\
        }
        execute if entity @s[tag=!Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_3_rust"'\
        }
        execute if entity @s[tag=!Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_rust"'\
        }
    # 怒り
        execute if entity @s[tag=1Mns.Dino.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'tail_1', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_1_rust_anger"'\
        }
    # 部位破壊
        execute if entity @s[tag=Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_2_rust_break"'\
        }
        execute if entity @s[tag=Mns.Break.Tail] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_3_rust_break"'\
        }
        execute if entity @s[tag=Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_rust_break"'\
        }
    # 部位破壊・切断
        execute if entity @s[tag=Mns.Break.Tail,tag=Mns.Break.Tail.Cut] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_rust_break_cut"'\
        }
