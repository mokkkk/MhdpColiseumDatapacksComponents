#> mhdp_monster_dino:core/tick/animation/event/land_move/change
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_dino:core/tick/animation/event/land_move/main

# アニメーション変更
    execute if entity @s[tag=Mns.Dino.Temp.ToBite] run tag @s add Anim.BiteDouble
    execute if entity @s[tag=Mns.Dino.Temp.ToTail,tag=!Mns.State.IsAnger] if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/tail
    execute if entity @s[tag=Mns.Dino.Temp.ToTail,tag=Mns.State.IsAnger] if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/tail_anger
    function mhdp_monster_dino:core/tick/animation/change/main

# 終了
    tag @s remove Mns.Dino.Temp.ToBite
    tag @s remove Mns.Dino.Temp.ToTail
