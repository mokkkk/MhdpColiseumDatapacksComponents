#> mhdp_items:weapons/short_sword/type_tec/19_moveslash/main
#
# 突進斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/animation_0
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/animation_1
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/animation_2
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/attack

# 演出
    execute if score @s Wpn.AnimationTimer matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 移動
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 10000
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 1 rotated ~ -15 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Ope.IsAir

# 先行入力
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/c

# 遷移
    # 右クリック短押し：通常コンボ2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/change_to_normal_2
    # 右クリック長押し：水平斬りコンボ1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/change_to_horizon_1
    # スニーク+右クリック：盾攻撃に移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/change_to_bash

# 終了
    execute if score @s Wpn.GeneralTimer matches 21.. run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/end
