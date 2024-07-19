#> mhdp_monster_reus:core/tick/animation/event/land_breath/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.land_breath.frame matches 1 run function mhdp_monster_reus:core/tick/animation/event/land_breath/turn_start
    execute if score @s aj.land_breath.frame matches 8 run function mhdp_monster_reus:core/tick/animation/event/land_breath/turn_start
    execute if score @s aj.land_breath.frame matches 1..16 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 演出
    execute if score @s aj.land_breath.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.land_breath.frame matches 16 positioned as @n[tag=Mns.Target.Reus] run summon area_effect_cloud ~ ~0.5 ~ {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Reus"]}
    execute if score @s aj.land_breath.frame matches 25 positioned ^ ^1.3 ^5 run function mhdp_monster_reus:core/tick/animation/event/land_breath/shot

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_breath.frame matches 67 run function mhdp_monster_reus:core/tick/animation/event/land_breath/end
