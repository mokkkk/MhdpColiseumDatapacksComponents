#> mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_l/turn_start
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 13
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
