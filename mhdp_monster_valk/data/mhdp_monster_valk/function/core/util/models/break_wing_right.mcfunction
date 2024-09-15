#> mhdp_monster_valk:core/util/models/break_wing_right
#
# 右翼部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 92
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 104
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 93
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 105
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 94
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 106
