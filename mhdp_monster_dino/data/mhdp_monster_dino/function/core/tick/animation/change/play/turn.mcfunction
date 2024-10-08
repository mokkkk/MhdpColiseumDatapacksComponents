#> mhdp_monster_dino:core/tick/animation/change/play/turn
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度正面にいる場合、実行しない
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.3] at @s run return 99

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..1.3] at @s run tag @s add Mns.Temp.Forward
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right
    execute if entity @n[tag=Mns.Target.Dino,distance=..10] run tag @s add Mns.Temp.Near

# 再生アニメーション決定
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat,tag=Mns.Temp.Forward,tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat,tag=Mns.Temp.Forward,tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Forward,tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_big_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Forward,tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_big_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Forward,tag=!Mns.Temp.Near,tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Forward,tag=!Mns.Temp.Near,tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Forward,tag=Mns.Temp.Near,tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_bite_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Forward,tag=Mns.Temp.Near,tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_bite_l/tween {duration:1, to_frame: 1}

# 終了
    tag @s remove Mns.Temp.Right
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Near
