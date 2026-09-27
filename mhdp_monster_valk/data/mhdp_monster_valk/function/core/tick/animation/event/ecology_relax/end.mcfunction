#> mhdp_monster_valk:core/tick/animation/event/ecology_relax/end
#
# アニメーションイベントハンドラ 生態行動 (未発見時)
#
# @within function mhdp_monster_valk:core/tick/animation/event/ecology_relax/main

# 待機に戻る
    function animated_java_valk:valk/animations/idle_relax/tween {duration:1, to_frame: 0}
