#> mhdp_items:sp_items/wirebug/using/tick
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# タイマー増加
    scoreboard players add @s Itm.Wirebug.GeneralTimer 1

# 開始
    execute if score @s Itm.Wirebug.GeneralTimer matches 1 run function mhdp_items:sp_items/wirebug/using/start_move

# 紐づけ
    execute if score @s Itm.Wirebug.GeneralTimer matches 1..9 run function mhdp_items:sp_items/wirebug/using/get_target_marker

# 演出
    execute if score @s Itm.Wirebug.GeneralTimer matches 1 run playsound item.trident.throw master @a ~ ~ ~ 2 1.8
    execute if score @s Itm.Wirebug.GeneralTimer matches 1 run playsound minecraft:entity.breeze.shoot master @a ~ ~ ~ 1 1.8
    execute if score @s Itm.Wirebug.GeneralTimer matches 1..3 positioned ~ ~1.4 ~ rotated as @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target,limit=1] run function mhdp_items:sp_items/wirebug/using/particle_0
    execute if score @s Itm.Wirebug.GeneralTimer matches 4..8 positioned ~ ~1.4 ~ rotated as @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target,limit=1] run function mhdp_items:sp_items/wirebug/using/particle_1
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 run playsound minecraft:entity.breeze.jump master @a ~ ~ ~ 1 0.7
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 run playsound minecraft:entity.breeze.jump master @a ~ ~ ~ 1 0.5
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 unless block ~ ~-1 ~ #mhdp_core:no_collision run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 30
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 unless block ~ ~-1 ~ #mhdp_core:no_collision run playsound block.grass.step master @a ~ ~ ~ 2 1

# 移動
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 run function mhdp_items:sp_items/wirebug/using/move
    execute if score @s Itm.Wirebug.GeneralTimer matches 13..18 if block ~ ~-1 ~ #mhdp_core:no_collision run attribute @s generic.gravity modifier remove f-f-f-b-1
    execute if score @s Itm.Wirebug.GeneralTimer matches 19 run attribute @s generic.gravity modifier remove f-f-f-b-1

# 終了
    execute if score @s Itm.Wirebug.GeneralTimer matches 1..9 run tag @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target] remove Mk.Sp.Wirebug.Rotation.Target
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Itm.Wirebug.GeneralTimer matches 19.. run function mhdp_items:sp_items/wirebug/using/end
