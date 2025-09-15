#> mhdp_items:pickaxes/util/get_build_id
#
# 建築物IDの取得
#
# @within function mhdp_items:**

# 空中
    execute align y if block ~ ~-1 ~ #mhdp_core:no_collision run return run data modify storage mhdp_core:temp Arg.ObjectId set from storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data".Build3

# 地上・スニーク
    execute if entity @s[tag=Ply.Ope.IsSneaking] run return run data modify storage mhdp_core:temp Arg.ObjectId set from storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data".Build2

# それ以外(地上・立ち)
    data modify storage mhdp_core:temp Arg.ObjectId set from storage mhdp_core:temp PlayerData.Item.Mainhand.components."minecraft:custom_data".Build1
