#> mhdp_monster_valk:core/tick/animation/event/lance_down_r/end
#
# アニメーションイベントハンドラ 怯み・胴・腕・脚
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_down_r/main


# カウント
    scoreboard players remove @s Mns.General.DownCount 1

# ダウン継続
    execute if score @s Mns.General.DownCount matches 1.. run return run function animated_java:valk_aj/animations/lance_down_r/tween {duration:1, to_frame: 1}

# 起き上がり
    function animated_java:valk_aj/animations/lance_down_end_r/tween {duration:1, to_frame: 1}
