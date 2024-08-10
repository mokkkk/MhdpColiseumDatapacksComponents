#> mhdp_monster_reus:core/tick/animation/change/random/land_to_fly
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/random/main

# 近くに攻撃対象がいる場合、確率でBjb
    execute if entity @n[tag=Mns.Target.Reus,distance=..8] if predicate {"condition":"minecraft:random_chance","chance":0.7} run tag @s add Anim.Bjb
# それ以外の場合、通常の飛行開始
    execute if entity @s[tag=!Anim.Bjb] run tag @s add Anim.Fly.Start

# 軸合わせ
    execute if entity @s[tag=Anim.Bjb] run tag @s add Mns.Temp.IsTurn

# 終了
    execute if entity @s[tag=Mns.Temp.IsTurn] run scoreboard players set @s Mns.General.TurnCount 2
