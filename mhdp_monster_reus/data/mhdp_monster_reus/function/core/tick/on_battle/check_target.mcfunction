#> mhdp_monster_reus:core/tick/on_battle/check_target
#
# tick処理 戦闘中 ターゲット確認
#
# @within function mhdp_monster_reus:core/tick/animation/change/main

# ターゲットが同じエリアに居るか確認
    execute as @a[tag=Mns.Target.Reus,tag=!Mns.Candidate.Reus] run tag @s remove Mns.Target.Reus

# ターゲットが存在しない場合、新しいターゲットを決定する
    execute unless entity @a[tag=Mns.Target.Reus] run function mhdp_monster_reus:core/tick/on_battle/update_target
