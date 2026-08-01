#> mhdp_monster_dino:core/tick/animation/event/land_move/change
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_dino:core/tick/animation/event/land_move/main

# アニメーション変更
    execute if entity @s[tag=Mns.Dino.Combo.ToBite] run tag @s add Anim.BiteDouble
    execute if entity @s[tag=Mns.Dino.Combo.ToTail] if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/tail
    function mhdp_monster_dino:core/tick/animation/change/main

# 終了
    tag @s remove Mns.Dino.Combo.ToBite
    tag @s remove Mns.Dino.Combo.ToTail
