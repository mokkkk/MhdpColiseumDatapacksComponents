#> mhdp_monster_ranposu:core/tick/animation/change/play/turn
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度正面にいる場合、実行しない
    execute facing entity @n[tag=Mns.Target.Ranposu] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.5] at @s run return 0

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Ranposu] feet positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right] run tag @s add Anim.Turn.R
    execute unless entity @s[tag=Mns.Temp.Right] run tag @s add Anim.Turn.L

# 終了
    tag @s remove Mns.Temp.Right
