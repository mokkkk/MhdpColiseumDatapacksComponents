#> mhdp_core:player/damage/player_to_entity/reset_sharpness
#
# プレイヤーからモンスターに対してのダメージ処理 斬れ味回復
#
# @within function mhdp_core:player/damage/player_to_entity/main

# 念のためデータ取得
    function mhdp_core:player/data/load_data

# 斬れ味の取得
    execute if entity @s[tag=!Skill.Extra.Handicraft] run data modify storage mhdp_core:temp Args.CurrentSharpness set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".SharpnessMax
    execute if entity @s[tag=Skill.Extra.Handicraft] run data modify storage mhdp_core:temp Args.CurrentSharpness set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".SharpnessMaxCraft
    data modify storage mhdp_core:temp Result.CurrentSharpness set from storage mhdp_core:temp Args.CurrentSharpness
    data modify storage mhdp_core:temp Args.SharpnessArray set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".Sharpness

# 斬れ味色計算
    function mhdp_items:core/util/calc_sharpness_color

# 通知
    execute store result score #mhdp_temp_sharpness_color_current MhdpCore run data get storage mhdp_core:temp Result.SharpnessColor
    execute unless score @s Ply.Stats.CurrentSharpnessColor = #mhdp_temp_sharpness_color_current MhdpCore run function mhdp_core:player/damage/player_to_entity/reset_sharpness_notify
    scoreboard players operation @s Ply.Stats.CurrentSharpnessColor = #mhdp_temp_sharpness_color_current MhdpCore

# データ更新
    function mhdp_core:player/damage/player_to_entity/macro/m.update_sharpness with storage mhdp_core:temp Result
    
# 終了
    data remove storage mhdp_core:temp Result
    scoreboard players reset #mhdp_temp_sharpness_color_current MhdpCore
