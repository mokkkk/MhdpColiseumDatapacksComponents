#> mhdp_monster_valk:core/tick/animation/event/lance_charge_start/end
#
# アニメーションイベントハンドラ 龍気吸引・開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_charge_start/main

# カウントリセット
    scoreboard players set @s Mns.Valk.ChargeCount 1

# 龍気吸引に遷移
    function animated_java:valk_aj/animations/lance_charge/tween {duration:1, to_frame: 1}
