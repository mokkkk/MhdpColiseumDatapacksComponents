#> mhdp_monster_dino:core/util/models/heat_start
#
# 尻尾赤熱化開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s add Mns.Dino.State.TailHeat

# 部位ID更新
    scoreboard players set @e[type=slime,tag=Mns.HitBox.Dino.Tail] Mns.Hitbox.PartId 6

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 34
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 38

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 35
    execute if entity @s[tag=Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 52

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 36
    execute if entity @s[tag=Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 53

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 37
    execute if entity @s[tag=Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 54
    execute if entity @s[tag=Mns.Break.Tail.Cut] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 55