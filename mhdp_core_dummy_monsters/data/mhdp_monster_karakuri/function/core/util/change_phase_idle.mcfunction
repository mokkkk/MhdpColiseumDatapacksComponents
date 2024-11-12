#> mhdp_monster_karakuri:core/util/change_phase_idle
#
# フェーズ変更
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 通知
    tellraw @a[tag=Ply.State.IsTraining] {"text":"【からくり飛竜を 待機モード に変更しました】","color":"light_purple"}

# 待機
    tag @s add Mns.Karakuri.Mode.Idle
    tag @s remove Mns.Karakuri.Mode.Attack
