#> mhdp_monster_ranposu:core/tick/animation/event/turn_left/turn_start
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/turn_left/main

# 角度計算
    tag @n[tag=Mns.Target.Ranposu] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 11
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
