#> mhdp_items:sp_items/nikuyaki/using/get_target_model
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# 対象のマーカーを取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @e[type=item_display,tag=Itm.Root.Nikuyaki] if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add Itm.Root.Nikuyaki.Target
    scoreboard players reset #mhdp_temp_target_player_uid

# 対象の処理実行
    tag @s add Ply.Temp.Target
    execute as @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] at @s run function mhdp_items:sp_items/nikuyaki/using/tick_on_model
    tag @s remove Ply.Temp.Target

# 紐づけ対象がいない場合、使用中断
    execute unless entity @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run function mhdp_items:sp_items/nikuyaki/using/cancel

