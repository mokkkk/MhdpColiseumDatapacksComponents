#> mhdp_monster_ranposu:core/tick/animation/event/state_paralysis/end
#
# アニメーションイベントハンドラ 麻痺
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis/main

# アニメーション再生
    function animated_java:ranposu_aj/animations/state_paralysis_end/tween {duration:1, to_frame: 0}
