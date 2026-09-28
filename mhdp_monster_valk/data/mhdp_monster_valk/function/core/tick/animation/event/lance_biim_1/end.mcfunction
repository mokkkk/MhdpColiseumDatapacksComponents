#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/end
#
# アニメーションイベントハンドラ 龍閃 (溜め)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/main

# フェーズ2に移行
    function animated_java_valk:valk/animations/lance_biim_2/tween {duration:1, to_frame: 1}
