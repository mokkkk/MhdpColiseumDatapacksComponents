#> mhdp_monster_dino:core/tick/animation/event/state_paralysis_end/main
#
# アニメーションイベントハンドラ 麻痺終了
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.state_paralysis_end.frame matches 10..14 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.state_paralysis_end.frame matches 39 run function mhdp_monster_dino:core/tick/animation/event/state_paralysis_end/end
