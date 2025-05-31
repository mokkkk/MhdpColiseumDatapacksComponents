#> mhdp_items:weapons/short_sword/type_tec/24_guard/main
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
    execute if score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/short_sword/type_tec/24_guard/animation_0
    execute if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/short_sword/type_tec/24_guard/animation_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移  
    # 移動せず右クリック：ガード斬りに移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsKeyForward] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_guardslash
    # 前移動+右クリック：盾攻撃に移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsKeyForward] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_bash
    # ジャンプ：バックステップに移行
        execute if entity @s[tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_backstep

# 終了
    execute if entity @s[tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 10.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/short_sword/type_tec/24_guard/end
