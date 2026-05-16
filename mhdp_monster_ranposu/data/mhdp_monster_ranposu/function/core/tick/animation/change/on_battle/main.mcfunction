#> mhdp_monster_ranposu:core/tick/animation/change/on_battle/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/main

# ターゲット確認
    function mhdp_monster_ranposu:core/tick/on_battle/check_target

# 行動回数加算
    # ターゲット更新用
        scoreboard players add @s Mns.General.ActCount.Target 1
    # 威嚇用
        scoreboard players add @s Mns.General.ActCount.Target 1

# 初回発見時
    execute if entity @s[tag=Mns.Temp.Anim.IsFirstContact] run return run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/first

# # 近距離
#     execute if entity @n[tag=Mns.Target.Ranposu,distance=..8] run return run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/near

# # 中・遠距離
#     return run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/middle
