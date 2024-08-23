#> mhdp_monster_dino:core/tick/animation/event/idle/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_dino:core/tick/animation/event/idle/main

# 回数
    scoreboard players remove @s Mns.Dino.DashCount 1

# ループ
    execute if score @s Mns.Dino.DashCount matches 1.. run function animated_java:dino_aj/animations/move/tween {duration:1, to_frame: 1}

# 終了
    execute if score @s Mns.Dino.DashCount matches ..0 run function mhdp_monster_dino:core/tick/animation/event/move/change
