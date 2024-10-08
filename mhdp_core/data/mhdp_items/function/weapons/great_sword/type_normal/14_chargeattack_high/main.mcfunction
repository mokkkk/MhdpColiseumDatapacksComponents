#> mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/main
#
# 大溜め斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 rotated ~ 0 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/effect_on_ground
    execute if score @s Wpn.AnimationTimer matches 1 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/attack
    execute if score @s Wpn.GeneralTimer matches 6 if score @s Wpn.Gs.ChargeCount matches 3.. run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/attack_pursuit

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 2 3 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~0.05 ~
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s ~ ~0.05 ~
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength delta.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.AnimationTimer matches 4 if score @s Wpn.Gs.ChargeCount matches 3.. run tp @s ~ ~0.05 ~
    execute if score @s Wpn.AnimationTimer matches 4 if score @s Wpn.Gs.ChargeCount matches 3.. run scoreboard players set $strength delta.api.launch 3000
    execute if score @s Wpn.AnimationTimer matches 4 if score @s Wpn.Gs.ChargeCount matches 3.. rotated ~ -60 run function delta:api/launch_looking

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~ ~2

# 終了
    execute if score @s Wpn.GeneralTimer matches 55.. run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/end
