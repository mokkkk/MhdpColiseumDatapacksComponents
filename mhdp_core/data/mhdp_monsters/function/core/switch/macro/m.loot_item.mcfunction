#> mhdp_monsters:core/switch/macro/m.loot_item
# 
# 分岐処理 モンスター被ダメージ処理 本体
#
# @within function mhdp_monsters:core/switch/remove

# ルート処理実行
    $loot spawn ~ ~1 ~ loot $(LootTable)
