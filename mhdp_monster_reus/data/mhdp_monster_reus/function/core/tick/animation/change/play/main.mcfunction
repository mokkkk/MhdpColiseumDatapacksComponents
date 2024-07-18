#> mhdp_monster_reus:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 待機
    execute if entity @s[tag=Anim.Idle] run function animated_java:reus_aj/animations/land_idle/tween {duration:1, to_frame: 1}

# 軸合わせ
    # execute if entity @s[tag=Anim.Turn.R] run function animated_java:reus_aj/animations/turn_right/tween {duration:1, to_frame: 1}
    # execute if entity @s[tag=Anim.Turn.L] run function animated_java:reus_aj/animations/turn_left/tween {duration:1, to_frame: 1}

# 咆哮
    execute if entity @s[tag=Anim.Voice,tag=!Mns.State.IsFlying] run function animated_java:reus_aj/animations/land_voice/tween {duration:1, to_frame: 1}

# 突進
    execute if entity @s[tag=Anim.Dash.Start] run function animated_java:reus_aj/animations/land_dash_start/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Dash.Start.R] run function animated_java:reus_aj/animations/land_dash_start_turn_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Dash.Start.L] run function animated_java:reus_aj/animations/land_dash_start_turn_l/tween {duration:1, to_frame: 1}

# 尻尾回転
    execute if entity @s[tag=Anim.TailSpin.R] run function animated_java:reus_aj/animations/land_tail_spin_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailSpin.L] run function animated_java:reus_aj/animations/land_tail_spin_l/tween {duration:1, to_frame: 1}

# 嚙みつき
    execute if entity @s[tag=Anim.Bite.R] run function animated_java:reus_aj/animations/land_bite_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Bite.L] run function animated_java:reus_aj/animations/land_bite_l/tween {duration:1, to_frame: 1}

# チャージ嚙みつき
    execute if entity @s[tag=Anim.ChargeBite] run function animated_java:reus_aj/animations/land_chargebite/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
