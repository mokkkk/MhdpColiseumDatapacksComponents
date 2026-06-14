#> mhdp_monster_ranposu:core/tick/animation/event/down/end
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/down/main

# カウント
    scoreboard players remove @s Mns.General.DownCount 1

# ダウン継続
    execute if score @s Mns.General.DownCount matches 1.. run return run function animated_java_ranposu:ranposu/animations/down/tween {duration:1, to_frame: 1}

# 起き上がり
    function animated_java_ranposu:ranposu/animations/down_end/tween {duration:1, to_frame: 1}
