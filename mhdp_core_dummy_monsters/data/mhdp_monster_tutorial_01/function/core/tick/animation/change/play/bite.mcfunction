#> mhdp_monster_dino:core/tick/animation/change/play/bite
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 確率で噛みつき尻尾コンボを使用
    execute if entity @s[tag=Mns.State.IsAnger] if predicate {"condition":"minecraft:random_chance","chance":0.75} run tag @s add Anim.BiteToTail

# 再生アニメーション決定
    execute if entity @s[tag=!Anim.BiteToTail] run tag @s add Anim.Bite
