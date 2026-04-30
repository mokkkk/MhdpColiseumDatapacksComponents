#> assets:core/field/move_to_field.m
#
# フィールドinit共通処理

# 移動
    $tp @s $(X) $(Y) $(Z)

# スポーン位置更新
    $spawnpoint @s $(X) $(Y) $(Z)

# エリアをBCに指定
    scoreboard players set @s Fld.CurrentAreaId 0
