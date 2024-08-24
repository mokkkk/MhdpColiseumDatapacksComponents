#> mhdp_monster_dino:core/tick/animation/change/random/near
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Dino] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {BreathBack:0,BreathMove:0,Bite:3,MoveBack:0,Tail:4,TailSide:3,TailBack:0,TailFlame:0,Round:2,Step:1}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:4}
    # 背面
        execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailBack:8}
    # 側面
        execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:2,MoveBack:1,Step:3}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Round:2}
    # 喉赤熱化
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BreathBack:3,BreathMove:3}

# 決定
    function mhdp_monster_dino:core/tick/animation/change/random/macro/m.near with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# バックジャンプブレス
    execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Breath.Back
# 移動ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_dino:core/tick/animation/change/play/breath_move
# 噛みつき
    execute if entity @s[tag=!Mns.State.IsAnger] if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Bite
    execute if entity @s[tag=Mns.State.IsAnger] if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.BiteToTail
# 車庫入れ
    execute if score #mndp_temp_action_id MhdpCore matches 4 run tag @s add Anim.MoveBack
# 尻尾攻撃
    execute if entity @s[tag=!Mns.State.IsAnger] if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/tail
    execute if entity @s[tag=Mns.State.IsAnger] if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/tail_anger
# 尻尾攻撃・側面
    execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_dino:core/tick/animation/change/play/tail_side
# 尻尾攻撃・背面
    execute if score #mndp_temp_action_id MhdpCore matches 7 run function mhdp_monster_dino:core/tick/animation/change/play/tail_back
# 火炎
    execute if score #mndp_temp_action_id MhdpCore matches 8 run function mhdp_monster_dino:core/tick/animation/change/play/tail_flame
# 大回転斬り
    execute if score #mndp_temp_action_id MhdpCore matches 9 run tag @s add Anim.Round
# サイドステップ
    execute if score #mndp_temp_action_id MhdpCore matches 10 run function mhdp_monster_dino:core/tick/animation/change/play/step

# 軸合わせ
    execute if entity @s[tag=Anim.Breath.Back] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Bite] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.BiteDouble] run tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
