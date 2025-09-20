#> mhdp_items:pickaxes/util/on_block
#
# 空中での使用時
#
# @within function mhdp_items:**

# 足元で実行
    execute positioned ~ ~-0.5 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function mhdp_items:pickaxes/util/execute_command.m with storage api: Arg

# 終了
    tag @s remove Itm.Pick.Executed
    data remove storage api: Return
