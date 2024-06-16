#> mhdp_monsters:core/switch/macro/m.get_prefix
# 
# 分岐処理 モンスター召喚処理 prefix取得
#
# @within function mhdp_items:core/switch/weapon_init

# モンスター召喚用のprefixを取得
    $data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:monster_data MonsterData[{Uid:$(MonsterUid)}].Name
