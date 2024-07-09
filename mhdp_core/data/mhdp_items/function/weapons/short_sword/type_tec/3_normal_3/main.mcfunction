#> mhdp_items:weapons/short_sword/type_tec/3_normal_3/main
#
# 通常コンボ3・剣盾コンボ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 12 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..3 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 6..7 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 8..9 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_4
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_5
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_6
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_7
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_shield
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_sword
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_sword
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_sword

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/attack_1
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/attack_2

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..7 run tp @s ~ ~ ~ ~0.8 ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 8..13 run tp @s ~ ~ ~ ~-0.3 ~0.8

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 先行入力
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/a

# 遷移
    # 右クリック短押し：通常コンボ2に移行
        # execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 11.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/change_to_normal_2

# 終了
    execute if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/end
