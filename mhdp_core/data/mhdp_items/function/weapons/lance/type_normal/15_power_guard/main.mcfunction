#> mhdp_items:weapons/lance/type_tec/15_power_guard/main
#
# パワーガード メイン処理
#
# @within function mhdp_items:weapons/lance/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"パワーガード"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 5 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.GeneralTimer matches 5 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/lance/type_tec/15_power_guard/animation_0
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/lance/type_tec/15_power_guard/animation_1
    execute if score @s Wpn.GeneralTimer matches 5.. if score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/15_power_guard/animation_2
    execute if score @s Wpn.GeneralTimer matches 5.. if score @s Wpn.GuardStopTimer matches 0 run function mhdp_items:weapons/lance/type_tec/15_power_guard/animation_1
    

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}

# スタミナ消費
    execute if score @s Wpn.GuardStopTimer matches 0 run scoreboard players remove @s Ply.Stats.Stamina 10

# 遷移 
    # 右クリック解除またはスタミナ切れ：渾身返し突きに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 10.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/15_power_guard/change_to_counter
        execute if score @s Wpn.GeneralTimer matches 10.. if score @s Ply.Stats.Stamina matches ..1 run function mhdp_items:weapons/lance/type_tec/15_power_guard/change_to_counter
