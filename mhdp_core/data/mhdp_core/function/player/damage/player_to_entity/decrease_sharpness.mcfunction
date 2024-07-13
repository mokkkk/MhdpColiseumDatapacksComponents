#> mhdp_core:player/damage/player_to_entity/decrease_sharpness
#
# プレイヤーからモンスターに対してのダメージ処理 斬れ味消耗
#
# @within function mhdp_core:player/damage/player_to_entity/main
# @input
#        score #mhdp_temp_sharpness_dec_value MhdpCore 切れ味減少量

# 念のためデータ取得
    function mhdp_core:player/data/load_data

# 斬れ味の取得
    execute store result score #mhdp_temp_sharpness_current_test MhdpCore store result score #mhdp_temp_sharpness_current MhdpCore run data get storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".CurrentSharpness
    # 0は下回らない
        execute if score #mhdp_temp_sharpness_current MhdpCore matches ..0 run scoreboard players set #mhdp_temp_sharpness_current MhdpCore 1
# 斬れ味消費
    execute store result storage mhdp_core:temp Args.CurrentSharpness int 1 store result storage mhdp_core:temp Result.CurrentSharpness int 1 run scoreboard players operation #mhdp_temp_sharpness_current MhdpCore -= #mhdp_temp_sharpness_dec_value MhdpCore
    data modify storage mhdp_core:temp Args.SharpnessArray set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".Sharpness

# デバッグ用
    # tellraw @a [{"text": "【斬れ味： 前"},{"score":{"name":"#mhdp_temp_sharpness_current_test","objective":"MhdpCore"}},{"text": " → "},{"score":{"name":"#mhdp_temp_sharpness_current","objective":"MhdpCore"}},{"text": "】"}]

# 斬れ味色計算
    function mhdp_items:core/util/calc_sharpness_color

# 通知
    execute store result score #mhdp_temp_sharpness_color_current MhdpCore run data get storage mhdp_core:temp Result.SharpnessColor
    execute unless score @s Ply.Stats.CurrentSharpnessColor = #mhdp_temp_sharpness_color_current MhdpCore run function mhdp_core:player/damage/player_to_entity/decrease_sharpness_notify
    scoreboard players operation @s Ply.Stats.CurrentSharpnessColor = #mhdp_temp_sharpness_color_current MhdpCore

# データ更新
    function mhdp_core:player/damage/player_to_entity/macro/m.update_sharpness with storage mhdp_core:temp Result
    
# 終了
    data remove storage mhdp_core:temp Result
    scoreboard players reset #mhdp_temp_sharpness_color_current MhdpCore
    scoreboard players reset #mhdp_temp_sharpness_dec_value MhdpCore
