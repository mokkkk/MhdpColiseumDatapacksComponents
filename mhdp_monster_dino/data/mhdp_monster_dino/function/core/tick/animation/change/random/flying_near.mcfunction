#> mhdp_monster_reus:core/tick/animation/change/random/flying_near
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Reus] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {FlyMove:3,FlyBite:3,FlyMoveBreath:3,FlyFlameSweep:3}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 背面
        execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 側面
        execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}

# 決定
    function mhdp_monster_reus:core/tick/animation/change/random/macro/m.flying_near with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# 飛行回り込み
    execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_reus:core/tick/animation/change/play/fly_move
# 飛行嚙みつき
    execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.Fly.Bite
# 飛行ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_reus:core/tick/animation/change/play/fly_movebreath
# なぎはらい火炎放射
    execute if score #mndp_temp_action_id MhdpCore matches 4 run tag @s add Anim.Fly.Flame.Sweep

# 軸合わせ
    execute if entity @s[tag=Anim.Fly.Move.L] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Fly.Move.R] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Fly.Bite] run tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
    execute if entity @s[tag=Mns.Temp.IsTurn] run scoreboard players set @s Mns.General.TurnCount 2
