#> mhdp_monster_dino:core/tick/animation/change/random/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/main

# 初回発見時
    execute if entity @s[tag=Mns.Temp.IsFirstContact] run return run function mhdp_monster_dino:core/tick/animation/change/random/first

# 地上
    # 近距離
        execute if entity @n[tag=Mns.Target.Dino,distance=..10] run return run function mhdp_monster_dino:core/tick/animation/change/random/near
    # 中距離
        # execute if entity @n[tag=Mns.Target.Dino,distance=..18] run return run function mhdp_monster_dino:core/tick/animation/change/random/middle
    # 遠距離
        # execute run return run function mhdp_monster_dino:core/tick/animation/change/random/far
