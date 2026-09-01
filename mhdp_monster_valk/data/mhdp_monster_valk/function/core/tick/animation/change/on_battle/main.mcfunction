#> mhdp_monster_valk:core/tick/animation/change/on_battle/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/main

# 行動不能状態なら選択しない
    execute if entity @s[tag=Mns.State.IsNotMove] run return 0

# 行動回数処理
    # ターゲット更新
        scoreboard players add @s Mns.General.ActCount.Target 1
        execute if score @s Mns.General.ActCount.Target matches 6.. run function mhdp_monster_valk:core/tick/on_battle/update_target
    # 威嚇 (非怒り時、一定回数ごとに待機)
        execute if entity @s[tag=!Mns.State.IsAnger] if score @s Mns.General.ActCount.Idle matches 18.. run return run function mhdp_monsters:core/util/tick/skip

# 初回発見時
    execute if entity @s[tag=Mns.Temp.Anim.IsFirstContact] run return run function mhdp_monster_valk:core/tick/animation/change/on_battle/first

# フェーズカウント加算
    execute if entity @n[tag=Mns.Target.Valk,distance=..14] run scoreboard players add @s Mns.General.ActCount.Move 2
    execute if entity @n[tag=Mns.Target.Valk,distance=14.1..] run scoreboard players remove @s Mns.General.ActCount.Move 1
    scoreboard players add @s Mns.Valk.PhaseCount.Comet 1
    scoreboard players add @s Mns.Valk.PhaseCount.Move 1
    scoreboard players add @s Mns.Valk.PhaseCount.Beam 1
    scoreboard players add @s Mns.Valk.PhaseCount 1
    # 彗龍形態時、敵が遠くにいるなら追加加算
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=17..] run scoreboard players add @s Mns.Valk.PhaseCount 1
    # 龍気形態時、敵が近くにいるなら追加加算
        execute if entity @s[tag=Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=..12] run scoreboard players add @s Mns.Valk.PhaseCount 1

# クールタイム
    execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run scoreboard players remove @s Mns.Valk.MoveSkill.CoolDown 1

# 張り付き対策の位置リセット
    execute if score @s Mns.General.ActCount.Move matches 8.. if entity @n[tag=Mns.Target.Valk,distance=..14] run return run function mhdp_monster_valk:core/tick/animation/change/on_battle/move

# フェーズ移行 (彗龍 ⇔ 龍気)
    function mhdp_monster_valk:core/tick/animation/change/on_battle/change_phase
    execute if entity @s[tag=Mns.Temp.ChangePhase] run return run tag @s remove Mns.Temp.ChangePhase

# 大技 (彗星)
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount.Comet matches 50.. run return run tag @s add Anim.Comet

# 準大技
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount.Move matches 13.. if predicate {"condition":"minecraft:random_chance","chance":0.4} run return run function mhdp_monster_valk:core/tick/animation/change/play/spear_to_spin_move
    execute if entity @s[tag=!Mns.Valk.State.IsShoot] if score @s Mns.Valk.PhaseCount.Beam matches 30.. if predicate {"condition":"minecraft:random_chance","chance":0.6} run return run function mhdp_monster_valk:core/tick/animation/change/play/beam

# 距離別の行動選択
    # 彗龍
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=..12] run return run function mhdp_monster_valk:core/tick/animation/change/on_battle/lance_near
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] if entity @n[tag=Mns.Target.Valk,distance=..20] run return run function mhdp_monster_valk:core/tick/animation/change/on_battle/lance_middle
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] run return run function mhdp_monster_valk:core/tick/animation/change/on_battle/lance_far
    # 龍気
        execute if entity @n[tag=Mns.Target.Valk,distance=..16] run return run function mhdp_monster_valk:core/tick/animation/change/on_battle/shoot_near
        function mhdp_monster_valk:core/tick/animation/change/on_battle/shoot_middle
