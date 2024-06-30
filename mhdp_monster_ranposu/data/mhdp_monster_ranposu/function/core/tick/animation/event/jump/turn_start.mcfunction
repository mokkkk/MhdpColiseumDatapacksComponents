#> mhdp_monster_ranposu:core/tick/animation/event/jump/turn_start
#
# アニメーションイベントハンドラ 急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Ranposu] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 5
    function mhdp_monsters:core/util/other/turn_to_target_calc_adjust

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target
