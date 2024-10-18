#> mhdp_monster_dino:core/tick/animation/change/random/move
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Dino] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    # 近距離
        execute if entity @n[tag=Mns.Temp.Target,distance=..12] run tag @s add Mns.Temp.Near
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {BreathBack:0,BreathMove:0,MoveBack:0,SideStep:1}
    # 近距離
        execute if entity @s[tag=Mns.Temp.Near] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {MoveBack:3}
    # 遠距離・喉赤熱化
        execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Near] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BreathMove:5}
    # 近距離・喉赤熱化
        execute if entity @s[tag=Mns.Temp.Near,tag=Mns.Dino.State.HeadHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BreathBack:2}

# 決定
    function mhdp_monster_dino:core/tick/animation/change/random/macro/m.move with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# バックジャンプブレス
    execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Breath.Back
# 移動ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_dino:core/tick/animation/change/play/breath_move
# 車庫入れ
    execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.MoveBack
# サイドステップ
    execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_dino:core/tick/animation/change/play/step

# 終了
    scoreboard players set @s Mns.General.ActCount.Move 0
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    tag @s remove Mns.Temp.Near
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
