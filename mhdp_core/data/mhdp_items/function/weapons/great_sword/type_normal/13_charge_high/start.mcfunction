#> mhdp_items:weapons/great_sword/type_normal/13_charge_high/start
#
# 大溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.CrossCharge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# say 武器操作：大剣・大溜め