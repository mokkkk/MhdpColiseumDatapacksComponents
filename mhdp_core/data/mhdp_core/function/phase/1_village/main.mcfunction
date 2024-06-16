#> mhdp_core:phase/1_village/main
#
# 村のtick処理
#
# @within function mhdp_core:tick

# クエスト受注
    execute if data storage mhdp_core:game_data {Phase:1} as @a run scoreboard players enable @s Ply.Ope.AcceptedQuestId
    execute as @a if score @s Ply.Ope.AcceptedQuestId matches 0.. run function mhdp_core:phase/1_village/quest/click_accept
