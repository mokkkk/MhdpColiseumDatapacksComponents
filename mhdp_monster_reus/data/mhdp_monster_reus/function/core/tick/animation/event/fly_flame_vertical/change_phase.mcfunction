#> mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/change_phase
#
# アニメーションイベントハンドラ 地走り火炎
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# フェーズ変更
    tag @s remove Mns.Reus.State.Flying
    scoreboard players set @s Mns.Reus.PhaseCount 0
