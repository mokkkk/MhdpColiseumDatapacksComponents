#> mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_r/end
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_r/main

# 突進に移行
    function animated_java:reus_aj/animations/land_dash/tween {duration:1, to_frame: 1}