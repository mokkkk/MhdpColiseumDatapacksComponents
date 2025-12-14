#> api:damage_entity_to_player/get_attack_data
#
# プレイヤーのステータス取得
#
# @input storage api: Arg.

# 基礎ダメージ
    # 基準値
        execute store result score #mhdp_temp_damage_total MhdpCore run data get storage mhdp_core:temp Arg.DamageValue 100
    # クエストによる攻撃力倍率
        # execute store result score #mhdp_temp_attack_multiply_quest MhdpCore run data get storage mhdp_core:game_data ActiveQuest.AttackMultiply
        scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #mhdp_temp_attack_multiply_quest MhdpCore
    # 怒りによる倍率
        execute unless score #mhdp_temp_attack_multiply_anger MhdpCore matches 1.. run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
        scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #mhdp_temp_attack_multiply_anger MhdpCore
    # 桁合わせ
        scoreboard players operation #mhdp_temp_damage_total MhdpCore /= #const_10000 Const

# 属性ダメージ割合
    execute store result score #mhdp_temp_element_dagame_multiply MhdpCore run data get storage mhdp_core:temp Arg.ElementMultiply

# 属性ダメージ軽減率
    scoreboard players set #mhdp_temp_element_defence_effective MhdpCore 0
    execute if data storage mhdp_core:temp Arg{ElementType:1} run scoreboard players operation #mhdp_temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Fire
    execute if data storage mhdp_core:temp Arg{ElementType:2} run scoreboard players operation #mhdp_temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Water
    execute if data storage mhdp_core:temp Arg{ElementType:3} run scoreboard players operation #mhdp_temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Thunder
    execute if data storage mhdp_core:temp Arg{ElementType:4} run scoreboard players operation #mhdp_temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Ice
    execute if data storage mhdp_core:temp Arg{ElementType:5} run scoreboard players operation #mhdp_temp_element_defence_effective MhdpCore = @s Ply.Stats.DefenceValue.Dragon

# 威力値
    execute store result score #mhdp_temp_guard_value MhdpCore run data get storage mhdp_core:temp Arg.GuardValue

# ノックバック
    execute store result score #mhdp_temp_knockback_strength MhdpCore run data get storage mhdp_core:temp Arg.Knockback

# フラグ確認
    execute unless data storage mhdp_core:temp Arg{UseUtil:true} run tellraw @a [{"text":"【ERROR: モンスター攻撃データ初期化に util/tick/get_attack_data.m が使用されていません】","color":"red"}]

# 終了
    scoreboard players reset #mhdp_temp_attack_multiply_quest MhdpCore
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
