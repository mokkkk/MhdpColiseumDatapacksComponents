#> mhdp_monster_valk:core/tick/animation/event/lance_damage_head/end
#
# アニメーションイベントハンドラ 怯み・頭
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_head/main

# 怯み終了に移行
    function animated_java:valk_aj/animations/lance_damage_counter_end_mirror/tween {duration:1, to_frame: 1}
