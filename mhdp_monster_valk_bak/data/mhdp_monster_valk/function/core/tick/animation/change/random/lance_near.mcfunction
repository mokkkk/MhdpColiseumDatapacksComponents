#> mhdp_monster_valk:core/tick/animation/change/random/lance_near
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Valk] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Spear:2,Vertical:2,Bite:0,DashAttack:0,Tackle:2,FlyTackle:1}
    # 正面
        execute if entity @s[tag=Mns.Temp.Forward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:3,DashAttack:2}
    # 背面
        execute if entity @s[tag=Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Vertical:3}
    # 側面
        # execute if entity @s[tag=!Mns.Temp.Forward,tag=!Mns.Temp.Back] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 怒り
        # execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # クールタイム
        execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run data modify storage mhdp_core:temp Temp.AttackRandom merge value {FlyTackle:0}

# 決定
    function mhdp_monster_valk:core/tick/animation/change/random/macro/m.lance_near with storage mhdp_core:temp Temp.AttackRandom
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# 2連突き
    execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_valk:core/tick/animation/change/play/spear
# 翼槍叩きつけ
    execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/vertical
# 噛みつき
    execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Bite
# 突進攻撃
    execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_valk:core/tick/animation/change/play/dashattack_move
# 蛇行突進
    execute if score #mndp_temp_action_id MhdpCore matches 5 run tag @s add Anim.Tackle
# 滑空突進
    execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_valk:core/tick/animation/change/play/jet_tackle

# 軸合わせ
    execute if entity @s[tag=Anim.Bite] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Tackle] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.JetTackle] run tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
