#> mhdp_monster_valk:core/tick/animation/event/lance_move/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_move/main

# 移動対象消去
    kill @e[type=area_effect_cloud,tag=Mns.MovePos.Valk]

# 行動選択
    execute if entity @s[tag=Mns.Temp.Valk.MoveToSpin] run function mhdp_monster_valk:core/tick/animation/change/play/spear_to_spin
    function mhdp_monster_valk:core/tick/animation/change/main
