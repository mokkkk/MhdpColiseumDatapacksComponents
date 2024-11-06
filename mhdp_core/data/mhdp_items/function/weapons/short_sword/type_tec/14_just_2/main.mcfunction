#> mhdp_items:weapons/short_sword/type_tec/14_just_2/main
#
# ジャストラッシュ2 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ジャストラッシュ・２"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_2
    execute if score @s Wpn.AnimationTimer matches 4..6 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_4
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_5
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_6
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_7
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_8
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_9
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_10
    execute if score @s Wpn.AnimationTimer matches 19 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_11
    execute if score @s Wpn.AnimationTimer matches 20 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_12
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_13
    execute if score @s Wpn.AnimationTimer matches 28 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/animation_14

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/attack_1
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/attack_2
    execute if score @s Wpn.GeneralTimer matches 19 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/attack_3

# 効果音・パーティクル
    execute if score @s Wpn.AnimationTimer matches 2 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 2 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_1
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_1
    execute if score @s Wpn.AnimationTimer matches 10 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_2
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_2
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_2
    execute if score @s Wpn.AnimationTimer matches 17 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 18 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_3
    execute if score @s Wpn.AnimationTimer matches 18 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_3
    execute if score @s Wpn.AnimationTimer matches 18 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/14_just_2/particle_3

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 at @s run tp @s ~ ~ ~ ~-1 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..8 at @s run tp @s ~ ~ ~ ~0.5 ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 10..13 at @s run tp @s ~ ~ ~ ~-2 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 14..16 at @s run tp @s ~ ~ ~ ~-0.6 ~-1.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 17..20 at @s run tp @s ~ ~ ~ ~2 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 25..28 at @s run tp @s ~ ~ ~ ~-1 ~0.5
    execute if score @s Wpn.AnimationTimer matches 25 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 28 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 28..32 positioned ~ ~1.65 ~ run particle crit ^ ^ ^1 0 0 0 0.5 1
    execute if score @s Wpn.GeneralTimer matches 33 run playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 33 positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.5 0 0 0 0 1
    
# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 3 6 true

# 遷移
    # 右クリック：ジャストラッシュ3に移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 30.. run function mhdp_items:weapons/short_sword/type_tec/14_just_2/change_to_just_3

# 終了
    execute if score @s Wpn.GeneralTimer matches 50.. run function mhdp_items:weapons/short_sword/type_tec/14_just_2/end
