#> mhdp_monster_ranposu:core/tick/animation/event/walk_relax/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/walk_relax/main

# スコアリセット
    scoreboard players reset @s Mns.General.WalkCount

# 待機に戻る
    function animated_java:ranposu/animations/idle_relax/tween {duration:5, to_frame: 5}
