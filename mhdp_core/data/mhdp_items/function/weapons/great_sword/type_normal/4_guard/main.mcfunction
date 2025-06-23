#> mhdp_items:weapons/great_sword/type_normal/4_guard/main
#
# ガード メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ガード"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/great_sword/type_tec/4_guard/animation_0
    execute if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/great_sword/type_tec/4_guard/animation_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # 右クリック長押し時、大溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/start

# 終了
    execute if entity @s[tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 5.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/great_sword/type_normal/4_guard/end
