#> mhdp_monster_reus:core/tick/animation/event/land_breath/turn_start
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 8
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
