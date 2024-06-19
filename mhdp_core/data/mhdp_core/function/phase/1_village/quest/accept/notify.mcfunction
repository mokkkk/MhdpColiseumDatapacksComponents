#> mhdp_core:phase/1_village/quest/accept/notify
#
# クエスト受注処理 受注内容の表示
#
# @within function mhdp_core:phase/1_village/quest/accept/main

# 通知
    execute as @a at @s run playsound entity.player.levelup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    tellraw @a [{"text": "【"},{"selector":"@s"},{"text": "がクエストを受注しました】"}]
    tellraw @a {"text": "--------------------------------------------------","color": "light_purple"}

# クエスト内容の表示
    # クエストデータのロード
        execute store result storage mhdp_core:temp Temp.ActiveQuestId int 1 run scoreboard players get #mhdp_core_loading_quest_id MhdpCore
        function mhdp_core:phase/1_village/quest/accept/macro/m.get_questdata with storage mhdp_core:temp Temp
        data remove storage mhdp_core:temp Temp
    # 表示データの作成
        data modify storage mhdp_core:temp Data set value {}
        function mhdp_core:phase/1_village/quest/accept/macro/m.create_notifydata with storage mhdp_core:temp TargetQuest
        data remove storage mhdp_core:temp TargetQuest
    # 通知
        function mhdp_core:phase/1_village/quest/accept/macro/m.notify with storage mhdp_core:temp Data
    # 終了
        scoreboard players reset #mhdp_temp_grobal
        data remove storage mhdp_core:temp Data

# 通知
    tellraw @a {"text": "--------------------------------------------------","color": "light_purple"}
