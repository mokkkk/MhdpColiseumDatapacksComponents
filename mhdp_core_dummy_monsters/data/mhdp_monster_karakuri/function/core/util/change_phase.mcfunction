#> mhdp_monster_karakuri:core/util/change_phase
#
# フェーズ変更
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 効果音
    execute at @a[tag=Ply.State.IsTraining,tag=!Ply.State.IsSilent] run playsound ui.button.click master @p ~ ~1 ~ 2 1

# スコア増加
    scoreboard players add @s Mns.General.DummyCounter 1
    execute if score @s Mns.General.DummyCounter matches 2.. run scoreboard players set @s Mns.General.DummyCounter 0

# 待機
    execute if score @s Mns.General.DummyCounter matches ..0 run return run function mhdp_monster_karakuri:core/util/change_phase_idle
# 攻撃
    execute if score @s Mns.General.DummyCounter matches 1.. run return run function mhdp_monster_karakuri:core/util/change_phase_attack
