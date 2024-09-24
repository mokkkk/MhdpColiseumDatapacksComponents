#> mhdp_monster_valk:core/tick/animation/event/lance_damage_down_l/end
#
# アニメーションイベントハンドラ 怯み・ダウン
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_down_l/main

# ダウンに移行
    function animated_java:valk_aj/animations/lance_down_l/tween {duration:1, to_frame: 1}
    