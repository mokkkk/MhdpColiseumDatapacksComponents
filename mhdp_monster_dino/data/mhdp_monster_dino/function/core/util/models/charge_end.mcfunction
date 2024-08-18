#> mhdp_monster_dino:core/util/models/charge_end
#
# 喉赤熱化終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s remove Mns.Dino.State.HeadHeat

# 部位ID更新
    scoreboard players set @e[type=slime,tag=Mns.HitBox.Dino.Head] Mns.Hitbox.PartId 0
    
# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 15
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 44
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 10
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 45

    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_lower] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_lower] run data modify entity @s item.components."minecraft:custom_model_data" set value 26

    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 27

    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 28

    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 29
