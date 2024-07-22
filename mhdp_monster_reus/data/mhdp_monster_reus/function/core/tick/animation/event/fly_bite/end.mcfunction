#> mhdp_monster_reus:core/tick/animation/event/fly_turn/end
#
# アニメーションイベントハンドラ ひっかき
#
# @within function mhdp_monster_reus:core/tick/animation/event/fly_turn/main

# 飛行尻尾なぎはらいに移行
    tag @s add Anim.Fly.Tail

# 行動選択
    function mhdp_monster_reus:core/tick/animation/change/main
