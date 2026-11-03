#> mhdp_monster_reus:core/tick/animation/change/play/dash
#
# アニメーション変更処理 突進
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度正面にいる場合、通常の突進
    execute facing entity @n[tag=Mns.Target.Reus] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.8] at @s run tag @s add Anim.Dash.Start

# ターゲットが左右どちらにいるか確認
    execute facing entity @e[tag=Mns.Target.Reus,limit=1] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right,tag=!Anim.Dash.Start] run tag @s add Anim.Dash.Start.R
    execute if entity @s[tag=!Mns.Temp.Right,tag=!Anim.Dash.Start] run tag @s add Anim.Dash.Start.L

# 移動回数設定
    scoreboard players set @s Mns.Reus.DashCount 3
    execute if entity @n[tag=Mns.Target.Reus,distance=..16] run scoreboard players set @s Mns.Reus.DashCount 2
    execute if entity @n[tag=Mns.Target.Reus,distance=..8] run scoreboard players set @s Mns.Reus.DashCount 1

# 終了
    tag @s remove Mns.Temp.Right
