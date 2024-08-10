#> mhdp_monster_reus:core/tick/animation/change/random/fly_to_land
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/random/main

# 攻撃対象が遠い場合、確率で3連ブレス
    execute if predicate {"condition":"minecraft:random_chance","chance":0.6} run tag @s add Anim.Fly.TripleBreath
# それ以外の場合、地走り火炎
    execute if entity @s[tag=!Anim.Bjb] if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Anim.Fly.Flame.Vertical
# どちらでもない場合、通常着地
    execute if entity @s[tag=!Anim.Fly.TripleBreath,tag=!Anim.Fly.Flame.Vertical] run tag @s add Anim.Fly.End
