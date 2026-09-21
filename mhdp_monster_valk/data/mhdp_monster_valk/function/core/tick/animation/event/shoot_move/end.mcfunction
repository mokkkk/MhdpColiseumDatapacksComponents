#> mhdp_monster_valk:core/tick/animation/event/shoot_move/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_move/main

# 移動対象消去
    kill @e[type=area_effect_cloud,tag=Mns.MovePos.Valk]

# 行動選択
    return run function animated_java_valk:valk/animations/shoot_sault/tween {duration:1, to_frame: 1}

# フォールバック
    function mhdp_monster_valk:core/tick/animation/change/main
