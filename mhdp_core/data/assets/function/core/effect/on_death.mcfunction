#> assets:core/effect/on_death
#
# デス時処理
#
# @within function mhdp_core:on_death

# データ読み込み
    function mhdp_core:player/data/load_data

# データコピー
    data modify storage mhdp_core:temp Temp.ActiveEffectList set from storage mhdp_core:temp PlayerData.ActiveEffectList

# 実行開始
    function assets:core/effect/on_death_loop.m

# データ保存
    function mhdp_core:player/data/save_data

# 終了
    data remove storage mhdp_core:temp Temp
