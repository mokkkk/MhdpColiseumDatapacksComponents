#> mhdp_monster_ranposu:core/tick/animation/event/move/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    tag @n[tag=Mns.Target.Ranposu] add Temp.Rotate.Target
    function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    tp @s ^ ^ ^0.6

# 効果音
    particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.move.frame matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.move.frame matches 9 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if entity @n[tag=Mns.Target.Ranposu,distance=..5] run function mhdp_monster_ranposu:core/tick/animation/event/move/end
    execute unless entity @e[tag=Mns.Target.Ranposu] run function mhdp_monster_ranposu:core/tick/animation/event/move/end
