#> mhdp_monster_valk:core/tick/animation/event/lance_move_start/main
#
# アニメーションイベントハンドラ 移動開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_move_start.frame matches 1 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.MovePos.Valk",Tick:3,MaxRotation:360}
    execute if score @s aj.lance_move_start.frame matches 2..15 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 効果音
    execute if score @s aj.lance_move_start.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_move_start.frame matches 4 run function mhdp_monster_valk:core/tick/animation/event/lance_move_start/end
