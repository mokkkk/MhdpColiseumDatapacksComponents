#> mhdp_monster_reus:core/tick/animation/change/on_battle/first
#
# アニメーション変更処理 初回遭遇時
#
# @within function mhdp_monster_reus:core/tick/animation/change/on_battle/main

# 咆哮
    tag @s add Anim.Voice

# 軸合わせ
    tag @s add Mns.Temp.IsTurn
    scoreboard players set @s Mns.General.TurnCount 2
