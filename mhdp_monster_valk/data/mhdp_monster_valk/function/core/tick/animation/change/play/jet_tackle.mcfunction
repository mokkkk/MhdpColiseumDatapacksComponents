#> mhdp_monster_valk:core/tick/animation/change/play/jet_tackle
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 怒り状態の場合、一定確率で往復
    scoreboard players set @s Mns.Valk.JetCount 1
    # execute if entity @s[tag=Mns.State.IsAnger] if predicate {"condition":"minecraft:random_chance","chance":0.6} run scoreboard players set @s Mns.Valk.JetCount 2
    execute if predicate {"condition":"minecraft:random_chance","chance":0.6} run scoreboard players set @s Mns.Valk.JetCount 2

# 再生アニメーション決定
    tag @s add Anim.JetTackle
