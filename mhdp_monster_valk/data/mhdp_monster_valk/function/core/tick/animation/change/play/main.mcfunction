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
    # 2連突き
        execute if entity @s[tag=Anim.Spear.LtoR] run function animated_java:valk_aj/animations/lance_spear_l_to_r/tween {duration:1, to_frame: 1}


# タグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag
    tag @s remove Mns.Temp.IsCombo
