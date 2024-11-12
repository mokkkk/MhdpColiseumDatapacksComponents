#> mhdp_monster_reus:core/tick/animation/event/land_damage_head/end
#
# アニメーションイベントハンドラ 相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_damage_head/main

# 怯みに遷移
    function animated_java:reus_aj/animations/land_damage_counter/tween {duration:1, to_frame: 1}
