#> mhdp_monster_dino:core/tick/animation/change/on_battle/near
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/on_battle/main

# 状態取得
    # 近距離
        execute if entity @n[tag=Mns.Temp.Target,distance=..12] run tag @s add Mns.Temp.Near

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {BreathBack:0,BreathMove:0,MoveBack:0,SideStep:1}
# 状態に応じた確率上書き
    # 近距離
        execute if entity @s[tag=Mns.Temp.Near] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {MoveBack:5}
    # 遠距離・喉赤熱化
        execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Temp.Near] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BreathMove:5}
    # 近距離・喉赤熱化
        execute if entity @s[tag=Mns.Temp.Near,tag=Mns.Dino.State.HeadHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BreathBack:4}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"dino",State:"move"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # バックジャンプブレス
        execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.BreathBack
    # 移動ブレス
        execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_dino:core/tick/animation/change/play/move_breath
    # 車庫入れ
        execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.MoveBack
    # サイドステップ
        execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_dino:core/tick/animation/change/play/step

# 軸合わせ要否確認
    function mhdp_monster_dino:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players set @s Mns.General.ActCount.Move 0
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    tag @s remove Mns.Temp.Near
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
