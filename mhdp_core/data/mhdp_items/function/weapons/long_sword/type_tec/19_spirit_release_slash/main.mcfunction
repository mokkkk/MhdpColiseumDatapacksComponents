#> mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/main
#
# 練気解放無双斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.spirit_release_slash"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 9 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 23 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_6
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_7
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_8
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_9
    execute if score @s Wpn.AnimationTimer matches 23 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_10
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_11
    execute if score @s Wpn.AnimationTimer matches 25 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_12
    execute if score @s Wpn.AnimationTimer matches 28 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_8
    execute if score @s Wpn.AnimationTimer matches 29 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_9
    execute if score @s Wpn.AnimationTimer matches 30 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_10
    execute if score @s Wpn.AnimationTimer matches 31 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/animation_11
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 45 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/particle
    execute if score @s Wpn.GeneralTimer matches 9 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -45 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/particle
    execute if score @s Wpn.GeneralTimer matches 23 positioned ~ ~1.65 ~ positioned ^ ^ ^ rotated ~80 -10 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/particle
    execute if score @s Wpn.GeneralTimer matches 24 positioned ~ ~1.65 ~ positioned ^ ^ ^ rotated ~80 10 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/attack_0
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/effect.m {Rotation:-1.39626,PosX:-1.3,PosY:0.2}
    execute if score @s Wpn.GeneralTimer matches 7 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/effect.m {Rotation:-2.19626,PosX:1.4,PosY:-0.3}
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/attack_1
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/effect.m {Rotation:0.9,PosX:-1.3,PosY:0.4}
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/effect.m {Rotation:1.8,PosX:1.4,PosY:-0.2}
    execute if score @s Wpn.GeneralTimer matches 24 run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/attack_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 22 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 24 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 27 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~-0.6 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 8..10 run tp @s ~ ~ ~ ~0.6 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 45 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if score @s Wpn.GeneralTimer matches 3..55 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 49 run function mhdp_items:weapons/long_sword/type_tec/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 49 run function mhdp_items:weapons/long_sword/type_tec/26_sakura_slash/start

# アーマー
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.Armor.Hyper
    execute if score @s Wpn.GeneralTimer matches 28 run tag @s remove Ply.Weapon.Armor.Hyper

# 終了
    execute if score @s Wpn.GeneralTimer matches 56.. run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/end
