#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_mirror/end
#
# アニメーションイベントハンドラ 怯み・反撃硬直 (ミラー)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_mirror/main

# 怯み終了に移行
    function animated_java_valk:valk/animations/lance_damage_counter_end_mirror/tween {duration:1, to_frame: 1}
