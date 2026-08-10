#> assets:core/object/build/update_model.m
#
# モデル更新

# 残存時間
    $execute if entity @s[tag=!Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] if score @s Build.Stats.DestroyLevel matches ..0 if score @s ObjectTick matches $(Time0).. run function assets:core/object/build/update_model_destroy_0
    $execute if entity @s[tag=!Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] if score @s Build.Stats.DestroyLevel matches ..1 if score @s ObjectTick matches $(Time1).. run function assets:core/object/build/update_model_destroy_1
    $execute if entity @s[tag=!Asset.Build.IsBroken,tag=!Asset.Build.IsRemove] if score @s Build.Stats.DestroyLevel matches ..2 if score @s ObjectTick matches $(Time2).. run function assets:core/object/build/update_model_destroy_2

# HP
    $execute if score @s Build.Stats.DestroyLevel matches ..0 if score @s Build.Stats.Hp matches ..$(Hp0) run function assets:core/object/build/update_model_destroy_0
    $execute if score @s Build.Stats.DestroyLevel matches ..1 if score @s Build.Stats.Hp matches ..$(Hp1) run function assets:core/object/build/update_model_destroy_1
    $execute if score @s Build.Stats.DestroyLevel matches ..2 if score @s Build.Stats.Hp matches ..$(Hp2) run function assets:core/object/build/update_model_destroy_2
