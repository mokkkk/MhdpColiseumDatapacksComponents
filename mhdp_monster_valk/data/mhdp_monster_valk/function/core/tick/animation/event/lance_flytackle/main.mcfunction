#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main
#
# アニメーションイベントハンドラ 滑空突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動およびダメージ処理を複数回実行
    execute if entity @s[tag=!Mns.Temp.Valk.EndFlyTackle] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main_sub
    execute if entity @s[tag=!Mns.Temp.Valk.EndFlyTackle] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main_sub
    tag @s remove Mns.Temp.Valk.EndFlyTackle
