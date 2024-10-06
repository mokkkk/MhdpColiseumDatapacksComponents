#> mhdp_items:weapons/great_sword/type_tec/15_cross/main
#
# 十字斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 17 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 17 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_4
    execute if score @s Wpn.GeneralTimer matches 9 run scoreboard players set @s Wpn.AnimationTimer 9
    
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_9
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_5
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_6
    execute if score @s Wpn.AnimationTimer matches 19 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_7
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/great_sword/type_tec/15_cross/animation_8

    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/great_sword/type_tec/15_cross/particle_horizon
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/great_sword/type_tec/15_cross/particle_horizon

    execute if score @s Wpn.GeneralTimer matches 16 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_tec/15_cross/particle
    execute if score @s Wpn.GeneralTimer matches 17 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_tec/15_cross/particle
    execute if score @s Wpn.GeneralTimer matches 18 unless block ~ ~-1 ~ #mhdp_core:no_collision rotated ~ 0 run function mhdp_items:weapons/great_sword/type_tec/15_cross/effect_on_ground
    execute if score @s Wpn.AnimationTimer matches 20 rotated ~ 0 run function mhdp_items:weapons/great_sword/type_tec/15_cross/effect_on_ground

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/15_cross/attack_0
    execute if score @s Wpn.GeneralTimer matches 18 run function mhdp_items:weapons/great_sword/type_tec/15_cross/attack_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 2..6 run tp @s ~ ~ ~ ~-1 ~0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..14 run tp @s ~ ~ ~ ~1.2 ~-0.8
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 15..20 run tp @s ~ ~ ~ ~ ~0.8

# アーマー
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.Armod.Hyper
    execute if score @s Wpn.GeneralTimer matches 17 run tag @s remove Ply.Weapon.Armod.Hyper

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 10000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 10 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 10 run scoreboard players set $strength delta.api.launch 6000
    execute if score @s Wpn.GeneralTimer matches 10 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 11 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 11 run scoreboard players set $strength delta.api.launch 3000
    execute if score @s Wpn.GeneralTimer matches 11 rotated ~ -60 run function delta:api/launch_looking
    # execute if score @s Wpn.GeneralTimer matches 3 unless entity @n[type=slime,tag=Mns.HitBox,distance=..4] run scoreboard players set $strength delta.api.launch 16000
    # execute if score @s Wpn.GeneralTimer matches 3 unless entity @n[type=slime,tag=Mns.HitBox,distance=..4] rotated ~ 0 run function delta:api/launch_looking
    # execute if score @s Wpn.GeneralTimer matches 5 unless entity @n[type=slime,tag=Mns.HitBox,distance=..4] run scoreboard players set $strength delta.api.launch 16000
    # execute if score @s Wpn.GeneralTimer matches 5 unless entity @n[type=slime,tag=Mns.HitBox,distance=..4] rotated ~ 0 run function delta:api/launch_looking

# 遷移
    # 右クリック長押し：強溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/great_sword/type_tec/15_cross/change_to_charge

# 終了
    execute if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/great_sword/type_tec/15_cross/end
