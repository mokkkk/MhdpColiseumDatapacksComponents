#> mhdp_monster_ranposu:core/tick/animation/change/play/main
#
# アニメーション変更処理 再生
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 行動回数加算
    scoreboard players add @s Mns.General.ActCount.Idle 1

# 待機
    execute if entity @s[tag=Anim.Idle] run function animated_java:ranposu_aj/animations/idle/tween {duration:1, to_frame: 1}

# 軸合わせ
    execute if entity @s[tag=Anim.Turn.R] run function animated_java:ranposu_aj/animations/turn_right/tween {duration:1, to_frame: 1}
    execute if entity @s[tag=Anim.Turn.L] run function animated_java:ranposu_aj/animations/turn_left/tween {duration:1, to_frame: 1}

# 咆哮
    execute if entity @s[tag=Anim.Voice] run function animated_java:ranposu_aj/animations/voice/tween {duration:1, to_frame: 1}

# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
