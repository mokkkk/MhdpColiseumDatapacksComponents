#> assets:core/object/tick_loop.m
#
# オブジェクトtick共通処理
#
# @within function mhdp_core:tick

# データが無い場合、処理を終了
    execute unless data storage mhdp_core:temp Temp.ActiveEffectList[-1] run return 0

# データ取得
    data modify storage mhdp_core:temp Temp.ActiveEffect set from storage mhdp_core:temp Temp.ActiveEffectList[-1]
    data remove storage mhdp_core:temp Temp.ActiveEffectList[-1]

# tick減算
    execute store result score #temp_effect_tick MhdpCore run data get storage mhdp_core:temp Temp.ActiveEffect.Tick
    scoreboard players remove #temp_effect_tick MhdpCore 1

# tickに応じた処理
    # remove処理実行
        execute unless score #temp_effect_tick MhdpCore matches 1.. run function assets:core/effect/remove.m with storage mhdp_core:temp Temp.ActiveEffect
    # tick処理実行
        execute if score #temp_effect_tick MhdpCore matches 1.. run function assets:core/effect/tick.m with storage mhdp_core:temp Temp.ActiveEffect

# 終了
    scoreboard players reset #temp_effect_tick MhdpCore
