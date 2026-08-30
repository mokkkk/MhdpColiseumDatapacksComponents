#> mhdp_monster_valk:core/tick/animation/event/shoot_step/turn_start
#
# アニメーションイベントハンドラ ステップ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 角度計算
    tag @n[type=marker,tag=Temp.Rotate.Target.Marker] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 11
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    kill @e[type=marker,tag=Temp.Rotate.Target.Marker]
