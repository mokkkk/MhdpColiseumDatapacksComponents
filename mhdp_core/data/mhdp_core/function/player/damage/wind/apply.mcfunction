#> mhdp_core:player/damage/wind/apply
#
# モンスターからプレイヤーに対してのダメージ処理 ダメージ適用
#
# @within function mhdp_core:player/damage/wind/main

# 必要な値の取得
    # 風圧の大きさ
        execute store result score #mhdp_temp_wind_value MhdpCore run data get storage mhdp_core:temp Damage.WindValue 1

# ガード判定
    execute if entity @s[tag=Ply.Weapon.Guard] run function mhdp_core:player/damage/wind/guard/main

# スキル効果適用
    function mhdp_core:player/skill/damage/wind

# ノックバック
    function mhdp_core:player/damage/wind/knockback/main

# 演出
    execute if entity @s[tag=Ply.Weapon.Guard] at @s run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 終了
    scoreboard players reset #mhdp_temp_wind_value MhdpCore
