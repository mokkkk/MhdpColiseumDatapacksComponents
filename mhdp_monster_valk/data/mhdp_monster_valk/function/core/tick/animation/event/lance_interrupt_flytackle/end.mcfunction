#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_flytackle/end
#
# アニメーションイベントハンドラ 割り込み 滑空突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_flytackle/main

# ダウンに移行
    function animated_java_valk:valk/animations/lance_down_l/tween {duration:1, to_frame: 1}
