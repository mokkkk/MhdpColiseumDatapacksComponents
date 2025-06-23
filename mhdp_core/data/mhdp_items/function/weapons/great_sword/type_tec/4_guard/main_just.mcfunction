#> mhdp_items:weapons/great_sword/type_tec/4_guard/end_just
#
# ガード メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ジャストガード"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/4_guard/animation_0
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/4_guard/animation_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartDoubleJump] if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:core/buffering/jump

# 遷移  
    # 右クリック長押し：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/great_sword/type_tec/1_charge/start
    # スニーク+右クリック長押し：相殺斬り上げ・溜めに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/great_sword/type_tec/4_guard/change_to_upper_charge
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] run function mhdp_items:weapons/short_sword/util/move_jump

# 終了
    execute if entity @s[tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 10.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/great_sword/type_tec/4_guard/end_just

