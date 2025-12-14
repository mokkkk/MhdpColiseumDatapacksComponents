#> api:damage_entity_to_player/calc_raw_damage
#
# ダメージ量計算
#
# @input storage api: Arg.

# ダメージ軽減率計算
    # 80 / (80 + Def）* 100
    # 結果は 上記に100を掛けた数
        scoreboard players operation #temp_defence_effective_0 MhdpCore = #const_80 Const
        scoreboard players operation #temp_defence_effective_0 MhdpCore *= #const_100 Const
        scoreboard players operation #temp_defence_effective_1 MhdpCore = #const_80 Const
        scoreboard players operation #temp_defence_effective_1 MhdpCore += @s Ply.Stats.DefenceValue
        scoreboard players operation #temp_defence_effective_0 MhdpCore /= #temp_defence_effective_1 MhdpCore
        scoreboard players operation #temp_defence_effective_0 MhdpCore *= #const_100 Const
    # 適用
        scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #temp_defence_effective_0 MhdpCore
    # 桁合わせ
        scoreboard players operation #mhdp_temp_damage_total MhdpCore /= #const_10000 Const

# 終了
    scoreboard players reset #temp_defence_effective_0 MhdpCore
    scoreboard players reset #temp_defence_effective_1 MhdpCore
