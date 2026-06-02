#> api:damage_entity_to_object
#
# エンティティから建築物に与えるダメージ処理
#
# @input storage api: Arg.

# データ取得
    function api:damage_entity_to_object/get_attack_data

# ダメージ処理実行
    function assets:core/object/build/damage

# モンスター側の建築物攻撃処理実行
    execute if data storage api: Return{IsSkipped:false} as @n[type=item_display,tag=Temp.ObjectAttacker,distance=..80] run function mhdp_monsters:core/switch/on_attack_object

# 終了
    function api:damage_entity_to_object/reset
