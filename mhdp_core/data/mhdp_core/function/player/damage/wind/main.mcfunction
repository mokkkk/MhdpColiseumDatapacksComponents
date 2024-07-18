#> mhdp_core:player/damage/wind/main
#
# モンスターからプレイヤーに対してのダメージ処理
#
# @within function mhdp_monsters:**
# @input
#        storage mhdp_core:temp Damage.WindValue 風圧の強さ
#        storage mhdp_core:temp Damage.GuardValue 威力値

# 処理の中断
    # プレイヤー以外が実行者の場合
        execute unless entity @s[type=player] run return 0
    # 無敵時間
        execute if score @s Ply.Timer.DamageInterval matches 1.. run return 0
    # フレーム回避
        execute if score @s Ply.Timer.Avoid matches 1.. at @s run return run function mhdp_core:player/damage/entity_to_player/avoid/main

# ダメージ適用
    # 適用
        function mhdp_core:player/damage/wind/apply
