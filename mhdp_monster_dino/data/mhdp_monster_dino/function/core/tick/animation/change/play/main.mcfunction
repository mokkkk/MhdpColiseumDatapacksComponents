#> mhdp_monster_dino:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 待機
    execute if entity @s[tag=Anim.Idle] run function animated_java:dino_aj/animations/idle/tween {duration:1, to_frame: 1}

# 軸合わせ
    # execute if entity @s[tag=Anim.Turn.R] run function animated_java:dino_aj/animations/turn_right/tween {duration:1, to_frame: 1}
    # execute if entity @s[tag=Anim.Turn.L] run function animated_java:dino_aj/animations/turn_left/tween {duration:1, to_frame: 1}

# 咆哮
    execute if entity @s[tag=Anim.Voice] run function animated_java:dino_aj/animations/voice/tween {duration:1, to_frame: 1}

# ブレス
    execute if entity @s[tag=Anim.Breath] run function animated_java:dino_aj/animations/breath/tween {duration:1, to_frame: 1}

# 3連ブレス
    execute if entity @s[tag=Anim.Breath.Triple] run function animated_java:dino_aj/animations/breath_triple/tween {duration:1, to_frame: 1}

# 噛みつき
    execute if entity @s[tag=Anim.Bite] run function animated_java:dino_aj/animations/bite/tween {duration:1, to_frame: 1}

# 2連噛みつき
    execute if entity @s[tag=Anim.BiteDouble,tag=!Mns.State.IsAnger] run function animated_java:dino_aj/animations/bite_double_normal/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.BiteDouble,tag=Mns.State.IsAnger] run function animated_java:dino_aj/animations/bite_double_anger/tween {duration:1, to_frame: 1}

# 尻尾攻撃
    execute if entity @s[tag=Anim.Tail.R] run function animated_java:dino_aj/animations/tail_attack_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Tail.L] run function animated_java:dino_aj/animations/tail_attack_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Tail.Anger.R] run function animated_java:dino_aj/animations/tail_attack_anger_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Tail.Anger.L] run function animated_java:dino_aj/animations/tail_attack_anger_l/tween {duration:1, to_frame: 1}

# 尻尾攻撃・側面
    execute if entity @s[tag=Anim.TailSide.R] run function animated_java:dino_aj/animations/tail_side_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailSide.L] run function animated_java:dino_aj/animations/tail_side_l/tween {duration:1, to_frame: 1}

# 尻尾攻撃・背面
    execute if entity @s[tag=Anim.TailBack.R] run function animated_java:dino_aj/animations/tail_back_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailBack.L] run function animated_java:dino_aj/animations/tail_back_l/tween {duration:1, to_frame: 1}

# 尻尾攻撃・飛びかかり
    execute if entity @s[tag=Anim.TailJump.R] run function animated_java:dino_aj/animations/jump_tail_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailJump.L] run function animated_java:dino_aj/animations/jump_tail_l/tween {duration:1, to_frame: 1}
    # execute if entity @s[tag=Anim.TailJump.R] run function animated_java:dino_aj/animations/jump_tail_anger_r/tween {duration:1, to_frame: 1}
    # execute if entity @s[tag=Anim.TailJump.L] run function animated_java:dino_aj/animations/jump_tail_anger_l/tween {duration:1, to_frame: 1}

# 火炎
    execute if entity @s[tag=Anim.TailFlame.R] run function animated_java:dino_aj/animations/tail_flame_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailFlame.L] run function animated_java:dino_aj/animations/tail_flame_l/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
