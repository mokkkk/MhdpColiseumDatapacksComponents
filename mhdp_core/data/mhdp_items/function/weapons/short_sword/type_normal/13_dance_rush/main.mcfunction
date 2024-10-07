#> mhdp_items:weapons/short_sword/type_normal/13_dance_rush/main
#
# 剣の舞 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 10 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..3 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_2
    execute if score @s Wpn.AnimationTimer matches 6..7 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_3
    execute if score @s Wpn.AnimationTimer matches 8..9 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_4
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_5
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_6
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_7
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_1
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_0
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_0
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_0
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_8
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_9
    execute if score @s Wpn.AnimationTimer matches 19..21 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_10
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_11
    execute if score @s Wpn.AnimationTimer matches 25 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_12
    execute if score @s Wpn.AnimationTimer matches 26 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_13
    execute if score @s Wpn.AnimationTimer matches 27 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_14
    execute if score @s Wpn.AnimationTimer matches 35 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_15
    execute if score @s Wpn.AnimationTimer matches 36 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_16
    execute if score @s Wpn.AnimationTimer matches 37 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_17
    execute if score @s Wpn.AnimationTimer matches 39 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_18
    execute if score @s Wpn.AnimationTimer matches 41 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_19
    execute if score @s Wpn.AnimationTimer matches 43 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_20
    execute if score @s Wpn.AnimationTimer matches 44 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_21
    execute if score @s Wpn.AnimationTimer matches 45 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_22
    execute if score @s Wpn.AnimationTimer matches 47 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_23
    execute if score @s Wpn.AnimationTimer matches 49 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_24
    execute if score @s Wpn.AnimationTimer matches 51 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_25
    execute if score @s Wpn.AnimationTimer matches 52 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_26
    execute if score @s Wpn.AnimationTimer matches 54 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_27
    execute if score @s Wpn.AnimationTimer matches 57 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_28
    execute if score @s Wpn.AnimationTimer matches 60 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 62 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 67 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 60..62 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_34
    execute if score @s Wpn.AnimationTimer matches 63..64 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_35
    execute if score @s Wpn.AnimationTimer matches 65..66 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_36
    execute if score @s Wpn.AnimationTimer matches 67 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_29
    execute if score @s Wpn.AnimationTimer matches 68 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_30
    execute if score @s Wpn.AnimationTimer matches 69 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_31
    execute if score @s Wpn.AnimationTimer matches 70 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_32
    execute if score @s Wpn.AnimationTimer matches 71 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/animation_33

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_0
    execute if score @s Wpn.GeneralTimer matches 6 run scoreboard players set @s Wpn.AnimationTimer 6
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_1
    execute if score @s Wpn.GeneralTimer matches 12 run scoreboard players set @s Wpn.AnimationTimer 12
    execute if score @s Wpn.GeneralTimer matches 19 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_2
    execute if score @s Wpn.GeneralTimer matches 21 run scoreboard players set @s Wpn.AnimationTimer 21
    execute if score @s Wpn.GeneralTimer matches 28 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_3
    execute if score @s Wpn.GeneralTimer matches 30 run scoreboard players set @s Wpn.AnimationTimer 30
    execute if score @s Wpn.GeneralTimer matches 37 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_4
    execute if score @s Wpn.GeneralTimer matches 39 run scoreboard players set @s Wpn.AnimationTimer 39
    execute if score @s Wpn.GeneralTimer matches 44 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_5
    execute if score @s Wpn.GeneralTimer matches 46 run scoreboard players set @s Wpn.AnimationTimer 46
    execute if score @s Wpn.GeneralTimer matches 53 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_6
    execute if score @s Wpn.GeneralTimer matches 68 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_7
    execute if score @s Wpn.GeneralTimer matches 71 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/attack_8

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-2.2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..11 run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 12..13 run tp @s ~ ~ ~ ~0.3 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 17..19 at @s run tp @s ~ ~ ~ ~0.5 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 21..25 at @s run tp @s ~ ~ ~ ~0.5 ~1
    execute if score @s Wpn.AnimationTimer matches 18 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 18 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 16 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_2
    execute if score @s Wpn.AnimationTimer matches 17 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_2
    execute if score @s Wpn.AnimationTimer matches 27 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 27 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_3
    execute if score @s Wpn.AnimationTimer matches 27 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_3
    execute if score @s Wpn.AnimationTimer matches 27 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_3
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 27..30 at @s run tp @s ~ ~ ~ ~1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 35..38 at @s run tp @s ~ ~ ~ ~-2 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 39..41 at @s run tp @s ~ ~ ~ ~-0.6 ~-1.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 42..45 at @s run tp @s ~ ~ ~ ~2 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 50..53 at @s run tp @s ~ ~ ~ ~-1 ~0.5
    execute if score @s Wpn.AnimationTimer matches 35 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 36 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_2
    execute if score @s Wpn.AnimationTimer matches 36 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_2
    execute if score @s Wpn.AnimationTimer matches 36 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_2
    execute if score @s Wpn.AnimationTimer matches 42 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 43 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_3
    execute if score @s Wpn.AnimationTimer matches 43 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_3
    execute if score @s Wpn.AnimationTimer matches 43 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_3
    execute if score @s Wpn.AnimationTimer matches 52 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 52 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s Wpn.AnimationTimer matches 52 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 52 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_4
    execute if score @s Wpn.AnimationTimer matches 53 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_4
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 51..53 at @s run tp @s ~ ~ ~ ~-1 ~-0.5
    execute if score @s Wpn.AnimationTimer matches 67 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_5
    execute if score @s Wpn.AnimationTimer matches 67 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_5
    execute if score @s Wpn.AnimationTimer matches 67 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/particle_5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 60..61 run tp @s ~ ~ ~ ~-2.2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 68..70 run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 71..72 run tp @s ~ ~ ~ ~0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 4 4 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 28 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 28 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 50 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 50 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 64 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 64 rotated ~ 0 run function delta:api/launch_looking

# 終了
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 13 run scoreboard players set @s Wpn.GeneralTimer 1000
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 28 run scoreboard players set @s Wpn.GeneralTimer 1000
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 48 run scoreboard players set @s Wpn.GeneralTimer 1000
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 57 run scoreboard players set @s Wpn.GeneralTimer 1000
    execute if score @s Wpn.GeneralTimer matches 90 run scoreboard players set @s Wpn.GeneralTimer 1010
    execute if score @s Wpn.GeneralTimer matches 1000.. run scoreboard players set @s Wpn.AnimationTimer 1000
    execute if score @s Wpn.GeneralTimer matches 1010.. run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/end
