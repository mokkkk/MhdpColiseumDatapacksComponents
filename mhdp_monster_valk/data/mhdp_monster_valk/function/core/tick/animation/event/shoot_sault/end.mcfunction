#> mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/end
#
# アニメーションイベントハンドラ 射撃
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/main

# 行動選択
    function mhdp_monster_valk:core/tick/animation/change/main

# 終了
    kill @e[type=area_effect_cloud,tag=Mns.ShotPos.Valk]
    kill @e[type=area_effect_cloud,tag=Mns.ShotPos.Valk2]
    kill @e[type=area_effect_cloud,tag=Mns.ShotPos.Valk3]