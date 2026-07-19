#> assets:core/effect/execute.m
#
# エフェクトtick共通処理
#
# @within function assets:core/**

# tick処理実行
    $function assets:effect/alias/$(EffectId)/tick

# tick上書き
    $execute store result storage mhdp_core:temp PlayerData.ActiveEffectList[{EffectId:$(EffectId)}].Tick int 1 run scoreboard players get #temp_effect_tick MhdpCore
