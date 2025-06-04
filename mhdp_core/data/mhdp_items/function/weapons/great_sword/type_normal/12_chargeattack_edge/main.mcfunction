#> mhdp_items:weapons/great_sword/type_normal/12_chargeattack_edge/main
#
# 空中溜め斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"空中溜め斬り"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 unless block ~ ~-1 ~ #mhdp_core:no_collision rotated ~ 0 run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/effect_on_ground
    execute if score @s Wpn.AnimationTimer matches 1 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/particle
    execute if entity @s[tag=Ply.Weapon.HisStop] run tp @s @s
    
# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/12_chargeattack_edge/attack

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 6 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.AnimationTimer matches 1..3 run tp @s ~ ~ ~ ~ ~2

# 抜刀攻撃終了
    execute if score @s Wpn.GeneralTimer matches 5 run tag @s remove Ply.Flag.DrawAttack

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_normal/12_chargeattack_edge/end

# execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set @s Wpn.HitStopTimer 3