#> mhdp_monster_dino:core/tick/animation/event/land_move/change
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_dino:core/tick/animation/event/land_move/main

# アニメーション変更
    # tag @s add Anim.BiteDouble
    tag @s add Anim.Tail.R
    function mhdp_monster_dino:core/tick/animation/change/main
