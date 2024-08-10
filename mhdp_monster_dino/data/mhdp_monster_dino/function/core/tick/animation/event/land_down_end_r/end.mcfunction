#> mhdp_monster_reus:core/tick/animation/event/land_down_end_r/end
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_down_end_r/main

# 状態リセット
    tag @s remove Mns.State.IsDown
    tag @s remove Mns.State.IsStun
    tag @s remove Mns.State.IsParalysis

# 行動選択
    function mhdp_monster_reus:core/tick/animation/change/main
