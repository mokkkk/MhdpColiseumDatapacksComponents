#> mhdp_items:weapons/bow/type_tec/12_targetting_shot/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/12_targetting_shot/main

# ターゲットがない場合、ただの射撃
    execute if score @s Wpn.Bw.Bottle.Targetting matches ..0 run return run function mhdp_items:weapons/bow/type_tec/12_targetting_shot/attack_normal

# ビン消費
    scoreboard players operation @s Wpn.Bw.Bottle.Count -= @s Wpn.Bw.Bottle.Targetting

# 矢を召喚
    scoreboard players set #mhdp_temp_start_rotation MhdpCore -10
    execute store result storage mhdp_core:temp Temp.StartRotation int 1 run scoreboard players operation #mhdp_temp_start_rotation MhdpCore *= @s Wpn.Bw.Bottle.Targetting
    function mhdp_items:weapons/bow/type_tec/12_targetting_shot/attack_loop.m with storage mhdp_core:temp Temp
 
# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_tec/12_targetting_shot/particle
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

# ゲージ消費
    tag @s remove Ply.Weapon.UsingArts.2
    scoreboard players set @s Ply.Stats.Arts.2 0
    scoreboard players set @s Ply.Stats.Arts.2.Percent 0

# 対象解放
    data remove storage mhdp_core:temp PlayerData.Bow.TargetUidList
    function mhdp_core:player/data/save_data

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
    scoreboard players set @s Wpn.Bw.Bottle.Targetting 0
