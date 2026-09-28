#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_head_start/end
#
# アニメーションイベントハンドラ 怯み・反撃硬直開始 (頭)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_head_start/main

# 怯みに移行
    function animated_java_valk:valk/animations/lance_damage_counter/tween {duration:1, to_frame: 1}
