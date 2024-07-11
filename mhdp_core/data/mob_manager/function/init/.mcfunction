#> mob_manager:init/
#
# Mobのデータを初期化します
#
# @within function
#   core:tick/
#   asset_manager:mob/summon/set_data

# Mhdp処理用のUuidを設定
    scoreboard players add #mhdp_global_uuid Entity.Uuid 1
    execute if score #mhdp_global_uuid Entity.Uuid matches 2147483647.. run scoreboard players set #mhdp_global_uuid Entity.Uuid -2147483648
    scoreboard players operation @s Entity.Uuid = #mhdp_global_uuid Entity.Uuid

# 識別用のフラグセット
    function mob_manager:init/add_flag
# AssetMobで無ければタグの付与
    # execute if entity @s[tag=!AssetMob] run function mob_manager:init/add_tag
# 初期化フラグ追加
    tag @s add AlreadyInitMob
