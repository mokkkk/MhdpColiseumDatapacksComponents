#> mhdp_monster_valk:core/util/models/anger_end
#
# 怒り終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新
    tag @s remove Mns.State.IsAnger

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 76
    execute if entity @s[tag=Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 78

    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 80
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 81
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.neck_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 82

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 86
    execute if entity @s[tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 92
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 87
    execute if entity @s[tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 93
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 88
    execute if entity @s[tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 94
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 89
    execute if entity @s[tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 95
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 90
    execute if entity @s[tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 96
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 91
    execute if entity @s[tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 97

    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 110
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 111
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 112
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 113
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 114
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.leg_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 115
