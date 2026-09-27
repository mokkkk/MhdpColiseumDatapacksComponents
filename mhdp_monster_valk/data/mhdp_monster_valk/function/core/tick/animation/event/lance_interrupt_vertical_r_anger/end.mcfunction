#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r_anger/end
#
# アニメーションイベントハンドラ 割り込み 翼槍叩きつけ R (怒り)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r_anger/main

# 叩きつけに遷移
    function animated_java_valk:valk/animations/lance_vertical_r_to_l/tween {duration:0, to_frame: 8}
