#> assets:core/effect/on_start_quest
#
# クエスト開始時処理
#
# @within function mhdp_core:on_start_quest

# データ読み込み
    function mhdp_core:player/data/load_data

# データコピー
    data modify storage mhdp_core:temp Temp.ActiveEffectList set from storage mhdp_core:temp PlayerData.ActiveEffectList

# 実行開始
    function assets:core/effect/on_start_quest_loop.m

# データ保存
    function mhdp_core:player/data/save_data

# 終了
    data remove storage mhdp_core:temp Temp
