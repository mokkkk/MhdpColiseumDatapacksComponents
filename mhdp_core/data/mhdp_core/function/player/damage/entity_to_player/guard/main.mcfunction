#> mhdp_core:player/damage/entity_to_player/guard/main
#
# モンスターからプレイヤーに対してのダメージ処理 ガード
#
# @within function mhdp_core:player/damage/entity_to_player/apply
# @input
#        storage mhdp_core:temp Damage.GuardValue 威力値
#        storage mhdp_core:temp Damage.IsLaunch 打ち上げ有無

# ガード値取得
    execute if entity @s[tag=Ply.Weapon.Equip.ShortSword] run scoreboard players set #mhdp_temp_guard_strength MhdpCore 2
    execute if entity @s[tag=Ply.Weapon.Equip.GreatSword] run scoreboard players set #mhdp_temp_guard_strength MhdpCore 3
    function mhdp_core:player/skill/damage/guard

# 威力値取得
    execute store result score #mhdp_temp_guard_value MhdpCore run data get storage mhdp_core:temp Damage.GuardValue
    scoreboard players operation #mhdp_temp_guard_value MhdpCore -= #mhdp_temp_guard_strength MhdpCore

# スタミナ消費量決定
    execute if score #mhdp_temp_guard_value MhdpCore matches ..0 run scoreboard players set #mhdp_temp_guard_stamina MhdpCore 150
    execute if score #mhdp_temp_guard_value MhdpCore matches 1 run scoreboard players set #mhdp_temp_guard_stamina MhdpCore 180
    execute if score #mhdp_temp_guard_value MhdpCore matches 2 run scoreboard players set #mhdp_temp_guard_stamina MhdpCore 220
    execute if score #mhdp_temp_guard_value MhdpCore matches 3 run scoreboard players set #mhdp_temp_guard_stamina MhdpCore 300
    execute if score #mhdp_temp_guard_value MhdpCore matches 4 run scoreboard players set #mhdp_temp_guard_stamina MhdpCore 400

# ガード失敗時判定
    # 威力値が高い場合
        execute if score #mhdp_temp_guard_value MhdpCore matches 5.. run tag @s remove Ply.Weapon.Guard
    # スタミナが足りない場合
        execute if score @s Ply.Stats.Stamina < #mhdp_temp_guard_stamina MhdpCore run tag @s remove Ply.Weapon.Guard

# ガード成功時、ノックバックの値を上書き
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches ..2 if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 2
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 3..4 if score #mhdp_temp_knockback_strength MhdpCore matches 2.. run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 3

# ガード成功時、ダメージ軽減率設定
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches ..0 run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 0
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 1 run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 10
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 2 run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 25
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 3 run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 45
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 4 run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 60

# ガード成功時、のけぞり時間設定
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches ..0 run scoreboard players set @s Wpn.GuardStopTimer 8
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 1..2 run scoreboard players set @s Wpn.GuardStopTimer 18
    execute if entity @s[tag=Ply.Weapon.Guard] if score #mhdp_temp_guard_value MhdpCore matches 3..4 run scoreboard players set @s Wpn.GuardStopTimer 28

# 無敵時間上書き
    execute if entity @s[tag=Ply.Weapon.Guard] if data storage mhdp_core:temp Damage{IsDisableDamageInterval:false} run scoreboard players set @s Ply.Timer.DamageInterval 8

# 武器ごとの処理に遷移
    execute if entity @s[tag=Ply.Weapon.Guard] run function mhdp_items:core/switch/weapon_guard

# スタミナ消費適用
    scoreboard players operation @s Ply.Stats.Stamina -= #mhdp_temp_guard_stamina MhdpCore

# 終了
    execute if score @s Ply.Stats.Stamina matches ..0 run scoreboard players set @s Ply.Stats.Stamina 0
    scoreboard players reset #mhdp_temp_guard_value MhdpCore
    scoreboard players reset #mhdp_temp_guard_strength MhdpCore
    scoreboard players reset #mhdp_temp_guard_stamina MhdpCore
