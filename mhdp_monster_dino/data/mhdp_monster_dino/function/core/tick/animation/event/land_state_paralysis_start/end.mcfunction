#> mhdp_monster_reus:core/tick/animation/event/land_state_paralysis_start/end
#
# アニメーションイベントハンドラ 麻痺1開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_state_paralysis_start/main

# 麻痺に移行
    function animated_java:reus_aj/animations/land_state_paralysis/tween {duration:1, to_frame: 1}
