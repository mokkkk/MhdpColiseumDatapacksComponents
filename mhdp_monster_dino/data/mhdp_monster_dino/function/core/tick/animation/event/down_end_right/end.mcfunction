#> mhdp_monster_dino:core/tick/animation/event/down_end_right/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/down_end_right/main

# 状態リセット
    tag @s remove Mns.State.IsDown
    tag @s remove Mns.State.IsStun
    tag @s remove Mns.State.IsParalysis

# 行動選択
    function mhdp_monster_dino:core/tick/animation/change/main
