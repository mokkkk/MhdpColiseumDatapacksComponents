#> mhdp_monster_ranposu:core/tick/animation/event/turn_right/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# # 軸合わせ
#     execute if score @s aj.turn_right.frame matches 2 run function mhdp_monster_ranposu:core/tick/animation/event/turn_right/turn_start
#     execute if score @s aj.turn_right.frame matches 4..14 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 軸合わせ
    execute if score @s aj.turn_right.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:11,MaxRotation:90}
    execute if score @s aj.turn_right.frame matches 4..14 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 演出
    execute if score @s aj.turn_right.frame matches 4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.turn_right.frame matches 14 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.turn_right.frame matches 19 run function mhdp_monster_ranposu:core/tick/animation/event/turn_right/end
