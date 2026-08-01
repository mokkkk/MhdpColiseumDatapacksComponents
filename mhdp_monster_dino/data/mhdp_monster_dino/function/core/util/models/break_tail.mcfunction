#> mhdp_monster_dino:core/util/models/break_tail
#
# 尻尾部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 尻尾
    # 通常時
        execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_2_break"'\
        }
        execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_3_break"'\
        }
        execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_break"'\
        }
    # 尻尾赤熱化
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_2_heat_break"'\
        }
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_3_heat_break"'\
        }
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_heat_break"'\
        }
    # 尻尾錆び
        execute if entity @s[tag=Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_2', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_2_rust_break"'\
        }
        execute if entity @s[tag=Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_3', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_3_rust_break"'\
        }
        execute if entity @s[tag=Mns.Dino.State.TailRust] run function animated_java_dino:dino/as_node {name: 'tail_4', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/tail_4_rust_break"'\
        }
