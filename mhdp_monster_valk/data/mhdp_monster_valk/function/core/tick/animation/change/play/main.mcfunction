#> mhdp_monster_valk:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 咆哮
    execute if entity @s[tag=Anim.Voice] run function animated_java:valk_aj/animations/lance_voice/tween {duration:1, to_frame: 1}

## 彗龍
    # 龍気吸引
        execute if entity @s[tag=Anim.Charge] run function animated_java:valk_aj/animations/lance_charge_start/tween {duration:1, to_frame: 1}
    # 変形・彗龍→龍気
        execute if entity @s[tag=Anim.Change.LanceToShoot] run function animated_java:valk_aj/animations/lance_to_shoot/tween {duration:1, to_frame: 1}
    # 車庫入れ
        execute if entity @s[tag=Anim.MoveBack,tag=!Mns.Valk.State.IsShoot] run function animated_java:valk_aj/animations/lance_moveback/tween {duration:1, to_frame: 1}
    # 移動
        execute if entity @s[tag=Anim.MoveStart.Lance] run function animated_java:valk_aj/animations/lance_move_start/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.MoveStart.Shoot] run function animated_java:valk_aj/animations/shoot_move_start/tween {duration:1, to_frame: 1}
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
    # 翼槍叩きつけ
        execute if entity @s[tag=Anim.Upper.R] run function animated_java:valk_aj/animations/lance_upper_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Upper.L] run function animated_java:valk_aj/animations/lance_upper_l/tween {duration:1, to_frame: 1}
    # 噛みつき
        execute if entity @s[tag=Anim.Bite] run function animated_java:valk_aj/animations/lance_bite/tween {duration:1, to_frame: 1}
    # 突進攻撃
        execute if entity @s[tag=Anim.DashAttack] run function animated_java:valk_aj/animations/lance_dashattack/tween {duration:1, to_frame: 1}
    # 蛇行突進
        execute if entity @s[tag=Anim.Tackle] run function animated_java:valk_aj/animations/lance_tackle/tween {duration:1, to_frame: 1}
    # 滑空突進
        execute if entity @s[tag=Anim.JetTackle] run function animated_java:valk_aj/animations/lance_flytackle_start/tween {duration:1, to_frame: 1}
    # 龍閃
        execute if entity @s[tag=Anim.Beam] run function animated_java:valk_aj/animations/lance_biim_1/tween {duration:1, to_frame: 1}
    # 彗星
        execute if entity @s[tag=Anim.Comet] run function animated_java:valk_aj/animations/comet_phase_1/tween {duration:1, to_frame: 1}

## 龍気
    # 変形・龍気→彗龍
        execute if entity @s[tag=Anim.Change.ShootToLance] run function animated_java:valk_aj/animations/shoot_to_lance/tween {duration:1, to_frame: 1}
    # 車庫入れ
        execute if entity @s[tag=Anim.MoveBack,tag=Mns.Valk.State.IsShoot] run function animated_java:valk_aj/animations/shoot_moveback/tween {duration:1, to_frame: 1}
    # ステップ
        execute if entity @s[tag=Anim.Step] run function animated_java:valk_aj/animations/shoot_step/tween {duration:1, to_frame: 1}
    # 翼叩きつけ
        execute if entity @s[tag=Anim.VerticalS.R] run function animated_java:valk_aj/animations/shoot_vertical_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.VerticalS.L] run function animated_java:valk_aj/animations/shoot_vertical_l/tween {duration:1, to_frame: 1}
    # 薙ぎ払い
        execute if entity @s[tag=Anim.Sweep.R,tag=!Mns.State.IsAnger] run function animated_java:valk_aj/animations/shoot_sweep_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Sweep.R,tag=Mns.State.IsAnger] run function animated_java:valk_aj/animations/shoot_sweep_anger_r/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Sweep.L,tag=!Mns.State.IsAnger] run function animated_java:valk_aj/animations/shoot_sweep_l/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Sweep.L,tag=Mns.State.IsAnger] run function animated_java:valk_aj/animations/shoot_sweep_anger_l/tween {duration:1, to_frame: 1}
    # 射撃
        execute if entity @s[tag=Anim.Shoot.F] run function animated_java:valk_aj/animations/shoot_shot_forward/tween {duration:1, to_frame: 1}
        execute if entity @s[tag=Anim.Shoot.H] run function animated_java:valk_aj/animations/shoot_shot_horizon/tween {duration:1, to_frame: 1}
    # 前方爆発
        execute if entity @s[tag=Anim.Bomb.Forward] run function animated_java:valk_aj/animations/shoot_bomb_forward/tween {duration:1, to_frame: 1}
    # 側面爆発
        execute if entity @s[tag=Anim.Bomb.Side] run function animated_java:valk_aj/animations/shoot_bomb_side/tween {duration:1, to_frame: 1}
    # 前転
        execute if entity @s[tag=Anim.Sault] run function animated_java:valk_aj/animations/shoot_sault_before/tween {duration:1, to_frame: 1}
    
# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
