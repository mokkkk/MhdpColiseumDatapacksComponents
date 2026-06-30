#> mhdp_monster_dino:core/tick/animation/change/main_relax
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# スコア加算
    scoreboard players add @s Mns.General.EcologyCount 1

# 生態行動と移動を交互に繰り返す
    execute if score @s Mns.General.EcologyCount matches 1 run tag @s add Anim.Ecology
    execute unless entity @s[tag=Anim.Ecology] run function mhdp_monster_dino:core/tick/animation/change/play/relax_walk

# 終了
    execute if score @s Mns.General.EcologyCount matches 2.. run scoreboard players set @s Mns.General.EcologyCount 0
