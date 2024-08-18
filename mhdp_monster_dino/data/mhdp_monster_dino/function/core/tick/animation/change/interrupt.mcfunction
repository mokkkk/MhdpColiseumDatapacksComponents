#> mhdp_monster_dino:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    # tag @s add Anim.Breath
    # function mhdp_monster_dino:core/tick/animation/change/play/tail_anger

# 軸合わせ
    # tag @s add Mns.Temp.IsTurn
    # tag @s add Mns.Temp.IsTurn.Big

# アニメーション変更
    # function mhdp_monster_dino:core/tick/animation/change/main

function animated_java:dino_aj/animations/damage_tail_break/tween {duration:1, to_frame: 1}