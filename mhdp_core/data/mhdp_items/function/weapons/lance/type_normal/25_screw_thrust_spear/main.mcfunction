#> mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/main
#
# スクリュースラスト メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.GeneralTimer matches 10 run playsound minecraft:entity.warden.attack_impact master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s Wpn.GeneralTimer matches 10 run playsound minecraft:entity.warden.attack_impact master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s Wpn.GeneralTimer matches 12 run playsound item.spear.lunge_3 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 12 run playsound item.spear.lunge_2 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 12 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 12 run playsound entity.breeze.wind_burst master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.GeneralTimer matches 12 run playsound entity.breeze.wind_burst master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/animation_7
    # execute if score @s Wpn.AnimationTimer matches 12 positioned ~ ~1.65 ~ positioned ^ ^ ^3 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/particle_0
    execute if score @s Wpn.AnimationTimer matches 13 if score @s Wpn.Lc.ChargeCount matches 1.. positioned ~ ~1.65 ~ positioned ^ ^ ^4 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/particle_0
    execute if score @s Wpn.AnimationTimer matches 15 if score @s Wpn.Lc.ChargeCount matches 2.. positioned ~ ~1.65 ~ positioned ^ ^ ^6 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/particle_1
    execute if score @s Wpn.AnimationTimer matches 17 if score @s Wpn.Lc.ChargeCount matches 3.. positioned ~ ~1.65 ~ positioned ^ ^ ^8 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/particle_1
    execute if score @s Wpn.AnimationTimer matches 19 if score @s Wpn.Lc.ChargeCount matches 3.. positioned ~ ~1.65 ~ positioned ^ ^ ^10 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/particle_1

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack
    execute if score @s Wpn.GeneralTimer matches 14 if score @s Wpn.Lc.ChargeCount matches 1.. positioned ^ ^ ^1 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 16 if score @s Wpn.Lc.ChargeCount matches 1.. positioned ^ ^ ^2 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 18 if score @s Wpn.Lc.ChargeCount matches 2.. positioned ^ ^ ^3 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 20 if score @s Wpn.Lc.ChargeCount matches 2.. positioned ^ ^ ^3 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 22 if score @s Wpn.Lc.ChargeCount matches 3.. positioned ^ ^ ^3 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 24 if score @s Wpn.Lc.ChargeCount matches 3.. positioned ^ ^ ^3 run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/attack_pursuit_last

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 10 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 12 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1500, IsForce:false, IsAdjust:false}

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..49 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/arts_main

# 遷移
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/lance/type_normal/10_step/start

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_normal/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_normal/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/end
