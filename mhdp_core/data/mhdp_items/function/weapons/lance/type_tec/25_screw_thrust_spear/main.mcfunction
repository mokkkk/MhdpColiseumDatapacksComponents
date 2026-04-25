#> mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/main
#
# カウンター突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 12 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/animation_7
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:7000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 10 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 12 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1500, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6..7 at @s run tp @s ~ ~ ~ ~-1.5 ~-0.3

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/arts_main

# 遷移
     # 左クリック：突き1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/lance/type_tec/1_spear_1/start
     # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/lance/type_tec/4_charge/start
     # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/lance/type_tec/10_step/start

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 28.. run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/end
