#> mhdp_items:weapons/long_sword/type_tec/15_red_foresight/start
#
# 見切り斬り・旋 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    tag @s add Wpn.Ls.Tec.RedForesight
    scoreboard players remove @s Wpn.Ls.SpiritLevelGauge 60

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
