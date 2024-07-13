#> mhdp_items:weapons/short_sword/type_tec/20_chargeslash/main
#
# 溜め斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 7 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/animation_0
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/animation_1
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/animation_2
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/attack

# 演出
    execute if score @s Wpn.AnimationTimer matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 10000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -15 run function delta:api/launch_looking

# 遷移
    # ヒット時：駆け上がり斬りに移行
        execute if entity @s[tag=Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 11.. run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/change_to_jumpslash

# 終了
    execute if score @s Wpn.GeneralTimer matches 21.. run function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/end
