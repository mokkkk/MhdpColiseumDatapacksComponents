#> mhdp_monster_ranposu:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 移動
    execute if entity @s[tag=Anim.Walk] run function animated_java:ranposu/animations/walk_relax/tween {duration:5, to_frame: 5}

# 生態行動
    execute if entity @s[tag=Anim.Ecology] run function animated_java:ranposu/animations/ecology_relax/tween {duration:1, to_frame: 1}

# 探索
    execute if entity @s[tag=Anim.Search] run function animated_java:ranposu/animations/search/tween {duration:1, to_frame: 1}

# 待機
    execute if entity @s[tag=Anim.Idle] run function animated_java:ranposu/animations/idle/tween {duration:1, to_frame: 1}

# 軸合わせ
    execute if entity @s[tag=Anim.Turn.R] run function animated_java:ranposu/animations/turn_right/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Turn.L] run function animated_java:ranposu/animations/turn_left/tween {duration:1, to_frame: 1}

# 急襲
    execute if entity @s[tag=Anim.Move] run function animated_java:ranposu/animations/move/tween {duration:1, to_frame: 1}

# バックステップ
    execute if entity @s[tag=Anim.BackStep] run function animated_java:ranposu/animations/step_back/tween {duration:1, to_frame: 1}

# 咆哮
    execute if entity @s[tag=Anim.Voice] run function animated_java:ranposu/animations/voice/tween {duration:1, to_frame: 1}

# 嚙みつき
    execute if entity @s[tag=Anim.Bite] run function animated_java:ranposu/animations/bite/tween {duration:1, to_frame: 1}

# 強嚙みつき
    execute if entity @s[tag=Anim.BiteStrong] run function animated_java:ranposu/animations/bite_strong/tween {duration:1, to_frame: 1}

# 尻尾攻撃
    execute if entity @s[tag=Anim.Tail.R] run function animated_java:ranposu/animations/tail_right/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Tail.L] run function animated_java:ranposu/animations/tail_left/tween {duration:1, to_frame: 1}

# 移動ひっかき
    execute if entity @s[tag=Anim.MoveClaw] run function animated_java:ranposu/animations/move_claw/tween {duration:1, to_frame: 1}

# タックル
    execute if entity @s[tag=Anim.Tackle] run function animated_java:ranposu/animations/tackle/tween {duration:1, to_frame: 1}

# 急襲
    execute if entity @s[tag=Anim.Jump] run function animated_java:ranposu/animations/jump/tween {duration:1, to_frame: 1}

# 回り込み急襲
    execute if entity @s[tag=Anim.StepJump.R] run function animated_java:ranposu/animations/step_jump_right/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.StepJump.L] run function animated_java:ranposu/animations/step_jump_left/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
