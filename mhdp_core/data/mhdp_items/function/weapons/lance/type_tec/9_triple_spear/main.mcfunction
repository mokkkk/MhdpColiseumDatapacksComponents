#> mhdp_items:weapons/lance/type_tec/9_triple_spear/main
#
# 3連突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"３連突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 4 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 12 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 22 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 20 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_7
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_8
    execute if score @s Wpn.AnimationTimer matches 30 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/animation_4
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/attack_0
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/attack_1
    execute if score @s Wpn.GeneralTimer matches 22 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/attack_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 12 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 22 rotated ~ -20 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 22..23 at @s run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 30..32 at @s run tp @s ~ ~ ~ ~ ~0.25

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 36 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..45 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..45 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..45 run function mhdp_items:core/buffering/arts_main

# 遷移
    # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 36.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 36.. run function mhdp_items:weapons/lance/type_tec/10_step/start

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 46.. run function mhdp_items:weapons/lance/type_tec/9_triple_spear/end
