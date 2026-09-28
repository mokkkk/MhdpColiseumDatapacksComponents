#> mhdp_monster_valk:core/tick/animation/change/on_battle/move
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Target.Valk"}
    # 近距離
        execute if entity @n[tag=Mns.Target.Valk,distance=..10] run tag @s add Mns.Temp.Near

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {MoveBack:3,JetTackle:0,BombForward:0}
# 状態に応じた確率上書き
    # 近距離
        execute if entity @s[tag=Mns.Temp.Near] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {MoveBack:4}
    # 彗龍形態
        execute if entity @s[tag=!Mns.Valk.State.IsShoot] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {JetTackle:2}
    # 龍気形態
        execute if entity @s[tag=Mns.Valk.State.IsShoot] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BombForward:4}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"valk",State:"move"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # 車庫入れ
        execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.MoveBack
    # 滑空突進
        execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/jet_tackle
    # 前方爆発
        execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Bomb.Forward

# 軸合わせ要否確認
    function mhdp_monster_valk:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players set @s Mns.General.ActCount.Move 0
    tag @s remove Mns.Temp.Near
    scoreboard players reset #mndp_temp_action_id MhdpCore
