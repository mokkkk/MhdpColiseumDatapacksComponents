#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter/end
#
# アニメーションイベントハンドラ 怯み・反撃硬直
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter/main

# 怯み終了に移行
    function animated_java_valk:valk/animations/lance_damage_counter_end/tween {duration:1, to_frame: 1}
