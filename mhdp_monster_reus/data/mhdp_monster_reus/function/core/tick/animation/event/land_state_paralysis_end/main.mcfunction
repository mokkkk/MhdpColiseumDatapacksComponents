#> mhdp_monster_reus:core/tick/animation/event/land_state_paralysis_end/main
#
# アニメーションイベントハンドラ 麻痺終了
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.land_state_paralysis_end.frame matches 14..18 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.7 0.4
    
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_state_paralysis_end.frame matches 49 run function mhdp_monster_reus:core/tick/animation/event/land_state_paralysis_end/end
