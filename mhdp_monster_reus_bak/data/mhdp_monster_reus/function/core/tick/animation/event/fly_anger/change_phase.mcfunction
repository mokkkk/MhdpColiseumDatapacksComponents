#> mhdp_monster_reus:core/tick/animation/event/fly_anger/change_phase
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# フェーズ変更
    tag @s add Mns.Reus.State.Flying
    scoreboard players set @s Mns.Reus.PhaseCount 0
