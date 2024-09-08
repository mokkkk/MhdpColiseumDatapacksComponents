#> mhdp_core:player/damage/entity_to_player/main
#
# モンスターからプレイヤーに対してのダメージ処理
#
# @within function mhdp_monsters:**
# @input
#        storage mhdp_core:temp Damage.DamageValue ダメージ量
#        storage mhdp_core:temp Damage.GuardValue 威力値、20以上の場合回避不可
#        storage mhdp_core:temp Damage.ElementType 属性種別
#        storage mhdp_core:temp Damage.ElementMultiply 属性比重
#        storage mhdp_core:temp Damage.Knockback ノックバックタイプ
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無
#        storage mhdp_core:temp Damage.IsDisableDefence 防御力無効化
#        storage mhdp_core:temp Damage.IsDisableDamageInterval 無敵時間無効化
#        storage mhdp_core:temp Damage.IsDisableGuts 根性無効化
#        score #mhdp_temp_attack_multiply_anger MhdpCore 怒りによるダメージ倍率
# @output
#        score #mhdp_temp_damage_total MhdpCore 総ダメージ量

# 威力値取得
    execute store result score #mhdp_temp_guard_value MhdpCore run data get storage mhdp_core:temp Damage.GuardValue

# 処理の中断
    # プレイヤー以外が実行者の場合
        execute unless entity @s[type=player] run return 0
    # 無敵時間
        execute if score @s Ply.Timer.DamageInterval matches 1.. run return 0
    # フレーム回避
        execute if score @s Ply.Timer.Avoid matches 1.. if score #mhdp_temp_guard_value MhdpCore matches ..19 at @s run return run function mhdp_core:player/damage/entity_to_player/avoid/main

# 基礎ダメージ計算
    # クエストによる攻撃力倍率
        execute store result score #mhdp_temp_damage_total MhdpCore run data get storage mhdp_core:temp Damage.DamageValue 100
        execute store result score #mhdp_temp_attack_multiply_quest MhdpCore run data get storage mhdp_core:game_data ActiveQuest.AttackMultiply
        scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #mhdp_temp_attack_multiply_quest MhdpCore
    # 怒りによる倍率
        execute unless score #mhdp_temp_attack_multiply_anger MhdpCore matches 1.. run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
        scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #mhdp_temp_attack_multiply_anger MhdpCore
    # 桁合わせ
        scoreboard players operation #mhdp_temp_damage_total MhdpCore /= #const_10000 Const

# ダメージ軽減率適用
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
        execute store result score #mhdp_temp_element_damage MhdpCore run scoreboard players operation #mhdp_temp_damage_total MhdpCore /= #const_10000 Const

# 属性ダメージ軽減率適用    
    # 属性ダメージ軽減率取得
        scoreboard players set #temp_element_defence_effective MhdpCore 0
        execute if data storage mhdp_core:temp Damage{ElementType:1} run scoreboard players operation #temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Fire
        execute if data storage mhdp_core:temp Damage{ElementType:2} run scoreboard players operation #temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Water
        execute if data storage mhdp_core:temp Damage{ElementType:3} run scoreboard players operation #temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Thunder
        execute if data storage mhdp_core:temp Damage{ElementType:4} run scoreboard players operation #temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Ice
        execute if data storage mhdp_core:temp Damage{ElementType:5} run scoreboard players operation #temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Dragon
    # 属性ダメージ割合計算
        execute store result score #mhdp_temp_element_dagame_multiply MhdpCore run data get storage mhdp_core:temp Damage.ElementMultiply
        scoreboard players operation #mhdp_temp_element_damage MhdpCore *= #mhdp_temp_element_dagame_multiply MhdpCore
        scoreboard players operation #mhdp_temp_element_damage MhdpCore *= #temp_element_defence_effective MhdpCore
        scoreboard players operation #mhdp_temp_element_damage MhdpCore /= #const_10000 Const
    # 適用
        scoreboard players operation #mhdp_temp_damage_total MhdpCore -= #mhdp_temp_element_damage MhdpCore

# ダメージ適用
    # 適用
        function mhdp_core:player/damage/entity_to_player/apply
    
# 終了
    scoreboard players reset #mhdp_temp_damage_total MhdpCore
    scoreboard players reset #mhdp_temp_attack_multiply_quest MhdpCore
    scoreboard players reset #temp_defence_effective_0 MhdpCore
    scoreboard players reset #temp_defence_effective_1 MhdpCore
    scoreboard players reset #temp_element_defence_effective MhdpCore
    scoreboard players reset #mhdp_temp_element_dagame_multiply MhdpCore
    scoreboard players reset #mhdp_temp_element_damage MhdpCore
