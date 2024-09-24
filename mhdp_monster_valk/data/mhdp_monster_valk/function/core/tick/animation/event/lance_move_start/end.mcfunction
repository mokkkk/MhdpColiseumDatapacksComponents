#> mhdp_monster_valk:core/tick/animation/event/lance_move_start/end
#
# アニメーションイベントハンドラ 移動開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_move_start/main

# 移動に遷移
    function animated_java:valk_aj/animations/lance_move/tween {duration:1, to_frame: 1}
