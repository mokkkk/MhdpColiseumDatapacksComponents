#> mhdp_monster_ranposu:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    # tag @s add Anim.Move
    # function mhdp_monster_ranposu:core/tick/animation/change/play/step_jump

# 軸合わせ
    # tag @s add Mns.Temp.IsTurn
    # scoreboard players set @s Mns.General.TurnCount 2

# アニメーション変更
    # function mhdp_monster_ranposu:core/tick/animation/change/main

function animated_java:ranposu_aj/animations/damage_counter_start/tween {duration:1, to_frame: 1}