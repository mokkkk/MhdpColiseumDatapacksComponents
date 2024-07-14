#> mhdp_monster_ranposu:core/tick/animation/event/voice/main
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.voice.frame matches 9 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.voice.frame matches 9 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s aj.voice.frame matches 24 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.voice.frame matches 24 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s aj.voice.frame matches 1 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 32 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.voice.frame matches 52 run function mhdp_monster_ranposu:core/tick/animation/event/voice/end
