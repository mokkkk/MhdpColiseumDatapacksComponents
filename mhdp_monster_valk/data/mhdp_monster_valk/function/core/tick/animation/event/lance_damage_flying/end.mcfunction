#> mhdp_monster_valk:core/tick/animation/event/lance_damage_flying/end
#
# アニメーションイベントハンドラ 怯み・頭
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_damage_flying/main

# ダウンに移行
    execute if score @s Mns.General.DownCount matches 1.. run return run function animated_java:valk_aj/animations/lance_down_l/tween {duration:1, to_frame: 1}
    function animated_java:valk_aj/animations/lance_down_end_l/tween {duration:1, to_frame: 1}
