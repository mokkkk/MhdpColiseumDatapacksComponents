#> mhdp_items:weapons/bow/type_tec/12_targetting_shot/attack_normal
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/12_targetting_shot/main

# 矢を召喚
    function mhdp_items:weapons/bow/shot/normal/summon_0

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
