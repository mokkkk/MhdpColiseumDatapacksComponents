#> mhdp_monster_ranposu:core/tick/animation/change/update_target
#
# ターゲット更新処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 現在のターゲットを開放
    tag @e[tag=Mns.Target.Ranposu] remove Mns.Target.Ranposu

# ランダムにターゲットを決定
    tag @e[tag=Ply.State.MnsTarget,sort=random,limit=1] add Mns.Target.Ranposu
    scoreboard players set @s Mns.General.ActCount.Target 0
