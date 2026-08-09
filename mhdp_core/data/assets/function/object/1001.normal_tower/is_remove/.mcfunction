#> assets:object/1001.normal_tower/is_remove/
#
# 破壊時処理

# 状態変更
    tag @s add Asset.Build.IsRemove

# タイマーリセット
    scoreboard players set @s ObjectTick 0
