#> mhdp_core:phase/2_village_to_quest/start/main
#
# 村→クエスト移行時の開始処理
#
# @within function mhdp_core:phase/2_village_to_quest/tick

# 通知
    execute if score #mhdp_core_timer MhdpCore matches 1 run tellraw @a {"text": "【クエストに出発します・・・】"}

# 連番ID増加
    scoreboard players add #mhdp_core_quest_serial_id QuestSerialId 1

# クエスト参加者に対する実行
    execute as @a[tag=Ply.State.QuestMember] run function mhdp_core:phase/2_village_to_quest/start/quest_member

# 落ちているアイテムの回収
    function mhdp_core:phase/2_village_to_quest/start/pickup

# クエストデータのロード
    function mhdp_core:phase/2_village_to_quest/start/quest/main
