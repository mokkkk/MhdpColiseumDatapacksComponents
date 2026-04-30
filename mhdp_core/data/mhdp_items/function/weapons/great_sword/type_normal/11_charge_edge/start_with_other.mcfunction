#> mhdp_items:weapons/great_sword/type_normal/11_charge_edge/start_with_other
#
# 空中溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/change_to_charge

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge.Edge
    tag @s remove Ply.Weapon.NoOpe

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# 移動
    tp @s @s
    execute rotated ~ -90 run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:true, IsAdjust:false}

# say 武器操作：大剣・空中溜め