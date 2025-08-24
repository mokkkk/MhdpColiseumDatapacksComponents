#> mhdp_items:weapons/short_sword/type_tec/31_blade_dance/main
#
# ブレイドダンス メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ブレイドダンス"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    # 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_3
    # 2
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_4
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_5
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_6
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_7
    # 3
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_8
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_9
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_10
    execute if score @s Wpn.AnimationTimer matches 20 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_11
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_12
    # 4
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_13
    execute if score @s Wpn.AnimationTimer matches 23 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_14
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_15
    execute if score @s Wpn.AnimationTimer matches 26 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_16
    # 5
    execute if score @s Wpn.AnimationTimer matches 28 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_17
    execute if score @s Wpn.AnimationTimer matches 29 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_18
    execute if score @s Wpn.AnimationTimer matches 30 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_19
    execute if score @s Wpn.AnimationTimer matches 31 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_20
    # 6
    execute if score @s Wpn.AnimationTimer matches 34 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_21
    execute if score @s Wpn.AnimationTimer matches 35 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_22
    execute if score @s Wpn.AnimationTimer matches 36 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_23
    execute if score @s Wpn.AnimationTimer matches 37 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_24
    # 7
    execute if score @s Wpn.AnimationTimer matches 40 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_25
    execute if score @s Wpn.AnimationTimer matches 43 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_26
    execute if score @s Wpn.AnimationTimer matches 44 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_27
    # 8-9
    execute if score @s Wpn.AnimationTimer matches 50 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_28
    execute if score @s Wpn.AnimationTimer matches 55 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_29
    execute if score @s Wpn.AnimationTimer matches 57 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/animation_30

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_0
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_1
    execute if score @s Wpn.GeneralTimer matches 16 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_2
    execute if score @s Wpn.GeneralTimer matches 23 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_3
    execute if score @s Wpn.GeneralTimer matches 29 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_4
    execute if score @s Wpn.GeneralTimer matches 35 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_5
    execute if score @s Wpn.GeneralTimer matches 43 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_6
    execute if score @s Wpn.GeneralTimer matches 55 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_7
    execute if score @s Wpn.GeneralTimer matches 58 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_8

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-1 ~2
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~2 ~-1.8
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5..6 run tp @s ~ ~ ~ ~0.3 ~-0.5

    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 10..12 run tp @s ~ ~ ~ ~1.3 ~

    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 13..14 at @s run tp @s ~ ~ ~ ~1 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 15..18 at @s run tp @s ~ ~ ~ ~-2 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 19..21 at @s run tp @s ~ ~ ~ ~-0.6 ~-2
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 22..25 at @s run tp @s ~ ~ ~ ~2 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 26..28 at @s run tp @s ~ ~ ~ ~-1 ~0.5

    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 29..30 run tp @s ~ ~ ~ ~2 ~-2
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 28..31 run tp @s ~ ~ ~ ~-0.8 ~0.1
    
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 34..37 at @s run tp @s ~ ~ ~ ~1 ~
    
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 40..43 at @s run tp @s ~ ~ ~ ~-1 ~-0.5

    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 50..52 at @s run tp @s ~ ~ ~ ~-2 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 55..56 at @s run tp @s ~ ~ ~ ~4 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 57..58 at @s run tp @s ~ ~ ~ ~0.5 ~0.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 12000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -5 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 27 run scoreboard players set $strength player_motion.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 27 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 33 run scoreboard players set $strength player_motion.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 33 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 42 run scoreboard players set $strength player_motion.api.launch 5000
    execute if score @s Wpn.GeneralTimer matches 42 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 55 run scoreboard players set $strength player_motion.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 55 rotated ~170 0 run function player_motion:api/launch_looking

# 終了
    execute if score @s Wpn.GeneralTimer matches 75.. run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/end
