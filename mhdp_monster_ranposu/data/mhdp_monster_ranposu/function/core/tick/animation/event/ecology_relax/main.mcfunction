#> mhdp_monster_ranposu:core/tick/animation/event/ecology_relax/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 接地
    # execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    # execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 効果音
    execute if score @s aj.ecology_relax.frame matches 19 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.ecology_relax.frame matches 56 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 終了
    execute if score @s aj.ecology_relax.frame matches 72 run function mhdp_monster_ranposu:core/tick/animation/event/ecology_relax/end
