#> mhdp_monster_ranposu:core/tick/on_battle/check_target
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットが同じエリアに居るか確認
    execute as @a[tag=Mns.Target.Ranposu,tag=!Mns.Candidate.Ranposu] run tag @s remove Mns.Target.Ranposu

# ターゲットが存在しない場合、新しいターゲットを決定する
    execute unless entity @a[tag=Mns.Target.Ranposu] run function mhdp_monster_ranposu:core/tick/on_battle/update_target

say check target