#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_spin_l/end
#
# アニメーションイベントハンドラ 割り込み 翼槍回転斬り L
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_spin_l/main

# 待機に移行
    function animated_java_valk:valk/animations/lance_idle_short/tween {duration:1, to_frame: 1}
