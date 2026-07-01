#> mhdp_monster_dino:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 移動
    execute if entity @s[tag=Anim.Walk] run function animated_java_dino:dino/animations/walk_relax/tween {duration:5, to_frame: 5}

# 生態行動
    execute if entity @s[tag=Anim.Ecology] run function animated_java_dino:dino/animations/ecology_relax_short/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Ecology.Long] run function animated_java_dino:dino/animations/ecology_relax_long/tween {duration:1, to_frame: 1}

# 探索
    execute if entity @s[tag=Anim.Search] run function animated_java_dino:dino/animations/search/tween {duration:1, to_frame: 1}

# 待機
    execute if entity @s[tag=Anim.Idle] run function animated_java_dino:dino/animations/idle/tween {duration:1, to_frame: 1}

# 軸合わせ
    execute if entity @s[tag=Anim.Turn.R] run function animated_java_dino:dino/animations/turn_right/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Turn.L] run function animated_java_dino:dino/animations/turn_left/tween {duration:1, to_frame: 1}

# 噛みつき
    execute if entity @s[tag=Anim.Bite] run function animated_java_dino:dino/animations/bite/tween {duration:1, to_frame: 1}

# 尻尾たたきつけ
    execute if entity @s[tag=Anim.Tail.R] run function animated_java_dino:dino/animations/tail_attack_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Tail.L] run function animated_java_dino:dino/animations/tail_attack_l/tween {duration:1, to_frame: 1}

# 尻尾スライド
    execute if entity @s[tag=Anim.TailSide.R] run function animated_java_dino:dino/animations/tail_side_r/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.TailSide.L] run function animated_java_dino:dino/animations/tail_side_l/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
