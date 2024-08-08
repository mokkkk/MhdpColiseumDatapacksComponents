#> mhdp_items:weapons/short_sword/type_normal/1_sword_1/main
#
# 剣コンボ1 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/attack
    execute if score @s Wpn.GeneralTimer matches 4 run tag @s remove Ply.Flag.DrawAttack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-0.5 ~1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 6 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 6 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 遷移
    # 右クリック：剣コンボ2に移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/change_to_sword_2

# 終了
    execute if score @s Wpn.GeneralTimer matches 10.. run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/end
