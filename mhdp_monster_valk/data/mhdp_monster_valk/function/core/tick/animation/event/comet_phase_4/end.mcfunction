#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/end
#
# アニメーションイベントハンドラ 彗星・急襲
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main

# フェーズ5に移行
    function animated_java:valk_aj/animations/comet_phase_5/tween {duration:1, to_frame: 1}
