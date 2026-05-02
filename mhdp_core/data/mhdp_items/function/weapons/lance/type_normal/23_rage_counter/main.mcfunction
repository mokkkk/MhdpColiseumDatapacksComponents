#> mhdp_items:weapons/lance/type_normal/23_rage_counter/main
#
# カウンター突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"レイジカウンター"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 10 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_0
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_1
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_2
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_3
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_4
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_5
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/animation_6
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/attack_0
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/attack_1
    execute if score @s Wpn.GeneralTimer matches 14 run function mhdp_items:weapons/lance/type_normal/23_rage_counter/attack_1

# 移動
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 10 rotated ~ -60 run function api:weapon_operation/use_player_motion.m {Strength:3500, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6..7 at @s run tp @s ~ ~ ~ ~-1.5 ~-0.3

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..34 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..24 run function mhdp_items:core/buffering/arts_main

# 遷移
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 24.. run function mhdp_items:weapons/lance/type_normal/10_step/start
    
# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_normal/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_normal/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/lance/type_normal/23_rage_counter/end
