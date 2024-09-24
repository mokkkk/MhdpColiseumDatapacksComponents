#> mhdp_monster_valk:core/tick/animation/event/shoot_sault_before/end
#
# アニメーションイベントハンドラ 待機
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_sault_before/main

# 移動に遷移
    function animated_java:valk_aj/animations/shoot_move_start/tween {duration:1, to_frame: 1}
