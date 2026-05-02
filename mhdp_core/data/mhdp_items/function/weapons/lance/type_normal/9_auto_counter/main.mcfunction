#> mhdp_items:weapons/lance/type_normal/9_auto_counter/main
#
# カウンター突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"カウンター突き"}

# タイマー増加
# ガードストップ中はタイマー増加無し
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1
    execute if score @s Wpn.GeneralTimer matches 1.. unless score @s Wpn.GuardStopTimer matches 1.. run scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches ..0 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] unless score @s Wpn.GuardStopTimer matches 1.. run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 4 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/animation_4
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/animation_5
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/lance/type_normal/9_auto_counter/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 2 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1500, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6..7 at @s run tp @s ~ ~ ~ ~-1.5 ~-0.3

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if score @s Wpn.GeneralTimer matches 3..23 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/lance/type_tec/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/lance/type_normal/9_auto_counter/end
