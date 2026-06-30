#> mhdp_monster_dino:core/tick/animation/event/walk_relax/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_dino:core/tick/animation/event/walk_relax/main

# スコアリセット
    scoreboard players reset @s Mns.General.WalkCount

# 移動停止
    function animated_java_dino:dino/animations/walk_relax_stop/tween {duration:1, to_frame: 1}
