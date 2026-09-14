#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/end
#
# アニメーションイベントハンドラ 滑空突進折り返し
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/main

# 移動に遷移
    function animated_java_valk:valk/animations/lance_flytackle/tween {duration:1, to_frame: 0}
