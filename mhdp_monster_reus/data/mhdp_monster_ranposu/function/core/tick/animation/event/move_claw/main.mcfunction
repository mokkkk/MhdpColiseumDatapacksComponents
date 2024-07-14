#> mhdp_monster_ranposu:core/tick/animation/event/move_claw/main
#
# アニメーションイベントハンドラ 移動ひっかき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.move_claw.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/turn_start
    execute if score @s aj.move_claw.frame matches 6 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/turn_start
    execute if score @s aj.move_claw.frame matches 11 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/turn_start
    execute if score @s aj.move_claw.frame matches 1..15 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.move_claw.frame matches 1..5 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.move_claw.frame matches 24..26 at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.move_claw.frame matches 27..30 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.move_claw.frame matches 31..36 at @s run tp @s ^ ^ ^0.2

# 効果音
    execute if score @s aj.move_claw.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.move_claw.frame matches 24 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.move_claw.frame matches 24 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.move_claw.frame matches 25..28 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 3
    execute if score @s aj.move_claw.frame matches 29 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10

# 攻撃
    execute if score @s aj.move_claw.frame matches 24..29 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.move_claw.frame matches 64 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/end
