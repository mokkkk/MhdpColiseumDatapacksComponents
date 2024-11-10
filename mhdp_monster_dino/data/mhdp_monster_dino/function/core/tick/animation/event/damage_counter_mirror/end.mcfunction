#> mhdp_monster_dino:core/tick/animation/event/damage_counter_mirror/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/damage_counter_mirror/main

# 怯み終了に移行
    function animated_java:dino_aj/animations/damage_counter_end_mirror/tween {duration:1, to_frame: 1}
