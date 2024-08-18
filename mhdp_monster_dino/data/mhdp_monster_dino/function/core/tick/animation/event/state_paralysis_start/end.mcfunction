#> mhdp_monster_dino:core/tick/animation/event/state_paralysis_start/end
#
# アニメーションイベントハンドラ 麻痺1開始
#
# @within function mhdp_monster_dino:core/tick/animation/event/state_paralysis_start/main

# 麻痺に移行
    function animated_java:dino_aj/animations/state_paralysis/tween {duration:1, to_frame: 1}
