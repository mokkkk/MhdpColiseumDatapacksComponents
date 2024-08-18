#> mhdp_monster_dino:core/tick/animation/event/damage_down_right/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/damage_down_right/main

# ダウンに移行
    function animated_java:dino_aj/animations/down_right/tween {duration:1, to_frame: 1}
    