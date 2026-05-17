#> mhdp_monsters:core/util/tick/animation/decide_animation
# 
# 汎用処理 プレイヤーの状態取得
#
# @input arg Monster モンスター名
# @input arg State 状態名。基本的にはnear,farなど距離を示す

# loot実行
    $execute store success score #mndp_temp_success MhdpCore run function mhdp_monster_$(Monster):core/tick/animation/change/on_battle/macro/m.$(State) with storage mhdp_core:temp Temp.AttackRandom
    $execute unless score #mndp_temp_success MhdpCore matches 1.. run tellraw @a {"text":"【ERROR: 行動決定処理 mhdp_monster_$(Monster):core/tick/animation/change/on_battle/macro/m.$(State) の実行に失敗しました】"}
    scoreboard players reset #mndp_temp_success MhdpCore

# mndp_temp_action_id に出た番号を保存
    execute store result score #mndp_temp_action_id MhdpCore run data get entity @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}] Item.components."minecraft:custom_data".Id

# 終了
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
