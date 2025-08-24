#> mhdp_items:weapons/bow/type_normal/12_targetting_shot/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/12_targetting_shot/main

# 矢を召喚
    scoreboard players set @s Wpn.Bw.Bottle.Targetting 6
    scoreboard players set #mhdp_temp_start_rotation MhdpCore -10
    execute store result storage mhdp_core:temp Temp.StartRotation int 1 run scoreboard players operation #mhdp_temp_start_rotation MhdpCore *= @s Wpn.Bw.Bottle.Targetting
    function mhdp_items:weapons/bow/type_normal/12_targetting_shot/attack_loop.m with storage mhdp_core:temp Temp
 
# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_normal/12_targetting_shot/particle

# ゲージ消費
    tag @s remove Ply.Weapon.UsingArts.2
    scoreboard players set @s Ply.Stats.Arts.2 0
    scoreboard players set @s Ply.Stats.Arts.2.Percent 0

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
    scoreboard players set @s Wpn.Bw.Bottle.Targetting 0
