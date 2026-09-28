#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/end
#
# アニメーションイベントハンドラ 翼槍回転斬り
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/main

# 待機に移行
    function animated_java:valk_aj/animations/lance_idle_short/tween {duration:1, to_frame: 1}