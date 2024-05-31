#> mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/start
#
# ハンティングエッジ 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Gs.Normal.HuntingEdge
    tag @s add Ply.Flag.DrawAttack

# attribute設定
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1.0 add_value

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# 翔蟲演出
    playsound entity.player.levelup master @a ~ ~ ~ 1 2
    tag @s add Itm.Sp.Wirebug.UsedSkill
    scoreboard players set @s Itm.Wirebug.CoolTime 400

say 大剣・ハンティングエッジ