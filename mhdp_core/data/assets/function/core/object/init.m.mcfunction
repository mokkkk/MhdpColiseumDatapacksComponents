#> assets:core/object/init.m
#
# オブジェクトtick共通処理
#
# @within function mhdp_core:tick

# init処理実行
    execute if entity @s[tag=!Asset.Object.Init] run return run tellraw @a {"text":"ERROR: 更新が必要ないオブジェクト、またはオブジェクト以外で object/init が実行されています","color":"red"}
    tag @s add This
    $scoreboard players set @s ObjectId $(ObjectId)
    $function assets:object/alias/$(ObjectId)/init
    data remove storage mhdp_core:temp Temp
    tag @s remove Asset.Object.Init
    tag @s remove This
