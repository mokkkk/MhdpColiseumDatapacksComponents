#> assets:core/object/tick
#
# オブジェクトtick共通処理
#
# @within function mhdp_core:tick

# tick処理実行
    tag @s add This
    data modify storage mhdp_core:temp Temp.Function set value "tick"
    execute store result storage mhdp_core:temp Temp.ObjectId int 1 run scoreboard players get @s ObjectId
    function assets:core/object/execute.m with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    tag @s remove This
