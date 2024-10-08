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

# 移動
    execute if entity @s[tag=Anim.Move] run function animated_java:dino_aj/animations/move/tween {duration:1, to_frame: 1}

# 車庫入れ
    execute if entity @s[tag=Anim.MoveBack] run function animated_java:dino_aj/animations/move_back/tween {duration:1, to_frame: 1}

# サイドステップ
    execute if entity @s[tag=Anim.Step.R] run function animated_java:dino_aj/animations/step_side_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Step.L] run function animated_java:dino_aj/animations/step_side_l/tween {duration:1, to_frame: 1}

# 咆哮
    execute if entity @s[tag=Anim.Voice] run function animated_java:dino_aj/animations/voice/tween {duration:1, to_frame: 1}

# ブレス
    execute if entity @s[tag=Anim.Breath] run function animated_java:dino_aj/animations/breath/tween {duration:1, to_frame: 1}

# 3連ブレス
    execute if entity @s[tag=Anim.Breath.Triple] run function animated_java:dino_aj/animations/breath_triple/tween {duration:1, to_frame: 1}

# バックジャンプブレス
    execute if entity @s[tag=Anim.Breath.Back] run function animated_java:dino_aj/animations/breath_backstep/tween {duration:1, to_frame: 1}

# 移動ブレス
    execute if entity @s[tag=Anim.Breath.Move.R] run function animated_java:dino_aj/animations/breath_move_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Breath.Move.L] run function animated_java:dino_aj/animations/breath_move_l/tween {duration:1, to_frame: 1}

# 噛みつき
    execute if entity @s[tag=Anim.Bite] run function animated_java:dino_aj/animations/bite/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.BiteToTail] run function animated_java:dino_aj/animations/bite_to_tail/tween {duration:1, to_frame: 1}

# 2連噛みつき
    execute if entity @s[tag=Anim.BiteDouble,tag=!Mns.State.IsAnger] run function animated_java:dino_aj/animations/bite_double_normal/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.BiteDouble,tag=Mns.State.IsAnger] run function animated_java:dino_aj/animations/bite_double_anger/tween {duration:1, to_frame: 1}

# 尻尾攻撃
    execute if entity @s[tag=Anim.Tail.R] run function animated_java:dino_aj/animations/tail_attack_r/tween {duration:4, to_frame:2}
    execute if entity @s[tag=Anim.Tail.L] run function animated_java:dino_aj/animations/tail_attack_l/tween {duration:4, to_frame:2}
    execute if entity @s[tag=Anim.Tail.Anger.R] run function animated_java:dino_aj/animations/tail_attack_anger_r/tween {duration:4, to_frame:2}
    execute if entity @s[tag=Anim.Tail.Anger.L] run function animated_java:dino_aj/animations/tail_attack_anger_l/tween {duration:4, to_frame:2}
    execute if entity @s[tag=Anim.Tail.Step.R] run function animated_java:dino_aj/animations/tail_attack_r_to_step_r/tween {duration:4, to_frame:2}
    execute if entity @s[tag=Anim.Tail.Step.L] run function animated_java:dino_aj/animations/tail_attack_l_to_step_l/tween {duration:4, to_frame:2}
# 尻尾攻撃・側面
    execute if entity @s[tag=Anim.TailSide.R] run function animated_java:dino_aj/animations/tail_side_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailSide.L] run function animated_java:dino_aj/animations/tail_side_l/tween {duration:1, to_frame: 1}

# 尻尾攻撃・背面
    execute if entity @s[tag=Anim.TailBack.R] run function animated_java:dino_aj/animations/tail_back_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailBack.L] run function animated_java:dino_aj/animations/tail_back_l/tween {duration:1, to_frame: 1}

# 尻尾攻撃・飛びかかり
    execute if entity @s[tag=Anim.TailJump.R,tag=!Mns.State.IsAnger] run function animated_java:dino_aj/animations/jump_tail_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailJump.L,tag=!Mns.State.IsAnger] run function animated_java:dino_aj/animations/jump_tail_l/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailJump.R,tag=Mns.State.IsAnger] run function animated_java:dino_aj/animations/jump_tail_anger_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailJump.L,tag=Mns.State.IsAnger] run function animated_java:dino_aj/animations/jump_tail_anger_l/tween {duration:1, to_frame: 1}

# 火炎
    execute if entity @s[tag=Anim.TailFlame.R] run function animated_java:dino_aj/animations/tail_flame_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailFlame.L] run function animated_java:dino_aj/animations/tail_flame_l/tween {duration:1, to_frame: 1}

# 大回転斬り
    execute if entity @s[tag=Anim.Round] run function animated_java:dino_aj/animations/roundforce/tween {duration:1, to_frame: 1}

# 研ぎ
    execute if entity @s[tag=Anim.Polish] run function animated_java:dino_aj/animations/polish/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
