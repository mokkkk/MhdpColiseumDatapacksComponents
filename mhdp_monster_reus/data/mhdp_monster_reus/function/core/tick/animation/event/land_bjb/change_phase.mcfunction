#> mhdp_monster_reus:core/tick/animation/event/land_bjb/change_phase
#
# アニメーションイベントハンドラ バックジャンプブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# フェーズ変更
    tag @s add Mns.Reus.State.Flying
    scoreboard players set @s Mns.Reus.PhaseCount 0
