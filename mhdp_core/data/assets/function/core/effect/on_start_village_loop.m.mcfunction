#> assets:core/object/on_start_village_loop.m
#
# クエスト終了時処理
#
# @within function mhdp_core:on_start_village

# データが無い場合、処理を終了
    execute unless data storage mhdp_core:temp Temp.ActiveEffectList[-1] run return 0

# データ取得
    data modify storage mhdp_core:temp Temp.ActiveEffect set from storage mhdp_core:temp Temp.ActiveEffectList[-1]
    data remove storage mhdp_core:temp Temp.ActiveEffectList[-1]

# IsRemoveStartVillage:trueの場合、remove処理実行
    execute if data storage mhdp_core:temp Temp.ActiveEffect{IsRemoveStartVillage:true} run function assets:core/effect/remove.m with storage mhdp_core:temp Temp.ActiveEffect

# 終了
    scoreboard players reset #temp_effect_on_start_village MhdpCore
