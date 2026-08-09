#> assets:core/object/is_broken
#
# オブジェクトis_broken共通処理
#
# @within function mhdp_core:is_broken

# is_broken処理実行
    data modify storage mhdp_core:temp Temp.Function set value "is_broken"
    execute store result storage mhdp_core:temp Temp.ObjectId int 1 run scoreboard players get @s ObjectId
    function assets:core/object/execute.m with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
