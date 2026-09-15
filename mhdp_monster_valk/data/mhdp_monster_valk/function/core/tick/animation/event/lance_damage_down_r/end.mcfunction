#> mhdp_monster_valk:core/tick/animation/event/lance_damage_down_r/end
#
# アニメーションイベントハンドラ 怯み・ダウン (右)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_down_r/main

# ダウンに移行
    function animated_java_valk:valk/animations/lance_down_r/tween {duration:1, to_frame: 1}
