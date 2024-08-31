#> mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/main
#
# 真溜め斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_4
    execute if score @s Wpn.AnimationTimer matches 8..12 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_5
    execute if score @s Wpn.AnimationTimer matches 5 rotated ~ 0 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/effect_on_ground_pre
    execute if score @s Wpn.AnimationTimer matches 1 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/particle_pre
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/particle_pre
    execute if score @s Wpn.GeneralTimer matches 12 run scoreboard players set @s Wpn.AnimationTimer 12
    execute if score @s Wpn.AnimationTimer matches 17 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score @s Wpn.AnimationTimer matches 17 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 17 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_0
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_1
    execute if score @s Wpn.AnimationTimer matches 19 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_2
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/animation_3
    execute if score @s Wpn.AnimationTimer matches 20 rotated ~ 0 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/effect_on_ground
    execute if score @s Wpn.AnimationTimer matches 17 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/particle
    execute if score @s Wpn.AnimationTimer matches 18 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/attack_0
    execute if score @s Wpn.GeneralTimer matches 19 run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/attack_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 3 5 true

# 抜刀攻撃終了
    execute if score @s Wpn.GeneralTimer matches 5 run tag @s remove Ply.Flag.DrawAttack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~0.05 ~
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 12000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 12 run tp @s ~ ~0.05 ~
    execute if score @s Wpn.GeneralTimer matches 12 run scoreboard players set $strength delta.api.launch 6000
    execute if score @s Wpn.GeneralTimer matches 12 rotated ~ 0 run function delta:api/launch_looking
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 16 run tp @s ~ ~0.05 ~
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 16 run scoreboard players set $strength delta.api.launch 6000
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 16 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.AnimationTimer matches 20 run tp @s @s
    execute if score @s Wpn.AnimationTimer matches 20 run scoreboard players set $strength delta.api.launch 3000
    execute if score @s Wpn.AnimationTimer matches 20 rotated ~ -60 run function delta:api/launch_looking

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~ ~2
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 10..15 run tp @s ~ ~ ~ ~ ~-0.8
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 18..20 run tp @s ~ ~ ~ ~ ~2

# 終了
    execute if score @s Wpn.GeneralTimer matches 60.. run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/end
