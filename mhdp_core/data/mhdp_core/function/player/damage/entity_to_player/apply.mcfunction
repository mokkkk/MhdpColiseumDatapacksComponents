#> mhdp_core:player/damage/entity_to_player/apply
#
# モンスターからプレイヤーに対してのダメージ処理 ダメージ適用
#
# @within function mhdp_core:player/damage/entity_to_player/main
# @input
#        storage mhdp_core:temp Damage.Knockback ノックバックタイプ

# ダメージ軽減率初期値
    scoreboard players set #mhdp_temp_damage_reduction MhdpCore 100

# タイマー更新
    # 無敵時間
        execute if data storage mhdp_core:temp Damage{IsDisableDamageInterval:false} run scoreboard players set @s Ply.Timer.DamageInterval 20

# 必要な値の取得
    # ノックバックの大きさ
        execute store result score #mhdp_temp_knockback_strength MhdpCore run data get storage mhdp_core:temp Damage.Knockback

# ガード判定
    execute if entity @s[tag=Ply.Weapon.Guard] run function mhdp_core:player/damage/entity_to_player/guard/main

# 被ダメージ時処理
    execute if entity @s[tag=!Ply.Weapon.Guard] run function mhdp_items:core/switch/weapon_on_damage

# ノックバック
    function mhdp_core:player/damage/entity_to_player/knockback/main

# スキル効果適用
    function mhdp_core:player/skill/damage/damage

# ダメージ
    # ダメージ軽減率適用
        scoreboard players operation #mhdp_temp_damage_total MhdpCore *= #mhdp_temp_damage_reduction MhdpCore
        scoreboard players operation #mhdp_temp_damage_total MhdpCore /= #const_100 Const
    # 根性
        function mhdp_core:player/skill/damage/guts
    # ダメージ量取得
        execute store result storage mhdp_core:temp Arg.TotalDamage float 0.01 run scoreboard players get #mhdp_temp_damage_total MhdpCore
    # ダメージを与える
        function mhdp_core:player/damage/entity_to_player/macro/m.damage with storage mhdp_core:temp Arg

# 演出
    execute if entity @s[tag=Ply.Weapon.Guard] at @s run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 終了
    scoreboard players reset #mhdp_temp_damage_reduction MhdpCore
    scoreboard players reset #mhdp_temp_knockback_strength MhdpCore
    data remove storage mhdp_core:temp Arg
