#> mhdp_items:weapons/great_sword/type_normal/34_rage_attack/main
#
# 震怒竜怨斬 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"震怒竜怨斬"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.9
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/animation_6
    execute if score @s Wpn.AnimationTimer matches 10 rotated ~ 0 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/effect_on_ground
    execute if score @s Wpn.GeneralTimer matches 8 positioned ^ ^2 ^3 rotated ~ ~-60 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/particle
    execute if score @s Wpn.GeneralTimer matches 9 positioned ^ ^0.5 ^3 rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/particle
    execute if score @s Wpn.GeneralTimer matches 10 positioned ^ ^-1 ^3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 9 positioned ^ ^0.5 ^ run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/attack
    execute if score @s Wpn.GeneralTimer matches 11 if score @s Wpn.Gs.ChargeCount matches 2.. run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 13 if score @s Wpn.Gs.ChargeCount matches 3.. run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/attack_pursuit

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 9 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~ ~-2
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..9 run tp @s ~ ~ ~ ~ ~2
 
# 終了
    execute if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/great_sword/type_normal/34_rage_attack/end
