#> mhdp_monster_ranposu:core/tick/animation/event/move/end
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/move/main

# オブジェクト探知終了
    tag @s remove Mns.State.IsSearchObject

# 行動選択
    function mhdp_monster_ranposu:core/tick/animation/change/main
