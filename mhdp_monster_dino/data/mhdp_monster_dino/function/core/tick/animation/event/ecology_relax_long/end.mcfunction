#> mhdp_monster_ranposu:core/tick/animation/event/idle/end
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/idle/main

# 待機に戻る
    function animated_java_ranposu:ranposu/animations/idle_relax/tween {duration:1, to_frame: 0}
