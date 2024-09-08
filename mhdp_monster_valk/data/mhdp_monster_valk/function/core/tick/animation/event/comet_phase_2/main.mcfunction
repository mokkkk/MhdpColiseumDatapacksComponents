#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_2.frame matches 2..60 at @s run tp @s ~ ~ ~ ~5 ~

# 効果音
    # execute if score @s aj.comet_phase_2.frame matches 12 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.comet_phase_2.frame matches 36 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_2.frame matches 91 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/end
