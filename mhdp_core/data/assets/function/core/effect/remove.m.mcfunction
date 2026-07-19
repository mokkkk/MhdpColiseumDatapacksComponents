#> assets:core/effect/remove.m
#
# エフェクトremove共通処理
#
# @within function assets:core/**

# remove処理実行
    $function assets:effect/alias/$(EffectId)/remove

# データ消去
    $data remove storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:$(EffectId)}]
