#> mhdp_core:phase/2_village_to_quest/tick
#
# 村→クエスト移行時のtick処理
#
# @within function mhdp_core:phase/tick

# タイマー増加
    scoreboard players add #mhdp_core_timer MhdpCore 1

# 出発ファンファーレを鳴らす
    execute if score #mhdp_core_timer MhdpCore matches 10 as @a at @s run playsound minecraft:custom.departure master @s ~ ~ ~ 3 1

# 開始処理
    execute if score #mhdp_core_timer MhdpCore matches 1 run function mhdp_core:phase/2_village_to_quest/start/main

# クエスト参加者以外への通知
    execute if score #mhdp_core_timer MhdpCore matches 20 run tellraw @a[tag=!Ply.State.QuestMember] {"text": "【データの読み込みを開始します】"}

# クエスト参加者に盲目付与
    execute if score #mhdp_core_timer MhdpCore matches 20 run effect give @a[tag=Ply.State.QuestMember] blindness 3 1 true

# 次Phaseに移行
    execute if score #mhdp_core_timer MhdpCore matches 50 run function mhdp_core:phase/2_village_to_quest/change_phase/change
