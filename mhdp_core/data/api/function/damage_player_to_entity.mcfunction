#> api:damage_player_to_entity
#
# プレイヤーからエンティティに与えるダメージ処理
#
# @input storage api: Arg.

# 攻撃者保持
    tag @s add Temp.Attacker

# データ取得
    # 攻撃者のデータ取得
        function api:damage_player_to_entity/get_player_data
    # 対象のデータ取得
        function api:damage_player_to_entity/get_monster_data

# ダメージ計算
    # ステータス関連スキル適用
        function api:damage_player_to_entity/skill/attack_status
    # ダメージ量計算
        function api:damage_player_to_entity/calc_raw_damage
    # 会心判定・ダメージ量関連スキル適用
        function api:damage_player_to_entity/skill/attack_damage
    # 実ダメージ量計算
        function api:damage_player_to_entity/calc_actual_damage

# 演出
    execute positioned as @n[type=slime,tag=Mns.HitBox,tag=Temp.Victim] run function api:damage_player_to_entity/vfx

# 斬れ味消費
    # デフォルト減少量
        scoreboard players set #mhdp_temp_sharpness_dec_value MhdpCore 1
    # 斬れ味消費量関連スキル適用
        function api:damage_player_to_entity/skill/sharpness
    # 適用
        execute store result storage api: Arg.Value int 1 run scoreboard players get #mhdp_temp_sharpness_dec_value MhdpCore
        execute if data storage api: Arg{IsDecreseSharpness:true} run function api:weapon_operation/decrease_sharpness.m with storage api: Arg

# モンスター側の被ダメージ処理に移行
    function mhdp_monsters:core/switch/damage

# データのリセット
    function api:damage_player_to_entity/reset
