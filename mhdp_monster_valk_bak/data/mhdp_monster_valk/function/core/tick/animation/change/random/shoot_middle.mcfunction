#> mhdp_monster_valk:core/tick/animation/change/random/shoot_middle
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Valk] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Vertical:2,Shoot:4,Sault:3}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sweep:3}
    # 背面
        # execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 側面
        # execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 怒り
        # execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # クールタイム
        execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sault:0}

# 決定
    function mhdp_monster_valk:core/tick/animation/change/random/macro/m.shoot_middle with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# 翼叩きつけ
    execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_valk:core/tick/animation/change/play/vertical_s
# 射撃
    execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/shoot
# 前転
    execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_valk:core/tick/animation/change/play/sault_move

# 軸合わせ
    execute if entity @s[tag=Anim.Sault] run tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
