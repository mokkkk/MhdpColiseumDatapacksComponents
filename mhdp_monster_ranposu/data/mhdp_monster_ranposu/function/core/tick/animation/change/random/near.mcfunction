#> mhdp_monster_ranposu:core/tick/animation/change/random/near
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

# 状態取得
    tag @e[tag=Mns.Target.Ranposu] add Mns.Temp.Target
    function mhdp_monsters:core/util/tick/get_state
    tag @e[tag=Mns.Temp.Target] remove Mns.Temp.Target

# 確率設定

# 決定
    function mhdp_monster_ranposu:core/tick/animation/change/random/macro/m.near
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id
    data modify storage mhdp_core:temp Debug set from entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data"

# 噛みつき
    execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Bite
# 強嚙みつき
    execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.BiteStrong
# 尻尾攻撃
    execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_ranposu:core/tick/animation/change/play/tail
# 移動ひっかき
    execute if score #mndp_temp_action_id MhdpCore matches 4 run tag @s add Anim.MoveClaw
# タックル
    execute if score #mndp_temp_action_id MhdpCore matches 5 run tag @s add Anim.Tackle
# 回り込み急襲
    execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_ranposu:core/tick/animation/change/play/step_jump

# 軸合わせ
    execute if entity @s[tag=Anim.Bite] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.MoveClaw] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Anim.Tackle] run tag @s add Mns.Temp.IsTurn
    execute if entity @s[tag=Mns.Temp.IsTurn] run scoreboard players set @s Mns.General.TurnCount 2

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
