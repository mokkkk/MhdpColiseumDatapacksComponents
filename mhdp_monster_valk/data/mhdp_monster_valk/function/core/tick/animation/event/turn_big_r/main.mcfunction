#> mhdp_monster_dino:core/tick/animation/event/turn_big_r/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.turn_big_r.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/turn_big_r/turn_start
    execute if score @s aj.turn_big_r.frame matches 2..25 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.turn_big_r.frame matches 1..18 if entity @n[tag=Mns.Target.Dino,distance=..9] facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 run tp @s ^ ^ ^-0.2
    execute if score @s aj.turn_big_r.frame matches 19..25 if entity @n[tag=Mns.Target.Dino,distance=..9] facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 run tp @s ^ ^ ^-0.4

# 効果音
    execute if score @s aj.turn_big_r.frame matches 9 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.turn_big_r.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.turn_big_r.frame matches 31 run function mhdp_monster_dino:core/tick/animation/event/turn_big_r/end
