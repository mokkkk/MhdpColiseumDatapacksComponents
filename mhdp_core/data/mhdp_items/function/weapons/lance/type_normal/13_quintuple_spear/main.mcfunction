#> mhdp_items:weapons/lance/type_normal/13_quintuple_spear/main
#
# 3連突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"５連突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 9 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 14 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 19 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 19 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 20 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_4
    
    execute if score @s Wpn.AnimationTimer matches 21 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 29..32 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 29..31 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.GeneralTimer matches 35 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 32 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 33 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_7
    execute if score @s Wpn.AnimationTimer matches 34 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_8
    execute if score @s Wpn.AnimationTimer matches 35 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_9
    execute if score @s Wpn.AnimationTimer matches 37 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_10
    execute if score @s Wpn.AnimationTimer matches 43 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/animation_11
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/attack_0
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/attack_1
    execute if score @s Wpn.GeneralTimer matches 14 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/attack_2
    execute if score @s Wpn.GeneralTimer matches 19 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/attack_3

    execute if score @s Wpn.GeneralTimer matches 35 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/attack_4
    execute if score @s Wpn.GeneralTimer matches 37 run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/attack_5

# 移動
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 14 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}

    execute if score @s Wpn.GeneralTimer matches 21 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 23 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 31 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 33 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 35 rotated ~ -60 run function api:weapon_operation/use_player_motion.m {Strength:3500, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 36..38 if entity @s[tag=Ply.Weapon.HisStop] run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 38 if entity @s[tag=Ply.Weapon.HisStop] rotated ~ -60 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 21..23 at @s run tp @s ~ ~ ~ ~1 ~0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 33..35 at @s run tp @s ~ ~ ~ ~-1 ~-0.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 41 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if score @s Wpn.GeneralTimer matches 3..52 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 52 run function mhdp_items:weapons/lance/type_tec/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 52 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 53.. run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/end
