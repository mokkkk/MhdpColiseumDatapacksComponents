#> assets:core/effect/apply.m
#
# Effect適用処理
#
# @within function mhdp_core:tick

# データ取得
    function mhdp_core:player/data/load_data

# Effect用Storageがない場合、追加
    execute unless data storage mhdp_core:temp PlayerData.ActiveEffectList run data modify storage mhdp_core:temp PlayerData.ActiveEffectList set value []

# apply処理実行
    $function assets:effect/alias/$(EffectId)/apply

# データ保存
    function mhdp_core:player/data/save_data
