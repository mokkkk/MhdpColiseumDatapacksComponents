#> mhdp_items:sp_items/nikuyaki/using/click
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/nikuyaki/tick

# クリック者のUID確認
    execute unless score @s Ply.Uid = @p[tag=Ply.Temp.Target] Ply.Uid run return 0

# クリック者対象に実行
    execute as @a[tag=Ply.Temp.Target] at @s run function mhdp_items:sp_items/nikuyaki/using/click_on_player
