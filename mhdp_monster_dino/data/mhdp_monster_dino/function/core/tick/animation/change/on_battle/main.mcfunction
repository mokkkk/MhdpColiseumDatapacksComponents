#> mhdp_monster_dino:core/tick/animation/change/on_battle/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/main

# 特殊ヘイト
    # アイテム使用中のプレイヤーのヘイト増加
        execute if entity @a[tag=Mns.Candidate.Dino,tag=Ply.Ope.IsUsingItem] as @a[tag=Mns.Candidate.Dino,tag=Ply.Ope.IsUsingItem] run scoreboard players add @s Mns.Dino.Hate 300

# 行動回数処理
    # ターゲット更新
        scoreboard players add @s Mns.General.ActCount.Target 1
        # 3回以上行動した後、一定確率でタゲ変更
            execute if score @s Mns.General.ActCount.Target matches 3.. if predicate {"condition":"minecraft:random_chance","chance":0.50} run function mhdp_monster_dino:core/tick/on_battle/update_target
        # 6回以上行動した後、確実にタゲ変更
            execute if score @s Mns.General.ActCount.Target matches 6.. run function mhdp_monster_dino:core/tick/on_battle/update_target
    # 威嚇
        scoreboard players add @s Mns.General.ActCount.Idle 1
        # 非怒り時、一定回数ごとに威嚇
            execute if entity @s[tag=!Mns.State.IsAnger] if score @s Mns.General.ActCount.Idle matches 12.. run return run scoreboard players reset @s Mns.General.ActCount.Idle

# 初回発見時
    execute if entity @s[tag=Mns.Temp.Anim.IsFirstContact] run return run function mhdp_monster_dino:core/tick/animation/change/on_battle/first

# 張り付き対策
    # 行動回数加算
        execute if entity @n[tag=Mns.Target.Dino,distance=..12] run scoreboard players add @s Mns.General.ActCount.Move 2
        execute if entity @n[tag=Mns.Target.Dino,distance=12.1..] run scoreboard players add @s Mns.General.ActCount.Move 1
    # 位置リセット
        execute if score @s Mns.General.ActCount.Move matches 8.. if entity @n[tag=Mns.Target.Dino,distance=..12] run return run function mhdp_monster_dino:core/tick/animation/change/on_battle/move

# 近距離
    execute if entity @n[tag=Mns.Target.Dino,distance=..12] run return run function mhdp_monster_dino:core/tick/animation/change/on_battle/near

# 中距離
    execute if entity @n[tag=Mns.Target.Dino,distance=..25] run return run function mhdp_monster_dino:core/tick/animation/change/on_battle/middle

# 遠距離
    return run function mhdp_monster_dino:core/tick/animation/change/on_battle/far
