#> mhdp_monster_reus:core/tick/animation/event/land_state_paralysis_start/main
#
# アニメーションイベントハンドラ 麻痺開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.land_state_paralysis_start.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.land_state_paralysis_start.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_state_paralysis_start.frame matches 9 run function mhdp_monster_reus:core/tick/animation/event/land_state_paralysis_start/end
