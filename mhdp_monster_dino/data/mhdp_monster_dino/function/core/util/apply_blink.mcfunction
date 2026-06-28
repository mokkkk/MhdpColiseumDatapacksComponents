#> mhdp_monster_dino:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# say TODO: mhdp_monster_dino:core/util/apply_blink

# # モデル変更
#     execute if entity @s[tag=!Mns.Break.Head] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
#         'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_blink"'\
#     }
#     execute if entity @s[tag=Mns.Break.Head] run function animated_java_dino:dino/as_node {name: 'head_upper', command: \
#         'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/dino/head_upper_break_blink"'\
#     }
