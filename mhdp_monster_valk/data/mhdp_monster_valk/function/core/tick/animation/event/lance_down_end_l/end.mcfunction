#> mhdp_monster_valk:core/tick/animation/event/lance_down_end_l/end
#
# アニメーションイベントハンドラ ダウン起き上がり (左)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_down_end_l/main

# 状態リセット
    tag @s remove Mns.State.IsDown
    tag @s remove Mns.State.IsStun
    tag @s remove Mns.State.IsParalysis

# 行動選択
    function mhdp_monster_valk:core/tick/animation/change/main
