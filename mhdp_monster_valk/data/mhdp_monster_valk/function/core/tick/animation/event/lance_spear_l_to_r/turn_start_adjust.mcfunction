#> mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/turn_start_adjust
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 7
    function mhdp_monsters:core/util/other/turn_to_target_calc_adjust

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
