#> mhdp_monster_reus:core/tick/animation/change/random/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/main

# 初回発見時
    execute if entity @s[tag=Mns.Temp.IsFirstContact] run return run function mhdp_monster_reus:core/tick/animation/change/random/first

# フェーズカウント増加
    scoreboard players add @s Mns.Reus.PhaseCount 1

# フェーズ変更
    # 地上→飛行
        execute if entity @s[tag=!Mns.Reus.State.Flying] if score @s Mns.Reus.PhaseCount matches 7.. run function mhdp_monster_reus:core/tick/animation/change/random/land_to_fly
    # 飛行→地上
        execute if entity @s[tag=Mns.Reus.State.Flying] if score @s Mns.Reus.PhaseCount matches 4.. run function mhdp_monster_reus:core/tick/animation/change/random/fly_to_land

# 地上
    # 近距離
        execute if entity @s[tag=!Mns.Reus.State.Flying] if entity @n[tag=Mns.Target.Reus,distance=..10] run return run function mhdp_monster_reus:core/tick/animation/change/random/near
    # 中距離
        execute if entity @s[tag=!Mns.Reus.State.Flying] if entity @n[tag=Mns.Target.Reus,distance=..18] run return run function mhdp_monster_reus:core/tick/animation/change/random/middle
    # 遠距離
        execute if entity @s[tag=!Mns.Reus.State.Flying] run return run function mhdp_monster_reus:core/tick/animation/change/random/far

# 飛行中
    # 近距離
        execute if entity @s[tag=Mns.Reus.State.Flying] if entity @n[tag=Mns.Target.Reus,distance=..13] run return run function mhdp_monster_reus:core/tick/animation/change/random/flying_near
    # 中・遠距離
        return run function mhdp_monster_reus:core/tick/animation/change/random/flying_middle
