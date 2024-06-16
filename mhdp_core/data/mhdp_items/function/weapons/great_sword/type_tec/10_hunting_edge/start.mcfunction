#> mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/start
#
# ハンティングエッジ 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Tec.HuntingEdge
    tag @s add Ply.Flag.DrawAttack

# attribute設定
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# 翔蟲演出
    playsound entity.player.levelup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    tag @s add Itm.Sp.Wirebug.UsedSkill
    scoreboard players set @s Itm.Wirebug.CoolTime 400

say 大剣・ハンティングエッジ