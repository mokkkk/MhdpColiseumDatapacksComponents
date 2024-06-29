#> mhdp_monster_ranposu:core/tick/animation/event/turn_right/end
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/turn_right/main

# 軸合わせ回数が残っており、まだ角度が付いている場合、再度軸合わせを行う
    execute facing entity @n[tag=Mns.Target.Ranposu] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.5] at @s run tag @s add Mns.Temp.NoTurn
    scoreboard players remove @s Mns.General.TurnCount 1
    execute if entity @s[tag=!Mns.Temp.NoTurn] if score @s Mns.General.TurnCount matches 1.. run tag @s add Mns.Temp.IsTurn
    tag @s remove Mns.Temp.NoTurn
    
# 行動選択
    function mhdp_monster_ranposu:core/tick/animation/change/main
