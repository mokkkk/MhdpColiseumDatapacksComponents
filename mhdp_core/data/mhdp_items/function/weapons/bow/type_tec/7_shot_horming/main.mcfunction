#> mhdp_items:weapons/bow/type_tec/7_shot_horming/main
#
# 導ノ矢 メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# タイマー増加
    execute if score @s Wpn.GeneralTimer matches ..13 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 14.. run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 3..8 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 3..8 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2

    execute if score @s Wpn.GeneralTimer matches 15 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 15 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.GeneralTimer matches 15 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 15 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.GeneralTimer matches 15 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_2
    execute if score @s Wpn.GeneralTimer matches 15 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_4
    execute if score @s Wpn.GeneralTimer matches 16 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_5
    execute if score @s Wpn.GeneralTimer matches 18 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_6

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 15 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/7_shot_horming/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25
    execute if score @s Wpn.GeneralTimer matches 1..14 anchored eyes run particle enchanted_hit ^ ^ ^0.5 0.1 0.1 0.1 0.5 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1..14 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 15 run effect clear @s slowness
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 15 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 15 run scoreboard players set $strength delta.api.launch 3000
    execute if score @s Wpn.GeneralTimer matches 15 rotated ~180 0 run function delta:api/launch_looking

# スタミナ消費
    execute if score @s Wpn.GeneralTimer matches 15 run scoreboard players remove @s Ply.Stats.Stamina 100

# 先行入力

# 遷移

# 終了
    execute if entity @s[tag=Wpn.Bw.Tec.Shot.Horming] if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/bow/type_tec/7_shot_horming/end
