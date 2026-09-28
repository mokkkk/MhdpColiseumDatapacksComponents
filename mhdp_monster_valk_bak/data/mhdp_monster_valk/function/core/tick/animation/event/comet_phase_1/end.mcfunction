#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/end
#
# アニメーションイベントハンドラ 彗星・離陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/main

# フェーズ2に移行
    function animated_java:valk_aj/animations/comet_phase_2/tween {duration:1, to_frame: 1}
