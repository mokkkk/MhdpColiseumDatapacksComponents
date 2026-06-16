#> mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/main
#
# 気刃斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.spirit_slash_3"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1 positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^1 0.2 0.2 0.2 0 1
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 11 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 24 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_6
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_7
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_8
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_9
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_10
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_11
    execute if score @s Wpn.AnimationTimer matches 23 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_12
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/animation_13
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 10 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/particle
    execute if score @s Wpn.GeneralTimer matches 9 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -10 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/particle
    execute if score @s Wpn.GeneralTimer matches 24 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -85 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/attack_0
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/attack_1
    execute if score @s Wpn.GeneralTimer matches 24 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/attack_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:2500, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 11 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:2500, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 22 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:2500, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~0.5 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..10 run tp @s ~ ~ ~ ~-0.7 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 11..12 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 3..34 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..34 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..34 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 右クリック：気刃大回転斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 32.. if score @s Wpn.Ls.SpiritGauge matches 250.. run function mhdp_items:weapons/long_sword/type_normal/7_spirit_spin/start
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 32.. if score @s Wpn.Ls.SpiritGauge matches 250.. run function mhdp_items:weapons/long_sword/type_normal/7_spirit_spin/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/util/move_jump

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/end
