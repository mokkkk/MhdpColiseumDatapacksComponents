#> mhdp_monster_valk:core/tick/animation/event/lance_charge/end
#
# アニメーションイベントハンドラ 龍気吸引
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_charge/main

# カウント増加
    scoreboard players add @s Mns.Valk.ChargeCount 1

# 継続
    execute if score @s Mns.Valk.ChargeCount matches ..6 run return run function animated_java:valk_aj/animations/lance_charge/tween {duration:1, to_frame: 1}

# 龍気吸引終了
    function animated_java:valk_aj/animations/lance_charge_end/tween {duration:1, to_frame: 1}
