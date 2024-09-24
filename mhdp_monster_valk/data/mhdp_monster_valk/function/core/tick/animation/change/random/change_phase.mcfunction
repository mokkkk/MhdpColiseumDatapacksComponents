#> mhdp_monster_valk:core/tick/animation/change/random/change_phase
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/random/main

# カウンター増加
    scoreboard players add @s Mns.Valk.PhaseCount 1

# 条件確認
    # 彗龍 → 龍気
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount matches 7.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Mns.Temp.ChangePhase
    # 龍気 → 彗龍
        execute if entity @s[tag=Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount matches 4.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run tag @s add Mns.Temp.ChangePhase
    # 条件に満たない場合、スキップ
        execute if entity @s[tag=!Mns.Temp.ChangePhase] run return 0

# 変形
    function mhdp_monster_valk:core/tick/animation/change/play/change_phase
    scoreboard players set @s Mns.Valk.PhaseCount 0

# 終了
    tag @s remove Mns.Temp.ChangePhase
