#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle/end
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_voice/main

# ターゲット消去
    kill @e[type=area_effect_cloud,tag=Mns.MovePos.Valk]

# 停止に遷移
    function animated_java:valk_aj/animations/lance_flytackle_end/tween {duration:1, to_frame: 0}

# 終了
    tag @s add Mns.Temp.Valk.EndFlyTackle
