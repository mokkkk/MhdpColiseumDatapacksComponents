#> mhdp_items:player/ui/sharpness/main
#
# UI処理 斬れ味
#

# 斬れ味色取得
    execute store result score #mhdp_temp_sharpness MhdpCore run data get storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".CurrentSharpnessColor

# UI設定
    execute if entity @s[tag=Ply.Flag.HideSharpness] run data modify storage mhdp_core:temp UI.Sharpness set value '[{"text":"\\uF888\\uF888\\uF888\\uF888\\uF888\\uF888\\uF802","font":"space"}]'
    execute if entity @s[tag=!Ply.Flag.HideSharpness] run data modify storage mhdp_core:temp UI.Sharpness set value '["",{"score":{"name":"#mhdp_temp_sharpness","objective":"MhdpCore"},"font":"ui/sharpness"}]'
