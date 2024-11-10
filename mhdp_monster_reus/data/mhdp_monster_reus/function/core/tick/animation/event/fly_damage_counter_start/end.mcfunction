#> mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/end
#
# アニメーションイベントハンドラ 飛行中相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/main

# 怯みに遷移
    function animated_java:reus_aj/animations/land_damage_counter/tween {duration:1, to_frame: 1}
