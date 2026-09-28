#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/end
#
# アニメーションイベントハンドラ 龍閃 (発射)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main

# 待機に移行
    function animated_java_valk:valk/animations/lance_idle_short/tween {duration:1, to_frame: 1}
