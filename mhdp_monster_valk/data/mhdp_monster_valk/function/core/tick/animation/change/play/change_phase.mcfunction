#> mhdp_monster_valk:core/tick/animation/change/play/change_phase
#
# アニメーション変更処理 変形
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 対象が近い場合、車庫入れ
    execute if entity @s[tag=!Mns.Temp.Valk.MoveToChangePhase] if predicate {"condition":"minecraft:random_chance","chance":0.4} if entity @n[tag=Mns.Target.Valk,distance=..14] run tag @s add Anim.MoveBack
    execute if entity @s[tag=!Mns.Temp.Valk.MoveToChangePhase,tag=Anim.MoveBack] run return run tag @s add Mns.Temp.Valk.MoveToChangePhase

# タグ付与
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] run tag @s add Anim.Change.LanceToShoot
    execute if entity @s[tag=Mns.Valk.State.IsShoot] run tag @s add Anim.Change.ShootToLance
