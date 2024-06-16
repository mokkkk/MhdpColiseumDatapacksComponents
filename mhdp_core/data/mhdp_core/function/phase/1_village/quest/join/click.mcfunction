#> mhdp_core:phase/1_village/quest/join/click
#
# クエスト参加処理
#
# @within function mhdp_core:phase/1_village/click_ui

# クリック者対象に実行
    execute as @a[tag=Ply.Temp.Target] at @s run function mhdp_core:phase/1_village/quest/join/main
