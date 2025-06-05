#> mhdp_items:weapons/bow/type_tec/3_shot_max/start
#
# 射撃 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Tec.Shot.Max
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 80

# say 武器操作：弓 射撃(最大溜め)