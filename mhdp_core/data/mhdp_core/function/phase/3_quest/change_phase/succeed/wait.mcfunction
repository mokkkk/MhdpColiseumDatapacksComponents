#> mhdp_core:phase/3_quest/change_phase/succeed/wait
#
# 次Phaseへ遷移 クエスト成功時の待機処理
#
# @within function mhdp_core:phase/3_quest/tick

# タイマー増加
    scoreboard players add #mhdp_core_timer MhdpCore 1

# 通知
    execute if score #mhdp_core_timer MhdpCore matches 1 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【戦いに勝利した！】"}
    execute if score #mhdp_core_timer MhdpCore matches 1 run function mhdp_core:phase/3_quest/change_phase/succeed/show_clear_time
    execute if score #mhdp_core_timer MhdpCore matches 61 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【目標を達成しました】"}
    execute if score #mhdp_core_timer MhdpCore matches 121 run tellraw @a[tag=Ply.State.PlayingQuest] {"text": "【30秒後に拠点に帰還します】"}

# プレイヤーを無敵化
    execute if score #mhdp_core_timer MhdpCore matches 1 as @a[tag=Ply.State.PlayingQuest] run tag @s remove Ply.State.EnableDamage
    execute if score #mhdp_core_timer MhdpCore matches 1 as @a[tag=Ply.State.PlayingQuest] run effect give @s resistance 30 10 true
    execute if score #mhdp_core_timer MhdpCore matches 540 as @a[tag=Ply.State.PlayingQuest] at @s run playsound entity.chicken.egg master @s ~ ~ ~ 6 0.5
    execute if score #mhdp_core_timer MhdpCore matches 540 as @a[tag=Ply.State.PlayingQuest] at @s run playsound entity.chicken.egg master @s ~ ~ ~ 6 0.6
    execute if score #mhdp_core_timer MhdpCore matches 540 as @a[tag=Ply.State.PlayingQuest] at @s run playsound entity.chicken.egg master @s ~ ~ ~ 6 0.7
    execute if score #mhdp_core_timer MhdpCore matches 540 run title @a[tag=Ply.State.PlayingQuest] times 3 60 0
    execute if score #mhdp_core_timer MhdpCore matches 540 run title @a[tag=Ply.State.PlayingQuest] title [{"text": "\uF999\uF802\uF802","font": "space"},{"text":"#","font":"icons/mhdp_icons"}]

# 帰還
    execute if score #mhdp_core_timer MhdpCore matches 600.. run function mhdp_core:phase/3_quest/change_phase/succeed/change
