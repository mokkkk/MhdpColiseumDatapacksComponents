#> mhdp_monster_dino:core/tick/animation/event/tail_attack_l_to_step_l/end
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tail_attack_l_to_step_l/main

# 尻尾叩きつけに移行
    execute if entity @s[tag=!Mns.State.IsAnger] run tag @s add Anim.Tail.R
    execute if entity @s[tag=Mns.State.IsAnger] run tag @s add Anim.Tail.Anger.R

# 行動選択
    function mhdp_monster_dino:core/tick/animation/change/main
