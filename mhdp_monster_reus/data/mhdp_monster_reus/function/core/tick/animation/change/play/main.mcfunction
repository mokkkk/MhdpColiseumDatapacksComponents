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

# 怒り開始
    execute if entity @s[tag=Anim.Anger,tag=Mns.State.IsFlying] run function animated_java:reus_aj/animations/fly_anger/tween {duration:1, to_frame: 1}

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

# 床ドン
    execute if entity @s[tag=Anim.Jump] run function animated_java:reus_aj/animations/land_jump/tween {duration:1, to_frame: 1}

# バックステップ
    execute if entity @s[tag=Anim.Backstep] run function animated_java:reus_aj/animations/land_backstep/tween {duration:1, to_frame: 1}

# ブレス
    execute if entity @s[tag=Anim.Breath] run function animated_java:reus_aj/animations/land_breath/tween {duration:1, to_frame: 1}

# 移動
    execute if entity @s[tag=Anim.Move] run function animated_java:reus_aj/animations/land_move/tween {duration:1, to_frame: 1}

# 飛行開始
    execute if entity @s[tag=Anim.Fly.Start] run function animated_java:reus_aj/animations/land_to_fly/tween {duration:1, to_frame: 1}

# バックジャンプブレス
    execute if entity @s[tag=Anim.Bjb] run function animated_java:reus_aj/animations/land_bjb/tween {duration:1, to_frame: 1}

# 飛行回り込み
    execute if entity @s[tag=Anim.Fly.Move.R] run function animated_java:reus_aj/animations/fly_move_right/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Fly.Move.L] run function animated_java:reus_aj/animations/fly_move_left/tween {duration:1, to_frame: 1}

# ひっかき
    execute if entity @s[tag=Anim.Fly.Attack] run function animated_java:reus_aj/animations/fly_attack/tween {duration:1, to_frame: 1}

# 飛行嚙みつき
    execute if entity @s[tag=Anim.Fly.Bite] run function animated_java:reus_aj/animations/fly_bite/tween {duration:1, to_frame: 1}

# 飛行嚙みつき
    execute if entity @s[tag=Anim.Fly.Tail] run function animated_java:reus_aj/animations/fly_tail/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
