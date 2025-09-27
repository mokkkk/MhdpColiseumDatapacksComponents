#> api:damage_entity_to_player
#
# エンティティからプレイヤーに与えるダメージ処理
#
# @input storage api: Arg.

# 処理の中断
    # プレイヤー以外が実行者の場合
        execute unless entity @s[type=player] run return 0
    # 無敵時間
        execute if score @s Ply.Timer.DamageInterval matches 1.. run return 0
    # フレーム回避
        execute if score @s Ply.Timer.Avoid matches 1.. if score #mhdp_temp_guard_value MhdpCore matches ..19 at @s run return run function mhdp_core:player/damage/entity_to_player/avoid/main

# データ取得
    function api:damage_entity_to_player/get_attack_data

# ダメージ計算
    # 防御力によるダメージ軽減
        function api:damage_entity_to_player/calc_raw_damage
    # 属性ダメージ軽減
        function api:damage_entity_to_player/calc_element_damage

# TODO:プレイヤーへのダメージ適用
    function api:damage_entity_to_player/apply/apply_damage
    # 参考
    # function mhdp_core:player/damage/entity_to_player/apply

# 終了
    function api:damage_entity_to_player/reset
