#> assets:object/1001.normal_tower/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# 通常時
    execute if entity @s[tag=!Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] run function assets:object/1001.normal_tower/tick/tick_normal
# 破壊 ~ 消滅まで
    execute if entity @s[tag=Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] run function assets:object/1001.normal_tower/tick/tick_broken
# 消滅時
    execute if entity @s[tag=Asset.Build.IsRemove] run function assets:object/1001.normal_tower/tick/tick_remove
