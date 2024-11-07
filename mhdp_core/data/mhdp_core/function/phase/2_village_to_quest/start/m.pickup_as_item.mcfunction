#> mhdp_core:phase/2_village_to_quest/start/m.pickup_as_item
#
# 村→クエスト移行時の開始処理 落ちているアイテムの回収 アイテム基準の実行
#
# @within function mhdp_core:phase/2_village_to_quest/start/pickup

# 落とし物チェストに移動
    $execute if items block $(X) $(Y) $(Z) container.26 * run tag @s add Other.Temp.Right
    $execute if entity @s[tag=!Other.Temp.Right] run loot insert $(X) $(Y) $(Z) mine 0 0 0 debug_stick
    $execute if entity @s[tag=Other.Temp.Right] positioned $(X) $(Y) $(Z) rotated $(Rotate) 0 positioned ^ ^ ^1 run loot insert ~ ~ ~ mine 0 0 0 debug_stick
    tag @s remove Other.Temp.Right
