#> mhdp_monster_dino:core/tick/animation/event/damage_counter/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/damage_counter/main

# 怯み終了に移行
    function animated_java_dino:dino/animations/damage_counter_end/tween {duration:1, to_frame: 1}
