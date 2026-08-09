#> mhdp_monster_ranposu:core/tick/animation/change/on_battle/turn
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

# 移動
    execute if entity @s[tag=Anim.Move] run tag @s add Mns.Temp.IsTurn
# 噛みつき
    execute if entity @s[tag=Anim.Bite] run tag @s add Mns.Temp.IsTurn
# 2連噛みつき
    execute if entity @s[tag=Anim.BiteDouble] run tag @s add Mns.Temp.IsTurn
# 移動引っかき
    execute if entity @s[tag=Anim.BreathBack] run tag @s add Mns.Temp.IsTurn
# ブレス
    execute if entity @s[tag=Anim.Breath] run tag @s add Mns.Temp.IsTurn
# 3連ブレス
    execute if entity @s[tag=Anim.BreathTriple] run tag @s add Mns.Temp.IsTurn

# 軸合わせ回数
    execute if entity @s[tag=Mns.Temp.IsTurn] run scoreboard players set @s Mns.General.TurnCount 1
