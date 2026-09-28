#> mhdp_monster_valk:core/tick/animation/change/update_target
#
# ターゲット更新処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 現在のターゲットを開放
    tag @e[tag=Mns.Target.Valk] remove Mns.Target.Valk

# ランダムにターゲットを決定
    tag @e[tag=Ply.State.MnsTarget,sort=random,limit=1] add Mns.Target.Valk
    scoreboard players set @s Mns.General.ActCount.Target 0
