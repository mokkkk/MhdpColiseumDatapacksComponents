#> mhdp_monster_dino:core/util/models/anger_start
#
# 尻尾赤熱化開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s remove Mns.Dino.State.TailHeat
    tag @s add Mns.Dino.State.TailRust

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 39
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 43

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 40

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 41

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 42
