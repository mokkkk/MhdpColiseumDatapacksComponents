#> mhdp_monster_reus:core/tick/animation/event/fly_move_right/end
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_reus:core/tick/animation/event/fly_move_right/main

# ひっかきを選択
    tag @s add Anim.Fly.Attack

# 行動選択
    function mhdp_monster_reus:core/tick/animation/change/main
