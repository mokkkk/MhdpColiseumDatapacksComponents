#> mhdp_monster_valk:core/tick/animation/event/lance_upper_l/end
#
# アニメーションイベントハンドラ 翼槍突き上げ
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/main

# 待機に移行
    function animated_java_valk:valk/animations/lance_idle_short/tween {duration:1, to_frame: 1}
