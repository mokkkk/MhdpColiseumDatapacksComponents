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
    execute if score @s Itm.Wirebug.GeneralTimer matches 1..8 positioned ~ ~1.4 ~ rotated as @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target,limit=1] run function mhdp_items:sp_items/wirebug/using/start_particle
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 run playsound minecraft:entity.breeze.jump master @a ~ ~ ~ 1 0.6
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 run playsound minecraft:entity.breeze.jump master @a ~ ~ ~ 1 0.5

# 移動
    execute if score @s Itm.Wirebug.GeneralTimer matches 9 run function mhdp_items:sp_items/wirebug/using/move

# 終了
    execute if score @s Itm.Wirebug.GeneralTimer matches 1..9 run tag @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target] remove Mk.Sp.Wirebug.Rotation.Target
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Itm.Wirebug.GeneralTimer matches 15.. run function mhdp_items:sp_items/wirebug/using/end
