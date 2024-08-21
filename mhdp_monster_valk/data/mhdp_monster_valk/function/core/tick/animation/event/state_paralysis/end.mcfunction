#> mhdp_monster_dino:core/tick/animation/event/state_paralysis/end
#
# アニメーションイベントハンドラ 麻痺
#
# @within function mhdp_monster_dino:core/tick/animation/event/idle/main

# アニメーション再生
    function animated_java:dino_aj/animations/state_paralysis_end/tween {duration:1, to_frame: 0}
