#> mhdp_monster_valk:core/util/models/anger_start
#
# 怒り開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新
    tag @s add Mns.State.IsAnger

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 77
    execute if entity @s[tag=Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 79

    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 83
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 84
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 85

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 98
    execute if entity @s[tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 104
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 99
    execute if entity @s[tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 105
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 100
    execute if entity @s[tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 106
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 101
    execute if entity @s[tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 107
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 102
    execute if entity @s[tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 108
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 103
    execute if entity @s[tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 109

    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 116
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 117
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 118
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 119
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 120
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 121
