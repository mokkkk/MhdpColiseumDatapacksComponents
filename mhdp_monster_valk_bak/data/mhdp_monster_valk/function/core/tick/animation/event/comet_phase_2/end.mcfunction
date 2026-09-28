#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/end
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main

# フェーズ3に移行
    function animated_java:valk_aj/animations/comet_phase_3/tween {duration:1, to_frame: 1}
