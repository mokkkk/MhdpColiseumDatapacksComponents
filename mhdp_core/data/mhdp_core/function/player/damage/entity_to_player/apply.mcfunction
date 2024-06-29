#> mhdp_core:player/damage/entity_to_player/apply
#
# モンスターからプレイヤーに対してのダメージ処理 ダメージ適用
#
# @within function mhdp_core:player/damage/entity_to_player/main

# ガード判定
    # scoreboard players set @s Wpn.GuardStopTimer 5

# ノックバック
    function mhdp_core:player/damage/entity_to_player/knockback/main

# ダメージ

# タイマー更新
    
    # 無敵時間
        execute if data storage mhdp_core:temp Damage{IsDisableDamageInterval:false} run scoreboard players set @s Ply.Timer.DamageInterval 20

tellraw @a [{"text": "ダメージ量："},{"score":{"name":"#mhdp_temp_damage_total","objective":"MhdpCore"}}]