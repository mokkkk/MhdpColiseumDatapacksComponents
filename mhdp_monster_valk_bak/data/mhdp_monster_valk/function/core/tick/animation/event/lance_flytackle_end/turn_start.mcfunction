#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/turn_start
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 角度計算
    tag @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 3
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
