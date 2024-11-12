#> mhdp_monster_karakuri:core/tick/animation/event/bite/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.bite.frame matches 3 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_0
    execute if score @s aj.bite.frame matches 20 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_1
    execute if score @s aj.bite.frame matches 30 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_0
    execute if score @s aj.bite.frame matches 60 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_0
    execute if score @s aj.bite.frame matches 79 run function mhdp_monster_karakuri:core/tick/animation/event/bite/sound_1

    # execute if score @s aj.bite.frame matches 3 run playsound block.piston.contract master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.bite.frame matches 20 run playsound block.piston.extend master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    # execute if score @s aj.bite.frame matches 30 run playsound block.piston.contract master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.bite.frame matches 60 run playsound block.piston.contract master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    # execute if score @s aj.bite.frame matches 79 run playsound block.piston.extend master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.bite.frame matches 46 run playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2

# 攻撃
    execute if score @s aj.bite.frame matches 45 run function mhdp_monster_karakuri:core/tick/animation/event/bite/attack

# 接地
    # execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    # execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.bite.frame matches 86 run function mhdp_monster_karakuri:core/tick/animation/event/bite/end
