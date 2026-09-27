#> mhdp_monster_valk:core/tick/animation/event/walk_relax/end
#
# アニメーションイベントハンドラ 移動 (未発見時)
#
# @within function mhdp_monster_valk:core/tick/animation/event/walk_relax/main

# スコアリセット
    scoreboard players reset @s Mns.General.WalkCount

# 待機に戻る
    function animated_java_valk:valk/animations/idle_relax/tween {duration:10, to_frame: 10}
