#> mhdp_monster_reus:core/tick/animation/event/land_idle/end
#
# アニメーションイベントハンドラ 飛行開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_idle/main

# 状態変化
    scoreboard players set @s Mns.Reus.PhaseCount 0
    tag @s add Mns.Reus.State.Flying

# 行動選択
    function mhdp_monster_reus:core/tick/animation/change/main
