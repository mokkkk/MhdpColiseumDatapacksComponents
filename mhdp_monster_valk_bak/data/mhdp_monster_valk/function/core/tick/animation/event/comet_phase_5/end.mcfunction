#> mhdp_monster_valk:core/tick/animation/event/comet_phase_5/end
#
# アニメーションイベントハンドラ 彗星・後隙
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_5/main

# 待機に移行
    function animated_java:valk_aj/animations/lance_idle_short/tween {duration:1, to_frame: 1}
