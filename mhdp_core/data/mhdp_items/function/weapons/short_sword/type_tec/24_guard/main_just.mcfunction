#> mhdp_items:weapons/short_sword/type_tec/24_guard/main_just
#
# ジャストガード メイン処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/24_guard/animation_0

# 移動制限
    effect give @s slowness 1 5 true

# 遷移
    # 右クリック：盾攻撃に移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] run function mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_counter
    # スニーク：ガードに移行
        execute if entity @s[tag=Ply.Ope.StartSneak] run function mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_guard

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/short_sword/type_tec/24_guard/end_just
