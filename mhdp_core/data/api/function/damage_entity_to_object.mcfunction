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
    tag @s add Asset.Build.Temp.AttackTarget
    execute if data storage api: Return{IsSkipped:false} as @n[type=item_display,tag=Temp.ObjectAttacker,distance=..80] run function mhdp_monsters:core/switch/on_attack_object
    tag @s remove Asset.Build.Temp.AttackTarget

# モンスターの処理に応じてRemoveTick上書き
    execute if data storage api: Return.OverrideRemoveTick run function assets:core/object/build/override_remove_tick

# 終了
    function api:damage_entity_to_object/reset
