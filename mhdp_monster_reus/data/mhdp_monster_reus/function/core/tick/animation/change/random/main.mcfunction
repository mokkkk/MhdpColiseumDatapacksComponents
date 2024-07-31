#> mhdp_monster_reus:core/tick/animation/change/random/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/main

# 初回発見時
    execute if entity @s[tag=Mns.Temp.IsFirstContact] run return run function mhdp_monster_reus:core/tick/animation/change/random/first

# 近距離
    execute if entity @s[tag=!Mns.Reus.State.Flying] if entity @n[tag=Mns.Target.Reus,distance=..10] run return run function mhdp_monster_reus:core/tick/animation/change/random/near

# 中距離
    execute if entity @s[tag=!Mns.Reus.State.Flying] if entity @n[tag=Mns.Target.Reus,distance=..18] run return run function mhdp_monster_reus:core/tick/animation/change/random/middle

# 遠距離
    execute if entity @s[tag=!Mns.Reus.State.Flying] run return run function mhdp_monster_reus:core/tick/animation/change/random/far

# 飛行中
    # return run function mhdp_monster_reus:core/tick/animation/change/random/flying
