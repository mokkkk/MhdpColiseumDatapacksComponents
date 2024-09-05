#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/end
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/main

# 移動に遷移
    function animated_java:valk_aj/animations/lance_flytackle/tween {duration:1, to_frame: 1}
