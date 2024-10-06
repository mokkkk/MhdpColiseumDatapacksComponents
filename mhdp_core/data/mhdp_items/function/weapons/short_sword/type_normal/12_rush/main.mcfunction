#> mhdp_items:weapons/short_sword/type_normal/12_rush/main
#
# 剣盾ラッシュ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 10 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..3 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_2
    execute if score @s Wpn.AnimationTimer matches 6..7 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_3
    execute if score @s Wpn.AnimationTimer matches 8..9 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_4
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_5
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_6
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_7
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_1
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_0
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_0
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_0

    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_8
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_9
    execute if score @s Wpn.AnimationTimer matches 19..21 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_10
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_11

    execute if score @s Wpn.AnimationTimer matches 26 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_12
    execute if score @s Wpn.AnimationTimer matches 27 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_13
    execute if score @s Wpn.AnimationTimer matches 28 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_14
    execute if score @s Wpn.AnimationTimer matches 32 run function mhdp_items:weapons/short_sword/type_normal/12_rush/animation_15

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_normal/12_rush/attack_0
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/short_sword/type_normal/12_rush/attack_1
    execute if score @s Wpn.GeneralTimer matches 19 run function mhdp_items:weapons/short_sword/type_normal/12_rush/attack_2
    execute if score @s Wpn.GeneralTimer matches 28 run function mhdp_items:weapons/short_sword/type_normal/12_rush/attack_3

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-2.2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..11 run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 12..13 run tp @s ~ ~ ~ ~0.3 ~

    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 17..19 at @s run tp @s ~ ~ ~ ~0.5 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 21..25 at @s run tp @s ~ ~ ~ ~0.5 ~1

    execute if score @s Wpn.AnimationTimer matches 18 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 18 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 16 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_2
    execute if score @s Wpn.AnimationTimer matches 17 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_2

    execute if score @s Wpn.AnimationTimer matches 27 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 27 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s Wpn.AnimationTimer matches 27 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 27 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_3
    execute if score @s Wpn.AnimationTimer matches 28 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_normal/12_rush/particle_3
    
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 26..28 at @s run tp @s ~ ~ ~ ~-1 ~-0.5
    execute if score @s Wpn.AnimationTimer matches 32 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 3 4 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 26 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 26 run scoreboard players set $strength delta.api.launch 6000
    execute if score @s Wpn.GeneralTimer matches 26 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 30 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 30 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 30 rotated ~180 0 run function delta:api/launch_looking

# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/short_sword/type_normal/12_rush/end
