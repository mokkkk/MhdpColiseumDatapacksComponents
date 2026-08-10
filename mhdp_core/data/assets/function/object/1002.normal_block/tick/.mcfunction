#> assets:object/1002.normal_block/tick/
#
# tick処理

# スコア増加
    scoreboard players add @s ObjectTick 1

# モデルチェック
    function assets:core/object/build/update_model.m {\
        Time0:25,Time1:50,Time2:75,\
        Hp0:4,Hp1:2,Hp2:1\
    }

# 通常時
    execute if entity @s[tag=!Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] run function assets:object/1002.normal_block/tick/tick_normal
# 破壊 ~ 消滅まで
    execute if entity @s[tag=Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] run function assets:object/1002.normal_block/tick/tick_broken
# 消滅時
    execute if entity @s[tag=Asset.Build.IsRemove] run function assets:object/1002.normal_block/tick/tick_remove
