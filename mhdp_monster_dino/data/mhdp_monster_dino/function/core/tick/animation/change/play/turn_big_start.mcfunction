#> mhdp_monster_dino:core/tick/animation/change/play/turn_big_start
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットとの角度が一定以下の場合、実行しない
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..1.3] run return 99

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 再生アニメーション決定
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat,tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_big_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_big_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_bite_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Right] run function animated_java:dino_aj/animations/turn_bite_l/tween {duration:1, to_frame: 1}

# 終了
    tag @s remove Mns.Temp.Right
