#> mhdp_monster_dino:core/util/models/break_tail
#
# 尻尾部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s add Mns.Break.Tail

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 48
    execute if entity @s[tag=Mns.Dino.State.TailHeat] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 52
    execute if entity @s[tag=Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 56

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 49
    execute if entity @s[tag=Mns.Dino.State.TailHeat] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 53
    execute if entity @s[tag=Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 57

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 50
    execute if entity @s[tag=Mns.Dino.State.TailHeat] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 54
    execute if entity @s[tag=Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_4] run data modify entity @s item.components."minecraft:custom_model_data" set value 58
