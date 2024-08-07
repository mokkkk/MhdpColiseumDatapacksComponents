#> mhdp_items:weapons/short_sword/type_normal/9_bash_3/main
#
# ハードバッシュ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..6 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 9..15 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/animation_4
    execute if score @s Wpn.AnimationTimer matches 7 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 7 run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..10 run tp @s ~ ~ ~ ~-1.3 ~-1.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 13 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 13 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 7 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 7 run scoreboard players set $strength delta.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~ 0 run function delta:api/launch_looking

# 終了
    execute if score @s Wpn.GeneralTimer matches 22.. run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/end
