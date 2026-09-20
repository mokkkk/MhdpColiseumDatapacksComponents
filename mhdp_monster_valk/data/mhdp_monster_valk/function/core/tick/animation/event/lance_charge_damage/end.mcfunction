#> mhdp_monster_valk:core/tick/animation/event/lance_charge_damage/end
#
# アニメーションイベントハンドラ 龍気吸引・被弾
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_charge_damage/main

# ダウン時間設定
    scoreboard players set @s Mns.General.DownCount 8

# ダウンに移行
    function animated_java_valk:valk/animations/lance_down_l/tween {duration:1, to_frame: 1}
