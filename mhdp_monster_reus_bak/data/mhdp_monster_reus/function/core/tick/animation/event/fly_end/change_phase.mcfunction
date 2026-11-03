#> mhdp_monster_reus:core/tick/animation/event/fly_end/change_phase
#
# アニメーションイベントハンドラ 着地
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# フェーズ変更
    tag @s remove Mns.Reus.State.Flying
    scoreboard players set @s Mns.Reus.PhaseCount 0
