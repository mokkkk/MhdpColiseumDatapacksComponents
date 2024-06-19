#> mhdp_core:phase/2_village_to_quest/start/pickup
#
# 村→クエスト移行時の開始処理 落ちているアイテムの回収
#
# @within function mhdp_core:phase/2_village_to_quest/start/main

# 初期化
    setblock 0 0 0 lime_shulker_box

# アイテムに対する実行
    execute as @e[type=item] at @s run function mhdp_core:phase/2_village_to_quest/start/pickup_as_item

# 終了
    kill @e[type=item]
