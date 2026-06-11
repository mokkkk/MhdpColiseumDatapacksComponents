#> mhdp_monsters:core/util/damage/on_reaction_start
# 
# 汎用処理 怯み開始時の処理
#
# @within function mhdp_monsters:/**

# 一部状態タグを消去
    tag @s remove Mns.State.IsSearchObject
    tag @s remove Mns.State.OnObject

# 攻撃終了
    function mhdp_monsters:core/util/tick/event/end_attack
