#> mhdp_monster_valk:core/tick/animation/change/play/shoot
#
# アニメーション変更処理 射撃
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ランダム
    execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Anim.Shoot.F
    execute if entity @s[tag=!Anim.Shoot.F] run tag @s add Anim.Shoot.H
