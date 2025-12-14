#> mhdp_items:weapons/great_sword/type_normal/21_charge_air/start_with_other
#
# 空中溜め 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/change_to_charge

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.Charge.Air
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Ope.IsAir

# その他初期化
    scoreboard players set @s Wpn.Gs.ChargeTimer 0
    scoreboard players set @s Wpn.Gs.ChargeCount 0
    scoreboard players set @s Wpn.Gs.ChargeSlashCount 0

# 移動
    scoreboard players set $strength player_motion.api.launch 6000
    execute rotated ~ -90 run function player_motion:api/launch_looking

# say 武器操作：大剣・空中溜め