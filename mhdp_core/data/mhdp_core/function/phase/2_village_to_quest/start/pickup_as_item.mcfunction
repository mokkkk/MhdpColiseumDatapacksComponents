#> mhdp_core:phase/2_village_to_quest/start/pickup_as_item
#
# 村→クエスト移行時の開始処理 落ちているアイテムの回収 アイテム基準の実行
#
# @within function mhdp_core:phase/2_village_to_quest/start/pickup

# 回収しない対象のアイテムは除外
    execute if items entity @s contents *[minecraft:custom_data={NoPickup:1b}] run return 0
    execute if items entity @s contents *[minecraft:custom_data={IsUsing:1b}] run return 0

# 一時チェストに入れる
    item replace block 0 0 0 container.0 from entity @s contents

# 落とし物チェストに移動
    execute if items block 260 64 212 container.26 * run tag @s add Other.Temp.Right
    execute if entity @s[tag=!Other.Temp.Right] run loot insert 260 64 212 mine 0 0 0 debug_stick
    execute if entity @s[tag=Other.Temp.Right] run loot insert 259 64 212 mine 0 0 0 debug_stick
    tag @s remove Other.Temp.Right
