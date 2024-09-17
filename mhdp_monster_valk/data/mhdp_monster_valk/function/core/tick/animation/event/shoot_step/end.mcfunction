#> mhdp_monster_valk:core/tick/animation/event/shoot_step/end
#
# アニメーションイベントハンドラ ステップ
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_step/main

# 遷移
    execute if entity @s[tag=Mns.Temp.Valk.StepToBombSide] run tag @s add Anim.Bomb.Side
    execute if entity @s[tag=Mns.Temp.Valk.StepToVertical.R] run tag @s add Anim.VerticalS.R
    execute if entity @s[tag=Mns.Temp.Valk.StepToVertical.L] run tag @s add Anim.VerticalS.L

# 行動選択
    function mhdp_monster_valk:core/tick/animation/change/main

# 終了
    tag @s remove Mns.Temp.Valk.StepToBombSide
    tag @s remove Mns.Temp.Valk.StepToVertical.R
    tag @s remove Mns.Temp.Valk.StepToVertical.L
