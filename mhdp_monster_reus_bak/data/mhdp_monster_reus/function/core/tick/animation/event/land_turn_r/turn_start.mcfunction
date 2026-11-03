#> mhdp_monster_reus:core/tick/animation/event/land_turn_r/turn_start
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 15
    execute if score @s Mns.General.TurnCount matches 1.. run function mhdp_monsters:core/util/other/turn_to_target_calc_max_90
    execute if score @s Mns.General.TurnCount matches ..0 run function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
