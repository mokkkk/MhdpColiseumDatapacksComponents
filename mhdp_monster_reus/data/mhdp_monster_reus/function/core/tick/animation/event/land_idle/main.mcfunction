#> mhdp_monster_reus:core/tick/animation/event/land_idle/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.land_idle.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_idle.frame matches 36 run particle block{block_state:"minecraft:sand"} ^ ^ ^-5 1 0.1 1 0 10
    # execute if score @s aj.land_idle.frame matches 36 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_idle.frame matches 86 run function mhdp_monster_reus:core/tick/animation/event/land_idle/end
