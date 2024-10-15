#> mhdp_monsters:core/util/tick/force_remove
# 
# 汎用処理 tickの共通処理 強制remove
#
# @within function mhdp_monsters:/**

# 通知
    tellraw @a {"text":"ERROR：モンスターが読み込み範囲外に出ました。\nこのエラーが頻出する場合、製作者に報告してください。","color": "red"}

# 全モンスターremove処理
    execute as @e[tag=Mns.Root] at @s run function mhdp_monsters:core/switch/remove

# クエスト中断
    function mhdp_core:phase/3_quest/end/retired
