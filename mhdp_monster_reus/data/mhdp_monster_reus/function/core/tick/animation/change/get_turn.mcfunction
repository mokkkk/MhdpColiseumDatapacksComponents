#> mhdp_monster_ranposu:core/tick/animation/change/get_turn
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 軸合わせが必要な場合、IsTurnタグを付与
    execute if entity @s[tag=Anim.Voice] run tag @s add Mns.Temp.IsTurn
