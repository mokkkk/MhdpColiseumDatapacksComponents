#> mhdp_items:weapons/great_sword/type_tec/4_guard/main
#
# ガード メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/great_sword/type_tec/4_guard/animation_1
    execute if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/great_sword/type_tec/4_guard/animation_0

# 移動制限
    effect give @s slowness 1 5 true

# 遷移
    # 右クリック長押し時、相殺斬り上げ・溜めに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 10.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/great_sword/type_tec/4_guard/change_to_upper_charge

# 終了
    execute if entity @s[tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 10.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/great_sword/type_tec/4_guard/end
