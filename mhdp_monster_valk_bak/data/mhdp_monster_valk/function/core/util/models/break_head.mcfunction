#> mhdp_monster_valk:core/util/models/break_head
#
# 頭部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 78
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 79
