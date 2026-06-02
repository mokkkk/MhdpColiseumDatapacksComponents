#> api:damage_entity_to_object/get_attack_data
#
# 攻撃ステータス取得
#
# @input storage api: Arg.

# 基礎ダメージ
    # 基準値
        execute store result score #mhdp_temp_object_damage MhdpCore run data get storage mhdp_core:temp Arg.ObjectDamageValue 1
