#> mhdp_monster_valk:core/tick/animation/change/play/vertical
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 前方確認
    execute facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..1.35] at @s run tag @s add Mns.Temp.Forward

# 怒り中、確率でアッパーを使用
    execute if entity @s[tag=Mns.State.IsAnger] if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Mns.Temp.IsUpper

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.IsUpper,tag=!Mns.Temp.Right] run tag @s add Anim.Upper.R
    execute if entity @s[tag=Mns.Temp.IsUpper,tag=Mns.Temp.Right] run tag @s add Anim.Upper.L
    execute if entity @s[tag=Mns.Temp.Right,tag=!Mns.Temp.Forward,tag=!Mns.Temp.IsUpper] run tag @s add Anim.Vertical.Turn.L
    execute if entity @s[tag=!Mns.Temp.Right,tag=!Mns.Temp.Forward,tag=!Mns.Temp.IsUpper] run tag @s add Anim.Vertical.Turn.R
    execute if entity @s[tag=Mns.Temp.Forward,tag=Mns.Temp.Right,tag=!Mns.Temp.IsUpper] run tag @s add Anim.Vertical.R
    execute if entity @s[tag=Mns.Temp.Forward,tag=!Mns.Temp.Right,tag=!Mns.Temp.IsUpper] run tag @s add Anim.Vertical.L

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Right
    tag @s remove Mns.Temp.IsUpper

