#> mhdp_monster_valk:core/tick/animation/change/play/change_phase
#
# アニメーション変更処理 変形
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] run tag @s add Anim.Change.LanceToShoot
    execute if entity @s[tag=Mns.Valk.State.IsShoot] run tag @s add Anim.Change.ShootToLance

# 状態変更
    execute if entity @s[tag=Anim.Change.LanceToShoot] run tag @s add Mns.Valk.State.IsShoot
    execute if entity @s[tag=Anim.Change.ShootToLance] run tag @s remove Mns.Valk.State.IsShoot
