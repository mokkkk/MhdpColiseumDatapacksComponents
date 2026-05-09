#> mhdp_monster_ranposu:core/tick/animation/event/state_stun_end/main
#
# アニメーションイベントハンドラ スタン終了
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.state_stun_end.frame matches 7 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.state_stun_end.frame matches 7 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.state_stun_end.frame matches 34 run function mhdp_monster_ranposu:core/tick/animation/event/state_stun_end/end
