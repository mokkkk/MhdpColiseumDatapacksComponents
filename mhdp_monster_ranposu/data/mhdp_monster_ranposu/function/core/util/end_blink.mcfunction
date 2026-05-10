#> mhdp_monster_ranposu:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# say TODO: mhdp_monster_ranposu:core/util/end_blink

# モデル変更
    execute if entity @s[tag=!Mns.Break.Head] run function animated_java:ranposu/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java:blueprint/ranposu/head_upper"'\
    }
    execute if entity @s[tag=Mns.Break.Head] run function animated_java:ranposu/as_node {name: 'head_upper', command: \
        'data modify entity @s item.components."minecraft:item_model" set value "animated_java:blueprint/ranposu/head_upper_break"'\
    }
