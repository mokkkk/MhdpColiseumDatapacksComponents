#> assets:core/field/late_init.m
#
# フィールドlate_init共通処理

# late_init処理実行
    $function assets:field/alias/$(FieldId)/late_init

# プレイヤーを移動
    execute as @a[tag=Ply.State.PlayingQuest] run function assets:core/field/move_to_field.m with storage mhdp_core:game_data ActiveField.StartPos
