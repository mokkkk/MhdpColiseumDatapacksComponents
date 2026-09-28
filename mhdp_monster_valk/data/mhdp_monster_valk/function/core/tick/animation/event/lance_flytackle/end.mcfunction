#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle/end
#
# アニメーションイベントハンドラ 滑空突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main_sub

# ターゲット消去
    kill @e[type=area_effect_cloud,tag=Mns.MovePos.Valk]

# 停止に遷移
    scoreboard players remove @s Mns.Valk.JetCount 1
    execute unless score @s Mns.Valk.JetCount matches 1.. run function animated_java_valk:valk/animations/lance_flytackle_end/tween {duration:1, to_frame: 0}
    execute if score @s Mns.Valk.JetCount matches 1.. run function animated_java_valk:valk/animations/lance_flytackle_repeat/tween {duration:1, to_frame: 0}

# 終了
    tag @s add Mns.Temp.Valk.EndFlyTackle
