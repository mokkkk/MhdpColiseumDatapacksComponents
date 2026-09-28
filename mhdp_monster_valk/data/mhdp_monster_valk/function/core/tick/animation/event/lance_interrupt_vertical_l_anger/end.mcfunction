#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_l_anger/end
#
# アニメーションイベントハンドラ 割り込み 翼槍叩きつけ L (怒り)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_l_anger/main

# 叩きつけに遷移
    function animated_java_valk:valk/animations/lance_vertical_l_to_r/tween {duration:0, to_frame: 8}
