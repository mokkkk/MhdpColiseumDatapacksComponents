#> mhdp_items:weapons/short_sword/type_normal/24_guard/main
#
# ガード メイン処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ガード"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/short_sword/type_normal/24_guard/animation_0

# 移動制限
    effect give @s slowness 1 5 true

# 遷移
    # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] unless score @s Wpn.GuardStopTimer matches 3.. run function mhdp_items:weapons/short_sword/type_normal/24_guard/change_to_charge

# 終了
    execute if entity @s[tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 10.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/short_sword/type_normal/24_guard/end
