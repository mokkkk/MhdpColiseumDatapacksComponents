#> mhdp_core:player/trigger/quest/click_accept
#
# player別に毎tick実行される処理 trigger関連
#
# @within function mhdp_core:player/tick

# クエスト受注処理実行
    function mhdp_core:phase/1_village/quest/click_accept

# 終了処理
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1
    scoreboard players enable @s Ply.Ope.AcceptedQuestId
