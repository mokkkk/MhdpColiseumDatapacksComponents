#> mhdp_monster_dino:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    # 通常
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_blink"'\
    }
    # 怒り
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_blink"'\
    }
    # 喉赤熱化
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge_blink"'\
    }
    # 怒り・喉赤熱化
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.State.IsAnger,tag=!Mns.Break.Head] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge_blink"'\
    }
    # 頭部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_break_blink"'\
    }
    # 怒り・頭部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_break_blink"'\
    }
    # 喉赤熱・頭部位破壊
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_charge_break_blink"'\
    }
    # 怒り・喉赤熱化・頭部位破壊
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.State.IsAnger,tag=Mns.Break.Head] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_anger_charge_break_blink"'\
    }
