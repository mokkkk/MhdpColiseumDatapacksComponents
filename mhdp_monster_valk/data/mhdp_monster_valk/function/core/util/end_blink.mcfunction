#> mhdp_monster_valk:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# モデル変更
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java_valk:blueprint/valk/head_upper"'\
    }
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_break"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_anger"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Head] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_anger_break"'\
    }
