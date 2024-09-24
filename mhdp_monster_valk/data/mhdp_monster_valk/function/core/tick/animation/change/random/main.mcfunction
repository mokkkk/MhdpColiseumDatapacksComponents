#> mhdp_monster_valk:core/tick/animation/change/random/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/main

# 初回発見時
    execute if entity @s[tag=Mns.Temp.IsFirstContact] run return run function mhdp_monster_valk:core/tick/animation/change/random/first

# 行動回数加算
    execute if entity @n[tag=Mns.Target.Valk,distance=..14] run scoreboard players add @s Mns.General.ActCount.Move 2
    execute if entity @n[tag=Mns.Target.Valk,distance=14.1..] run scoreboard players remove @s Mns.General.ActCount.Move 1
    scoreboard players add @s Mns.Valk.PhaseCount.Comet 1
    scoreboard players add @s Mns.Valk.PhaseCount.Move 1

# フェーズ移行カウント加算
    scoreboard players add @s Mns.Valk.PhaseCount 1
    # 彗龍形態時、敵が遠くにいるなら追加で加算
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=17..] run scoreboard players add @s Mns.Valk.PhaseCount 1
    # 龍気形態時、敵が近くにいるなら追加で加算
        execute if entity @s[tag=Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=..12] run scoreboard players add @s Mns.Valk.PhaseCount 1

# クールタイム
    execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run scoreboard players remove @s Mns.Valk.MoveSkill.CoolDown 1

# 張り付き対策の位置リセット
    execute if score @s Mns.General.ActCount.Move matches 8.. if entity @n[tag=Mns.Target.Valk,distance=..14] run return run function mhdp_monster_valk:core/tick/animation/change/random/move

# フェーズ移行
    function mhdp_monster_valk:core/tick/animation/change/random/change_phase
    execute if entity @s[tag=Mns.Temp.ChangePhase] run return run tag @s remove Mns.Temp.ChangePhase

# 大技
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount.Comet matches 30.. run return run tag @s add Anim.Comet

# 準大技
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount.Move matches 13.. if predicate {"condition":"minecraft:random_chance","chance":0.4} run return run function mhdp_monster_valk:core/tick/animation/change/play/spear_to_spin_move

# 彗龍
    # 近距離
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=..12] run return run function mhdp_monster_valk:core/tick/animation/change/random/lance_near
    # 中距離
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=..20] run return run function mhdp_monster_valk:core/tick/animation/change/random/lance_middle
    # 遠距離
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] run return run function mhdp_monster_valk:core/tick/animation/change/random/lance_far

# 龍気
    # 近距離
        execute if entity @n[tag=Mns.Target.Valk,distance=..16] run return run function mhdp_monster_valk:core/tick/animation/change/random/shoot_near
    # 中・遠距離
        function mhdp_monster_valk:core/tick/animation/change/random/shoot_middle
