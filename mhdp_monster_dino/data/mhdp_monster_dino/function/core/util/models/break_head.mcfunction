#> mhdp_monster_dino:core/util/models/break_head
#
# 頭部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 頭
    # 通常
        execute if entity @s[tag=!Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_break"'\
        }
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_break"'\
        }
    # 喉赤熱化
        execute if entity @s[tag=!Mns.State.IsAnger,tag=Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge_break"'\
        }
    # 怒り・喉赤熱化
        execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
            'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge_break"'\
        }
