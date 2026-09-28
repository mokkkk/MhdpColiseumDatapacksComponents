#> mhdp_monster_valk:core/tick/animation/event/state_paralysis/end
#
# アニメーションイベントハンドラ 麻痺
#
# @within function mhdp_monster_valk:core/tick/animation/event/state_paralysis/main

# 待機に移行
    function animated_java:valk_aj/animations/lance_idle_short/tween {duration:1, to_frame: 1}
