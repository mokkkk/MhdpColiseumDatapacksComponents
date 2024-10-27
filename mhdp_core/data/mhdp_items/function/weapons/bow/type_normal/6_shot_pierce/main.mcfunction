#> mhdp_items:weapons/bow/type_normal/6_shot_pierce/main
#
# 竜の一矢 メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 3..25 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 3..25 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 40 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.1

    execute if score @s Wpn.GeneralTimer matches 1001 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.GeneralTimer matches 1001 run playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_0
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_1
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_2
    execute if score @s Wpn.AnimationTimer matches 31 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_3
    execute if score @s Wpn.GeneralTimer matches 1001 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_4
    execute if score @s Wpn.GeneralTimer matches 1002 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_5
    execute if score @s Wpn.GeneralTimer matches 1003 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_6
    execute if score @s Wpn.GeneralTimer matches 1005 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/animation_7

# 攻撃
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 44..999 run scoreboard players set @s Wpn.AnimationTimer 1000
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 44..999 run scoreboard players set @s Wpn.GeneralTimer 1000
    execute if score @s Wpn.GeneralTimer matches 1001 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25
    execute if score @s Wpn.GeneralTimer matches 11..999 anchored eyes run particle crit ^ ^ ^0.5 0.1 0.1 0.1 0.5 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1..999 run effect give @s slowness 1 5 true
    execute if score @s Wpn.GeneralTimer matches 1001 run effect clear @s slowness
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 1001 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1001 run scoreboard players set $strength delta.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 1001 rotated ~180 0 run function delta:api/launch_looking

# スタミナ消費
    execute if score @s Wpn.GeneralTimer matches 1001 run scoreboard players remove @s Ply.Stats.Stamina 100

# 遷移
    # 右クリック押し続け：竜の千々矢に移行
        execute if score @s Wpn.GeneralTimer matches 56 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/change_to_shower

# 終了
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 1..30 run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/end
    execute if score @s Wpn.GeneralTimer matches 1020.. run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/end
