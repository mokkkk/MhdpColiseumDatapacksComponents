#> mhdp_monster_karakuri:core/util/change_phase_attack
#
# フェーズ変更
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 通知
    tellraw @a[tag=Ply.State.IsTraining] {"text":"【からくり飛竜を 攻撃モード に変更しました】","color":"light_purple"}

# 待機
    tag @s remove Mns.Karakuri.Mode.Idle
    tag @s add Mns.Karakuri.Mode.Attack
