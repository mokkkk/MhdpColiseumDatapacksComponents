#> mhdp_monsters:core/switch/macro/m.get_loot_table
# 
# 分岐処理 モンスター被ダメージ処理 本体
#
# @within function mhdp_monsters:core/switch/remove

# 素材付与用のloot_tableを取得
    $data modify storage mhdp_core:temp Temp.LootTable set from storage mhdp_core:monster_data MonsterData[{Uid:$(MonsterUid)}].LootTable
