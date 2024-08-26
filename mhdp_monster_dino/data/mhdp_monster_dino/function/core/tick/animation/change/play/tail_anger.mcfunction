#> mhdp_monster_dino:core/tick/animation/change/play/tail_anger
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 確率でステップコンボを使用
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if predicate {"condition":"minecraft:random_chance","chance":0.35} run tag @s add Mns.Temp.Step
    execute if entity @s[tag=Mns.Dino.State.TailHeat] if predicate {"condition":"minecraft:random_chance","chance":0.6} run tag @s add Mns.Temp.Step

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right,tag=!Mns.Temp.Step] run tag @s add Anim.Tail.Anger.R
    execute if entity @s[tag=!Mns.Temp.Right,tag=!Mns.Temp.Step] run tag @s add Anim.Tail.Anger.L
    execute if entity @s[tag=Mns.Temp.Step,tag=Mns.Temp.Right] run tag @s add Anim.Tail.Step.R
    execute if entity @s[tag=Mns.Temp.Step,tag=!Mns.Temp.Right] run tag @s add Anim.Tail.Step.L

# 終了
    tag @s remove Mns.Temp.Right
    tag @s remove Mns.Temp.Step
