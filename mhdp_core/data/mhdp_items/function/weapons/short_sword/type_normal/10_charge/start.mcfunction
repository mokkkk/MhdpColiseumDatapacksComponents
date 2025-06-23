#> mhdp_items:weapons/short_sword/type_normal/10_charge/start
#
# 剣コンボ1 開始
#
# @within mhdp_items:weapons/short_sword/type_normal/main

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.Charge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Ss.ChargeTimer 0
    scoreboard players set @s Wpn.Ss.ChargeCount 0

# say 武器操作：片手剣 溜め