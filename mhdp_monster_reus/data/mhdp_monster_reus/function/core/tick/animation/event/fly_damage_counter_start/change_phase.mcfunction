#> mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/change_phase
#
# アニメーションイベントハンドラ 飛行中相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# フェーズ変更
    tag @s remove Mns.Reus.State.Flying
    scoreboard players set @s Mns.Reus.PhaseCount 0
