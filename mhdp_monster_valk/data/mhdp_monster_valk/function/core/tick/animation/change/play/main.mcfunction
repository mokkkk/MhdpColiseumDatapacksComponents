#> mhdp_monster_valk:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 咆哮
    execute if entity @s[tag=Anim.Voice] run function animated_java:valk_aj/animations/lance_voice/tween {duration:1, to_frame: 1}

# 彗龍
    # 移動
        execute if entity @s[tag=Anim.MoveStart.Lance] run function animated_java:valk_aj/animations/lance_move_start/tween {duration:1, to_frame: 1}
    # 2連突き
        execute if entity @s[tag=Anim.Spear.RtoL] run function animated_java:valk_aj/animations/lance_spear_r_to_l/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Spear.LtoR] run function animated_java:valk_aj/animations/lance_spear_l_to_r/tween {duration:1, to_frame: 1}
    # 翼槍回転斬り
        execute if entity @s[tag=Anim.Spear.RtoSpin] run function animated_java:valk_aj/animations/lance_spear_to_spin_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Spear.LtoSpin] run function animated_java:valk_aj/animations/lance_spear_to_spin_l/tween {duration:1, to_frame: 1}
    # 翼槍叩きつけ
        execute if entity @s[tag=Anim.Vertical.R] run function animated_java:valk_aj/animations/lance_vertical_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Vertical.L] run function animated_java:valk_aj/animations/lance_vertical_l/tween {duration:1, to_frame: 1}
    # 振りむき翼槍叩きつけ
        execute if entity @s[tag=Anim.Vertical.Turn.R] run function animated_java:valk_aj/animations/lance_vertical_turn_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Vertical.Turn.L] run function animated_java:valk_aj/animations/lance_vertical_turn_l/tween {duration:1, to_frame: 1}
    # 噛みつき
        execute if entity @s[tag=Anim.Bite] run function animated_java:valk_aj/animations/lance_bite/tween {duration:1, to_frame: 1}
    # 突進攻撃
        execute if entity @s[tag=Anim.DashAttack] run function animated_java:valk_aj/animations/lance_dashattack/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
