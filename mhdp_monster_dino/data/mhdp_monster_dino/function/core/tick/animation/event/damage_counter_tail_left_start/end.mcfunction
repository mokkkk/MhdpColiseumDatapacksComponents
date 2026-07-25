#> mhdp_monster_dino:core/tick/animation/event/damage_counter_head_start/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/damage_counter_head_start/main

# 怯みに移行
    function animated_java_dino:dino/animations/damage_counter_mirror/tween {duration:1, to_frame: 1}
