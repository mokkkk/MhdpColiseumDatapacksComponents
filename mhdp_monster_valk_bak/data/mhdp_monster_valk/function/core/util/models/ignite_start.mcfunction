#> mhdp_monster_valk:core/util/models/ignite_start
#
# 翼点火時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 122
    execute if entity @s[tag=Mns.Break.Wing.R,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 128
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 134
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 140

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 123
    execute if entity @s[tag=Mns.Break.Wing.R,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 129
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 135
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 141

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.R,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 124
    execute if entity @s[tag=Mns.Break.Wing.R,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 130
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 136
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.R] on passengers if entity @s[tag=aj.valk_aj.bone.finger_right_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 142

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 125
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 131
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 137
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 143

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 126
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 132
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 138
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 144

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 127
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 133
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 139
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 145
