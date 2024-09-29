#> mhdp_items:weapons/bow/type_tec/10_flying_shot/start_move
#
# 飛翔睨み撃ち 開始
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 移動ベクトル計算
    scoreboard players set $strength delta.api.launch 8000
    execute store result score #mhdp_temp_x_0 MhdpCore run data get storage mhdp_core:temp PlayerData.PrePos[0] 10000
    execute store result score #mhdp_temp_y_0 MhdpCore run data get storage mhdp_core:temp PlayerData.PrePos[1] 10000
    execute store result score #mhdp_temp_z_0 MhdpCore run data get storage mhdp_core:temp PlayerData.PrePos[2] 10000
    execute store result score #mhdp_temp_x_1 MhdpCore run data get storage mhdp_core:temp PlayerData.Pos[0] 10000
    execute store result score #mhdp_temp_y_1 MhdpCore run data get storage mhdp_core:temp PlayerData.Pos[1] 10000
    execute store result score #mhdp_temp_z_1 MhdpCore run data get storage mhdp_core:temp PlayerData.Pos[2] 10000
    execute store result score $x delta.api.launch run scoreboard players operation #mhdp_temp_x_1 MhdpCore -= #mhdp_temp_x_0 MhdpCore
    execute store result score $y delta.api.launch run scoreboard players operation #mhdp_temp_y_1 MhdpCore -= #mhdp_temp_y_0 MhdpCore
    execute store result score $z delta.api.launch run scoreboard players operation #mhdp_temp_z_1 MhdpCore -= #mhdp_temp_z_0 MhdpCore
    scoreboard players operation $y delta.api.launch += $strength delta.api.launch

# 飛ぶ
    tp @s @s
    function delta:api/launch_xyz
        
# 終了
    scoreboard players reset #mhdp_temp_x_0
    scoreboard players reset #mhdp_temp_y_0
    scoreboard players reset #mhdp_temp_z_0
    scoreboard players reset #mhdp_temp_x_1
    scoreboard players reset #mhdp_temp_y_1
    scoreboard players reset #mhdp_temp_z_1
