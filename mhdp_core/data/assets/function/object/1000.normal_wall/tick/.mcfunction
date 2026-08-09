#> assets:object/1000.normal_wall/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# 通常時
    execute if entity @s[tag=!Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] run function assets:object/1000.normal_wall/tick/tick_normal
# 破壊 ~ 消滅まで
    execute if entity @s[tag=Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] run function assets:object/1000.normal_wall/tick/tick_broken
# 消滅時
    execute if entity @s[tag=Asset.Build.IsRemove] run function assets:object/1000.normal_wall/tick/tick_remove
