#> mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_start/end
#
# アニメーションイベントハンドラ 麻痺開始
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis_start/main

# アニメーション再生
    function animated_java:ranposu_aj/animations/state_paralysis/tween {duration:1, to_frame: 0}
