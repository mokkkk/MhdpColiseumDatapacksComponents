#> mhdp_monster_dino:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# モデル変更
    # 通常
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_dino:blueprint/dino/head_upper"'\
    }
    # 怒り
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger"'\
    }
    # 喉赤熱化
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge"'\
    }
    # 怒り・喉赤熱化
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.State.IsAnger,tag=!Mns.Break.Head] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge"'\
    }
    # 頭部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_break"'\
    }
    # 怒り・頭部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_break"'\
    }
    # 喉赤熱・頭部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge_break"'\
    }
    # 怒り・喉赤熱化・頭部位破壊
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.State.IsAnger,tag=Mns.Break.Head] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge_break"'\
    }
