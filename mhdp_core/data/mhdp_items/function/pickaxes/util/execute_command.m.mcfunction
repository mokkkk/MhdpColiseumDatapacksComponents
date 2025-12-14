#> mhdp_items:pickaxes/util/execute_command
#
# 処理の実行
#
# @within function mhdp_items:**

# 実行フラグ
    tag @s add Itm.Pick.Executed

# バリデート実行
    $function $(Command) with storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp Arg
