#> mhdp_monster_valk:core/tick/animation/event/comet_phase_5/main
#
# アニメーションイベントハンドラ 彗星・後隙
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.comet_phase_5.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.comet_phase_5.frame matches 55 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態設定
    execute if score @s aj.comet_phase_5.frame matches 2 run tag @s remove Mns.State.IsDisableAngerSpeed
    execute if score @s aj.comet_phase_5.frame matches 2 run tag @s remove Mns.State.IsDisableDeath
    execute if score @s aj.comet_phase_5.frame matches 2 run tag @s remove Mns.State.IsDisablePartDamage

# 終了
    execute if score @s aj.comet_phase_5.frame matches 72 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_5/end
