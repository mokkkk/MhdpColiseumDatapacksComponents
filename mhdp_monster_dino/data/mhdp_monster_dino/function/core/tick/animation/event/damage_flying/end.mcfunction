#> mhdp_monster_dino:core/tick/animation/event/damage_flying/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/damage_flying/main

# ダウンに移行
    function animated_java_dino:dino/animations/down_left/tween {duration:1, to_frame: 1}
    