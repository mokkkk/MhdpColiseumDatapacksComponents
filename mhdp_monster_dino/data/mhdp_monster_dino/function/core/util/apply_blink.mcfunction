#> mhdp_monster_dino:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    # execute on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    # execute if entity @s[tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 6
    # execute if entity @s[tag=Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 8
