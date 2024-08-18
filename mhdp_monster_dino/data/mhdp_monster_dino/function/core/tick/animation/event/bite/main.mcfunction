#> mhdp_monster_dino:core/tick/animation/event/bite/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.bite.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/bite/turn_start
    execute if score @s aj.bite.frame matches 6 run function mhdp_monster_dino:core/tick/animation/event/bite/turn_start
    execute if score @s aj.bite.frame matches 1..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.bite.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.bite.frame matches 6..10 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.bite.frame matches 20..25 unless entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite.frame matches 43..58 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.bite.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite.frame matches 25 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.bite.frame matches 43 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.bite.frame matches 22..27 run function mhdp_monster_dino:core/tick/animation/event/bite/attack_head
    execute if score @s aj.bite.frame matches 25 run function mhdp_monster_dino:core/tick/animation/event/bite/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.bite.frame matches 65 run function mhdp_monster_dino:core/tick/animation/event/bite/end
