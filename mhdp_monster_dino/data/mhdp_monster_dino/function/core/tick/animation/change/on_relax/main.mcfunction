#> mhdp_monster_dino:core/tick/animation/change/main_relax
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 低確率で生態行動
    execute if predicate {"condition":"minecraft:random_chance","chance":0.2} run tag @s add Anim.Ecology

# 移動
    execute unless entity @s[tag=Anim.Ecology] run function mhdp_monster_dino:core/tick/animation/change/play/relax_walk
