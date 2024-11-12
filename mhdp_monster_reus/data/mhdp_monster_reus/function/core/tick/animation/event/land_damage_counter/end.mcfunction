#> mhdp_monster_reus:core/tick/animation/event/land_damage_head/end
#
# アニメーションイベントハンドラ 相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_damage_head/main

# 終了に遷移
    function animated_java:reus_aj/animations/land_damage_counter_end/tween {duration:1, to_frame: 1}
