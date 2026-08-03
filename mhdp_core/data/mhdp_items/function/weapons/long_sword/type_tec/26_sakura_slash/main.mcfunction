#> mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/main
#
# 桜花気刃斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.sakura_slash"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 14 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 14 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 14 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_5
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_6
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 23 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_5
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_6
    # execute if score @s Wpn.AnimationTimer matches 38 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_7
    # execute if score @s Wpn.AnimationTimer matches 40 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/animation_8
    execute if score @s Wpn.GeneralTimer matches 14 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 15 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/particle
    execute if score @s Wpn.GeneralTimer matches 23 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -10 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 15 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/attack_0
    execute if score @s Wpn.GeneralTimer matches 23 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/attack_1
    execute if score @s Wpn.GeneralTimer matches 24 run tag @s remove Ply.Flag.Hit

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 11 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 14 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 17 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 20 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~0.5 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..10 run tp @s ~ ~ ~ ~-0.7 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 11..12 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 32 run function api:weapon_operation/attribute_move_veryslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 3..36 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 3..36 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..36 run function mhdp_items:core/buffering/e
    # execute if score @s Wpn.GeneralTimer matches 3..27 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 左クリック：縦斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 37 run function mhdp_items:weapons/long_sword/type_tec/1_normal_1/start
    # 右クリック：赤刃旋転斬に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 37 if score @s Wpn.Ls.SpiritLevel matches 3 run function mhdp_items:weapons/long_sword/type_tec/16_red_spin/start
    # スニーク右クリック同時：気刃突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.E] if score @s Wpn.GeneralTimer matches 37 if score @s Wpn.Ls.SpiritGauge matches 1.. run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/start

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/22_guard_rage/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 42.. run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/end
