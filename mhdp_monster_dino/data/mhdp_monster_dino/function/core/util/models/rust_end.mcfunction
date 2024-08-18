#> mhdp_monster_dino:core/util/models/rust_end
#
# 尻尾赤熱化開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s remove Mns.Dino.State.TailRust

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 19
    execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 14

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 31
    execute if entity @s[tag=Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 48

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 32
    execute if entity @s[tag=Mns.Break.Tail] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 49

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 33
    execute if entity @s[tag=Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 50
    execute if entity @s[tag=Mns.Break.Tail.Cut] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 51

# カウントリセット
    scoreboard players set @s Mns.Dino.PhaseCount.Tail 0
