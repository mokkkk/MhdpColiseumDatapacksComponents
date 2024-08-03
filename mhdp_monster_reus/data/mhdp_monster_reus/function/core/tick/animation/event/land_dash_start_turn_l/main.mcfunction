#> mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_l/main
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.land_dash_start_turn_l.frame matches 8 run function mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_r/turn_start
    execute if score @s aj.land_dash_start_turn_l.frame matches 19..30 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.land_dash_start_turn_l.frame matches 28..32 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.land_dash_start_turn_l.frame matches 28..32 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.land_dash_start_turn_l.frame matches 28..31 facing entity @n[tag=Mns.Target.Reus] feet rotated ~ 0 positioned ^ ^ ^0.3 at @s run tp @s ^ ^ ^

# 演出
    execute if score @s aj.land_dash_start_turn_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_dash_start_turn_l.frame matches 31 run function mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_l/end
