#> mhdp_monster_dino:core/tick/animation/event/down_left/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/down_left/main

# カウント
    scoreboard players remove @s Mns.General.DownCount 1

# ダウン継続
    execute if score @s Mns.General.DownCount matches 1.. run return run function animated_java:dino_aj/animations/down_left/tween {duration:1, to_frame: 1}

# 起き上がり
    function animated_java:dino_aj/animations/down_end_left/tween {duration:1, to_frame: 1}
