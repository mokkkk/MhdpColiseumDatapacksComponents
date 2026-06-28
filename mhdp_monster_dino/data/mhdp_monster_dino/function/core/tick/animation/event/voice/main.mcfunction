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
    execute if score @s aj.voice.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 32 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.voice.frame matches 52 run function mhdp_monster_ranposu:core/tick/animation/event/voice/end
