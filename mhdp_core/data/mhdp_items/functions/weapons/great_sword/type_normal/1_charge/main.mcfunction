#> mhdp_items:weapons/great_sword/type_normal/1_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @s ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_normal/1_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/1_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/1_charge/animation_2

# 移動制限
    effect give @s slowness 1 3 true

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_normal/1_charge/end
