#> mhdp_monster_valk:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink
#
# TODO: item_model の値は仮のプレースホルダ。AJ 再エクスポート後の実際のモデル名に差し替えること。

# モデル変更
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_blink"'\
    }
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_break_blink"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_anger_blink"'\
    }
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Head] run function animated_java_valk:valk/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/valk/head_upper_anger_break_blink"'\
    }
