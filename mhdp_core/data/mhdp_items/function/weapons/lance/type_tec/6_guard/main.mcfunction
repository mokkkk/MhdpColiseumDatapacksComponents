#> mhdp_items:weapons/lance/type_tec/6_guard/main
#
# ガード メイン処理
#
# @within function mhdp_items:weapons/lance/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ガード"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/6_guard/animation_0
    execute if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/lance/type_tec/6_guard/animation_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_move_veryslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動入力中、わずかにスタミナ回復
    execute unless entity @s[tag=!Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] if score @s Wpn.GuardStopTimer matches 0 if score @s Ply.Stats.Stamina matches ..999 run scoreboard players add @s Ply.Stats.Stamina 3

# 狩技遷移
    # execute if score @s Wpn.GeneralTimer matches 3.. run function mhdp_items:core/buffering/arts_main
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 遷移  
    # ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/6_guard/change_to_guard_dash
    # 左クリック：突進に移行
        execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/6_guard/change_to_spear
    # 右クリック：溜めカウンターに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 3.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/6_guard/change_to_charge_counter

# 終了
    execute if entity @s[tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 10.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/lance/type_tec/6_guard/end
