#> mhdp_core:phase/3_quest/change_phase/retired/wait
#
# 次Phaseへ遷移 クエストリタイア時の待機処理
#
# @within function mhdp_core:phase/3_quest/tick

# タイマー増加
    scoreboard players add #mhdp_core_timer MhdpCore 1

# 通知
    execute if score #mhdp_core_timer MhdpCore matches 61 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【クエストを中断します】"}

# プレイヤーを無敵化・移動停止
    execute if score #mhdp_core_timer MhdpCore matches 1 as @a[tag=Ply.State.PlayingQuest] run tag @s remove Ply.State.EnableDamage
    execute if score #mhdp_core_timer MhdpCore matches 1 as @a[tag=Ply.State.PlayingQuest] run effect give @s resistance 15 10 true
    execute if score #mhdp_core_timer MhdpCore matches 1 as @a[tag=Ply.State.PlayingQuest] run effect give @s slowness 15 10 true
    execute if score #mhdp_core_timer MhdpCore matches 1 as @a[tag=Ply.State.PlayingQuest] run attribute @s generic.jump_strength modifier add mhdp_core:quest_jump_strength -10 add_value
    execute if score #mhdp_core_timer MhdpCore matches ..121 as @a[tag=Ply.State.PlayingQuest] run scoreboard players set @s Wpn.DeactivateTimer 2

# 帰還
    execute if score #mhdp_core_timer MhdpCore matches 120.. run function mhdp_core:phase/3_quest/change_phase/retired/change
