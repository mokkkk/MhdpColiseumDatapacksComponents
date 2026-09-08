#> mhdp_monster_valk:core/tick/animation/event/lance_upper_r/end
#
# アニメーションイベントハンドラ 翼槍突き上げ
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/main

# 待機に移行
    function animated_java_valk:valk/animations/lance_idle_short/tween {duration:1, to_frame: 1}
