#> mhdp_items:weapons/short_sword/type_tec/13_just_1/main
#
# 飛び込み斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.AnimationTimer matches 10 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 10 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/animation_0
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/animation_1
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/animation_2
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 16..20 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/animation_4
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/animation_5
    execute if score @s Wpn.AnimationTimer matches 9 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/particle
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/particle
    execute if score @s Wpn.AnimationTimer matches 11 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/particle
    
# 攻撃
    execute if score @s Wpn.GeneralTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/13_just_1/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 at @s run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 11..13 at @s run tp @s ~ ~ ~ ~1 ~-1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 16..20 at @s run tp @s ~ ~ ~ ~1 ~0.5
    execute if score @s Wpn.AnimationTimer matches 16 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 25 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 9500
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -25 run function delta:api/launch_looking

# 遷移
    # 右クリック：2段目に移行
        execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 22.. run function mhdp_items:weapons/short_sword/type_tec/13_just_1/change_to_just_2

# 終了
    execute if score @s Wpn.GeneralTimer matches 50.. run function mhdp_items:weapons/short_sword/type_tec/13_just_1/end
