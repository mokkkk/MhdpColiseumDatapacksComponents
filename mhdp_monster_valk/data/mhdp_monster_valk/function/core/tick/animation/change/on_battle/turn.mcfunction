#> mhdp_monster_valk:core/tick/animation/change/on_battle/turn
#
# 軸合わせ要否確認 (各距離別選択の末尾で呼ぶ)
#
# @within function mhdp_monster_valk:core/tick/animation/change/on_battle/main

# 軸合わせが必要な行動
    execute if entity @s[tag=Anim.Bite] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Tackle] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.JetTackle] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.MoveStart.Lance] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Sault] run tag @s add Mns.Temp.IsTurn

# 軸合わせ回数
    execute if entity @s[tag=Mns.Temp.IsTurn] run scoreboard players set @s Mns.General.TurnCount 1
