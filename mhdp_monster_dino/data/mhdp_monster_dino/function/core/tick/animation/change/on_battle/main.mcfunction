#> mhdp_monster_ranposu:core/tick/animation/change/on_battle/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/main

# 行動回数処理
    # ターゲット更新
        scoreboard players add @s Mns.General.ActCount.Target 1
        # 3回以上行動した後、一定確率でタゲ変更
            execute if score @s Mns.General.ActCount.Target matches 3.. if predicate {"condition":"minecraft:random_chance","chance":0.40} run function mhdp_monster_ranposu:core/tick/on_battle/update_target
        # 5回以上行動した後、確実にタゲ変更
            execute if score @s Mns.General.ActCount.Target matches 5.. run function mhdp_monster_ranposu:core/tick/on_battle/update_target
    # 威嚇
        scoreboard players add @s Mns.General.ActCount.Idle 1
        # 非怒り時、一定回数ごとに威嚇
            execute if entity @s[tag=!Mns.State.IsAnger] if score @s Mns.General.ActCount.Idle matches 7.. run return run scoreboard players reset @s Mns.General.ActCount.Idle

# 初回発見時
    execute if entity @s[tag=Mns.Temp.Anim.IsFirstContact] run return run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/first

# 近距離
    execute if entity @n[tag=Mns.Target.Ranposu,distance=..8] run return run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/near

# 中・遠距離
    return run function mhdp_monster_ranposu:core/tick/animation/change/on_battle/middle
