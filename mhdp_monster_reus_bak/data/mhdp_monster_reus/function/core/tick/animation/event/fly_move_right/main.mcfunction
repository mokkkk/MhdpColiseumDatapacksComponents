#> mhdp_monster_reus:core/tick/animation/event/fly_move_right/main
#
# アニメーションイベントハンドラ 飛行回り込み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_move_right.frame matches 2 run function mhdp_monster_reus:core/tick/animation/event/fly_move_right/turn_start
    execute if score @s aj.fly_move_right.frame matches 2..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.fly_move_right.frame matches 11..23 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.fly_move_right.frame matches 11..23 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.fly_move_right.frame matches 2 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_move_right/move_start_0
    execute if score @s aj.fly_move_right.frame matches 14 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_move_right/move_start_1
    execute if score @s aj.fly_move_right.frame matches 2..23 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.fly_move_right.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 終了
    execute if score @s aj.fly_move_right.frame matches 24 run function mhdp_monster_reus:core/tick/animation/event/fly_move_right/end
