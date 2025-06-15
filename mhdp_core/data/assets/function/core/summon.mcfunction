#> assets:core/summon
#
# オブジェクトtick共通処理
#
# @within function mhdp_core:tick

# tick処理実行
    data modify storage mhdp_core:temp Temp.Function set value "summon"
    execute store result storage mhdp_core:temp Temp.ObjectId int 1 run scoreboard players get @s ObjectId
    function assets:core/execute.m with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
