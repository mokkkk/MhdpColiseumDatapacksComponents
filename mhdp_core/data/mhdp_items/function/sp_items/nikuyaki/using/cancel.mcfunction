#> mhdp_items:sp_items/nikuyaki/using/cancel
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/nikuyaki/tick

# ride中の場合、中断
    ride @s dismount

# タグ消去
    tag @s remove Itm.Sp.Nikuyaki.Using

# スコア削除
    scoreboard players set @s Itm.Nikuyaki.GeneralTimer 0
