#> mhdp_monster_dino:core/util/models/break_leg_l
#
# 尻尾部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s add Mns.Break.Leg.R

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.leg_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.leg_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 63

    execute on passengers if entity @s[tag=aj.dino_aj.bone.leg_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.leg_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 64

    execute on passengers if entity @s[tag=aj.dino_aj.bone.leg_left_3] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.leg_left_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 65
