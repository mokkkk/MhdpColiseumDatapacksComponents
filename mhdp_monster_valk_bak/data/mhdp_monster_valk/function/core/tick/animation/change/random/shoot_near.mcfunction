#> mhdp_monster_valk:core/tick/animation/change/random/shoot_near
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Valk] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Vertical:2,Sweep:2,BombForward:1,BombSide:2}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sweep:3}
    # 背面
        # execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 側面
        execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BombSide:4}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sweep:3}
    # クールタイム
        execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BombForward:0}

# 決定
    function mhdp_monster_valk:core/tick/animation/change/random/macro/m.shoot_near with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# 翼叩きつけ
    execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_valk:core/tick/animation/change/play/vertical_s
# 薙ぎ払い
    execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/sweep
# 前方爆発
    execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Bomb.Forward
# 側面爆発
    execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_valk:core/tick/animation/change/play/bomb_side

# クールタイム設定
    execute if entity @s[tag=Anim.Bomb.Forward] run scoreboard players set @s Mns.Valk.MoveSkill.CoolDown 3

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
