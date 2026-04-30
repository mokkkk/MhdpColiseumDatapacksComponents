#> mhdp_items:weapons/lance/type_tec/7_guard_dash/guard
#
# 溜めカウンター ガード時
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 演出
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# のけぞりが小さい場合、最小化して処理を中断
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..2 run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..2 run return 0

# のけぞりが大きい場合、ガードに移行
    # 前処理
        function mhdp_items:weapons/lance/util/before_attack
    # タグ付与
        tag @s remove Wpn.Lc.Tec.GuardDash
        tag @s remove Ply.Weapon.Guard
    # タイマー初期化
        scoreboard players set @s Wpn.GeneralTimer 0
    # 開始
        function mhdp_items:weapons/lance/type_tec/6_guard/start_from_guard_dash
