#> mhdp_items:sp_items/wirebug/using/get_target_marker
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# 対象のマーカーを取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @e[type=marker,tag=Mk.Sp.Wirebug.Rotation] if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add Mk.Sp.Wirebug.Rotation.Target
    scoreboard players reset #mhdp_temp_target_player_uid
