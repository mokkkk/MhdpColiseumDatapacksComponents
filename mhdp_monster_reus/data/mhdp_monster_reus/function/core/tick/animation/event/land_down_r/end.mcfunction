#> mhdp_monster_reus:core/tick/animation/event/land_down_r/end
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_down_r/main

# カウント
    scoreboard players remove @s Mns.General.DownCount 1

# ダウン継続
    execute if score @s Mns.General.DownCount matches 1.. run return run function animated_java:reus_aj/animations/land_down_r/tween {duration:1, to_frame: 1}

# 起き上がり
    function animated_java:reus_aj/animations/land_down_end_r/tween {duration:1, to_frame: 1}
