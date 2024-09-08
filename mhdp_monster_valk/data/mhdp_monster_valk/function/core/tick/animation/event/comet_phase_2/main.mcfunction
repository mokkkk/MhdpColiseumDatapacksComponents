#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_2.frame matches 3..60 at @s run tp @s ~ ~ ~ ~-3 ~
    execute if score @s aj.comet_phase_2.frame matches 3..60 unless entity @n[tag=Mns.Target.Valk,distance=..3] at @s facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 run tp @s ^ ^ ^1

    # execute if score @s aj.comet_phase_2.frame matches 60 at @s positioned as @n[tag=Mns.Target.Valk] positioned ~ ~0.5 ~ run summon area_effect_cloud ^ ^ ^ {Duration:50,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    # execute if score @s aj.comet_phase_2.frame matches 60 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run function mhdp_monsters:core/util/other/on_ground

# 効果音
    # execute if score @s aj.comet_phase_2.frame matches 12 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.comet_phase_2.frame matches 36 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_2.frame matches 91 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/end
