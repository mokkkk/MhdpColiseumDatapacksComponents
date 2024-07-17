#> mhdp_core:player/damage/voice/apply
#
# モンスターからプレイヤーに対してのダメージ処理 ダメージ適用
#
# @within function mhdp_core:player/damage/voice/main

# 必要な値の取得
    # 咆哮の大きさ
        execute store result score #mhdp_temp_voice_value MhdpCore run data get storage mhdp_core:temp Damage.VoiceValue 1
    # 初期値はノックバックなし
        scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0

# ガード判定
    execute if entity @s[tag=Ply.Weapon.Guard] run function mhdp_core:player/damage/voice/guard/main

# ノックバック
    function mhdp_core:player/damage/voice/knockback/main

# スキル効果適用
    function mhdp_core:player/skill/damage/voice

    execute if data storage mhdp_core:temp Damage run say ダメージ設定済み

# 咆哮
    execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_voice_value MhdpCore matches 1.. run function mhdp_core:player/damage/voice/macro/m.apply_voice with storage mhdp_core:temp Damage

# 演出
    execute if entity @s[tag=Ply.Weapon.Guard] at @s run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 終了
    scoreboard players reset #mhdp_temp_voice_value MhdpCore
    scoreboard players reset #mhdp_temp_knockback_strength MhdpCore

