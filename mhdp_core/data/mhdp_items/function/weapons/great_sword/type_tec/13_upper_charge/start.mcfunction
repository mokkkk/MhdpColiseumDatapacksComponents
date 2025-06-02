#> mhdp_items:weapons/great_sword/type_tec/13_upper_charge/start
#
# 相殺斬り上げ・溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.UpperCharge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0

# say 武器操作：大剣・相殺斬り上げ・溜め