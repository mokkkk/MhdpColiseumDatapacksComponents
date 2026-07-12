#> mhdp_monster_dino:core/tick/animation/change/play/turn
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度正面にいる場合、実行しない
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.25] at @s run return run tag @s remove Mns.Temp.IsTurn

# ターゲットが左右どちらにいるか確認
    execute facing entity @e[tag=Mns.Target.Dino,limit=1] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# ターゲットとの距離確認
    execute if entity @n[tag=Mns.Target.Dino,distance=..10] run tag @s add Mns.Temp.Near

# ターゲットとの角度差計算
    execute rotated ~ 0 run function api:bounding/cake.m {Selector:"@n[tag=Mns.Target.Dino,distance=..100]",Tag:"Mns.Temp.Situation.InFov",Radius:100.0,Height:15.0,Angle:90.0}
    execute if entity @n[tag=Mns.Temp.Situation.InFov,distance=..100] run tag @s add Mns.Temp.IsTurnSmall
    tag @n[tag=Mns.Temp.Situation.InFov,distance=..100] remove Mns.Temp.Situation.InFov

# 再生アニメーション決定
    # 通常時
        execute if entity @s[tag=Mns.Temp.Right,tag=Mns.Temp.IsTurnSmall,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/animations/turn_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=!Mns.Temp.Right,tag=Mns.Temp.IsTurnSmall,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/animations/turn_l/tween {duration:1, to_frame: 1}
    # 大回り
        execute if entity @s[tag=Mns.Temp.Right,tag=!Mns.Temp.IsTurnSmall,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/animations/turn_big_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=!Mns.Temp.Right,tag=!Mns.Temp.IsTurnSmall,tag=!Mns.Dino.State.HeadHeat] run function animated_java_dino:dino/animations/turn_big_l/tween {duration:1, to_frame: 1}
    # 喉赤熱・通常時
        execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Right,tag=!Mns.Temp.Near] run function animated_java_dino:dino/animations/turn_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Right,tag=!Mns.Temp.Near] run function animated_java_dino:dino/animations/turn_l/tween {duration:1, to_frame: 1}
    # 喉赤熱・近距離
        execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Temp.Right,tag=Mns.Temp.Near] run function animated_java_dino:dino/animations/turn_bite_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Right,tag=Mns.Temp.Near] run function animated_java_dino:dino/animations/turn_bite_l/tween {duration:1, to_frame: 1}

# 終了
    tag @s remove Mns.Temp.Right
    tag @s remove Mns.Temp.IsTurnSmall
