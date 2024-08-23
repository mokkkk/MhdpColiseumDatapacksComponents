#> mhdp_monster_dino:core/tick/animation/event/step_side_r/end
#
# アニメーションイベントハンドラ サイドステップ
#
# @within function mhdp_monster_dino:core/tick/animation/event/step_side_r/main

# コンボ中、尻尾叩きつけ
    execute if entity @s[tag=Mns.Temp.IsCombo] run function mhdp_monster_dino:core/tick/animation/change/play/tail_anger

# それ以外の場合、ランダム
    execute if entity @s[tag=!Mns.Temp.IsCombo] if entity @n[tag=Mns.Target.Dino,distance=..11] run tag @s add Anim.Bite
    execute if entity @s[tag=!Mns.Temp.IsCombo,tag=!Anim.Bite] run function mhdp_monster_dino:core/tick/animation/change/play/move_to_bite

# 行動選択
    function mhdp_monster_dino:core/tick/animation/change/main
