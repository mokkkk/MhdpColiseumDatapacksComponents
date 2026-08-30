#> mhdp_monster_valk:core/tick/on_battle/check_target
#
# tick処理 戦闘中 ターゲット確認
#
# @within function mhdp_monster_valk:core/tick/animation/change/main

# ターゲットが同じエリアに居るか確認
    execute as @a[tag=Mns.Target.Valk,tag=!Mns.Candidate.Valk] run tag @s remove Mns.Target.Valk

# ターゲットが存在しない場合、新しいターゲットを決定する
    execute unless entity @a[tag=Mns.Target.Valk] run function mhdp_monster_valk:core/tick/on_battle/update_target
