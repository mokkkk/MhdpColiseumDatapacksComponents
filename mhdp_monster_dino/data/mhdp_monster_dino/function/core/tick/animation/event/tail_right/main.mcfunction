#> mhdp_monster_ranposu:core/tick/animation/event/tail_right/main
#
# アニメーションイベントハンドラ 尻尾攻撃
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.tail_right.frame matches 3..8 run tp @s ^-0.05 ^ ^ ~-2 0
    execute if score @s aj.tail_right.frame matches 9..13 run tp @s ^-0.05 ^ ^ ~-0.5 0
    execute if score @s aj.tail_right.frame matches 20..27 run tp @s ^0.2 ^ ^-0.1 ~18 0
    execute if score @s aj.tail_right.frame matches 28..31 run tp @s ^0.2 ^ ^-0.1 ~4 0

# 効果音
    execute if score @s aj.tail_right.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.tail_right.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 20 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.tail_right.frame matches 31 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 22 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3

# 攻撃
    execute if score @s aj.tail_right.frame matches 21 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"Tail"}]
    execute if score @s aj.tail_right.frame matches 22..31 run function mhdp_monster_ranposu:core/tick/animation/event/tail_right/attack
    execute if score @s aj.tail_right.frame matches 32 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.tail_right.frame matches 59.. run function mhdp_monster_ranposu:core/tick/animation/event/tail_right/end
