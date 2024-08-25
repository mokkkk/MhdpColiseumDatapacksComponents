#> mhdp_monster_dino:core/tick/animation/change/random/middle
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Dino] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Breath:0,BreathTriple:0,BreathMove:0,MoveBite:3,MoveTail:2,TailJump:2,TailFlame:2,Round:1,Step:2}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:4,MoveBite:3,TailFlame:3}
    # 背面
        # execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 側面
        execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Step:3}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailJump:3,Round:2}
    # 喉赤熱化
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Breath:3,BreathTriple:2,BreathMove:3}
    # 尻尾赤熱化
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailJump:3}

# 決定
    function mhdp_monster_dino:core/tick/animation/change/random/macro/m.middle with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Breath.Back
# 3連ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.Breath.Triple
# 移動ブレス
    execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_dino:core/tick/animation/change/play/breath_move
# 移動→2連嚙みつき
    execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_dino:core/tick/animation/change/play/move_to_bite
# 移動→尻尾攻撃
    execute if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/move_to_tail
# 尻尾攻撃・飛びかかり
    execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_dino:core/tick/animation/change/play/tail_jump
# 火炎
    execute if score #mndp_temp_action_id MhdpCore matches 7 run function mhdp_monster_dino:core/tick/animation/change/play/tail_flame
# 大回転斬り
    execute if score #mndp_temp_action_id MhdpCore matches 8 run tag @s add Anim.Round
# サイドステップ
    execute if score #mndp_temp_action_id MhdpCore matches 9 run function mhdp_monster_dino:core/tick/animation/change/play/step

# 軸合わせ
    execute if entity @s[tag=Anim.Breath] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.BreathTriple] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Move] run tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
