#> mhdp_monster_reus:core/tick/animation/change/play/turn
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度正面にいる場合、実行しない
    execute facing entity @n[tag=Mns.Target.Reus] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.25] at @s run return 99

# ターゲットが左右どちらにいるか確認
    execute facing entity @e[tag=Mns.Target.Reus,limit=1] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right,tag=!Mns.State.IsFlying] run function animated_java:reus_aj/animations/land_turn_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=!Mns.Temp.Right,tag=!Mns.State.IsFlying] run function animated_java:reus_aj/animations/land_turn_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.State.IsFlying] run function animated_java:reus_aj/animations/fly_turn/tween {duration:1, to_frame: 1}

# 終了
    tag @s remove Mns.Temp.Right
