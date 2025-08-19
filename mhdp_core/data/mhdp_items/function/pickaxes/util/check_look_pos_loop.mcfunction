#> mhdp_items:pickaxes/util/check_look_pos_loop
#
# 見ている位置の確認
#
# @within
#    function mhdp_items:pickaxes/util/check_look_pos
#    function mhdp_items:pickaxes/util/check_look_pos_loop

# 処理
    scoreboard players remove #temp_look_distance MhdpCore 1
    execute unless block ^ ^ ^0.5 #mhdp_core:no_collision align xyz positioned ~0.5 ~0.5 ~0.5 run return run function mhdp_items:pickaxes/util/execute_command
    execute if score #temp_look_distance MhdpCore matches 1.. if block ^ ^ ^0.5 #mhdp_core:no_collision positioned ^ ^ ^0.5 run function mhdp_items:pickaxes/util/check_look_pos_loop
