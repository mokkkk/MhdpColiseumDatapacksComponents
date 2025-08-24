#> mhdp_items:pickaxes/util/check_look_pos
#
# 見ている位置の確認
#
# @within function mhdp_items:**

# 視点は5ブロック以内
    scoreboard players set #temp_look_distance MhdpCore 10
    execute at @s anchored eyes positioned ^ ^ ^0.5 run function mhdp_items:pickaxes/util/check_look_pos_loop
    scoreboard players reset #temp_look_distance MhdpCore

# ブロックを見ていない場合、水平方向で実行
    execute unless entity @s[tag=Itm.Pick.Executed] rotated ~ 0 positioned ^ ^ ^5 align xyz positioned ~0.5 ~0.5 ~0.5 run function mhdp_items:pickaxes/util/execute_command

# 終了
    tag @s remove Itm.Pick.Executed
