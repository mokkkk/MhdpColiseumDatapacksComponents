#> mhdp_monster_dino:core/tick/animation/event/tail_interrupt_long_r/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tail_interrupt_long_r/main

# 短威嚇に遷移
    function animated_java_dino:dino/animations/idle_short/tween {duration:1, to_frame: 1}
