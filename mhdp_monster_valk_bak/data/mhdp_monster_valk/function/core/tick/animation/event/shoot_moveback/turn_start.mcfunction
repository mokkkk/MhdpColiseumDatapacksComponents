#> mhdp_monster_valk:core/tick/animation/event/lance_moveback/turn_start
#
# アニメーションイベントハンドラ 車庫入れ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 14
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
