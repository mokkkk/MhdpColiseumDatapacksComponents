#> mhdp_monster_reus:core/tick/animation/change/random/near
#
# 行動ランダム選択
#
# @within function mhdp_monster_reus:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Reus] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Bite:4,ChargeBite:2,Jump:2,Breath:2,Tail:1,Dash:2}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Dash:4}
    # 背面
        execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Tail:4}
    # 側面
        execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Jump:3,Tail:3}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {ChargeBite:4,Dash:4}

# 決定
    function mhdp_monster_reus:core/tick/animation/change/random/macro/m.near with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# 噛みつき
    execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_reus:core/tick/animation/change/play/bite
# チャージ嚙みつき
    execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.ChargeBite
# 床ドン
    execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Jump
# ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_reus:core/tick/animation/change/play/breath
# 尻尾回転
    execute if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_reus:core/tick/animation/change/play/tail
# 突進
    execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_reus:core/tick/animation/change/play/dash

# 軸合わせ
    execute if entity @s[tag=Anim.Bite.R] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Bite.L] run tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
    execute if entity @s[tag=Mns.Temp.IsTurn] run scoreboard players set @s Mns.General.TurnCount 2
