#> mhdp_monster_dino:core/tick/animation/change/random/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/main

# 初回発見時
    execute if entity @s[tag=Mns.Temp.IsFirstContact] run return run function mhdp_monster_dino:core/tick/animation/change/random/first

# 行動回数加算
    execute if entity @n[tag=Mns.Target.Dino,distance=..12] run scoreboard players add @s Mns.General.ActCount.Move 1

# 張り付き対策の位置リセット
    execute if score @s Mns.General.ActCount.Move matches 5.. run return run function mhdp_monster_dino:core/tick/animation/change/random/move

# 地上
    # 近距離
        execute if entity @n[tag=Mns.Target.Dino,distance=..12] run return run function mhdp_monster_dino:core/tick/animation/change/random/near
    # 中距離
        execute if entity @n[tag=Mns.Target.Dino,distance=..25] run return run function mhdp_monster_dino:core/tick/animation/change/random/middle
    # 遠距離
        execute run return run function mhdp_monster_dino:core/tick/animation/change/random/far
