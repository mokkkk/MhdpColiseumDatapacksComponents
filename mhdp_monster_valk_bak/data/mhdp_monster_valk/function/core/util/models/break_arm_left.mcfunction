#> mhdp_monster_valk:core/util/models/break_arm_left
#
# 左腕部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.arm_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.arm_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 150
    execute on passengers if entity @s[tag=aj.valk_aj.bone.arm_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.arm_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 151
