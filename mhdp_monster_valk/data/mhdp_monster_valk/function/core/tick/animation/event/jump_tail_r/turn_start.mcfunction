#> mhdp_monster_dino:core/tick/animation/event/jump_tail_r/turn_start
#
# アニメーションイベントハンドラ 尻尾攻撃・飛びかかり
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 角度計算
    tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    scoreboard players set #mhdp_temp_rotate_tick MhdpCore 10
    function mhdp_monsters:core/util/other/turn_to_target_calc

# 終了
    tag @n[tag=Temp.Rotate.Target] remove Temp.Rotate.Target