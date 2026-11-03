#> mhdp_monster_reus:core/tick/animation/event/land_dash_start/end
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_dash_start/main

# 回数
    scoreboard players remove @s Mns.Reus.DashCount 1

# ループ
    execute if score @s Mns.Reus.DashCount matches 1.. run function animated_java:reus_aj/animations/land_dash/tween {duration:1, to_frame: 1}

# 終了
    execute if score @s Mns.Reus.DashCount matches ..0 run function animated_java:reus_aj/animations/land_dash_bite/tween {duration:1, to_frame: 1}
