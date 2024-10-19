#> mhdp_items:weapons/short_sword/type_normal/10_charge/start
#
# 剣コンボ1 開始
#
# @within mhdp_items:weapons/short_sword/type_normal/main

# タグ付与
    tag @s add Wpn.Ss.Normal.Charge

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# その他初期化
    scoreboard players set @s Wpn.Ss.ChargeTimer 0
    scoreboard players set @s Wpn.Ss.ChargeCount 0

# say 武器操作：片手剣 溜め