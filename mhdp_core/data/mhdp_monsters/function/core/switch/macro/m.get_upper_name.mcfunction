#> mhdp_monsters:core/switch/macro/m.get_upper_name
# 
# 分岐処理 モンスター召喚処理 prefixとupper_nameの取得
#
# @within function mhdp_monsters:core/switch/damage

# モンスター召喚用のprefixとupper_nameを取得
    $data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:monster_data MonsterData[{Uid:$(MonsterUid)}].Name
    $data modify storage mhdp_core:temp Temp.UpperName set from storage mhdp_core:monster_data MonsterData[{Uid:$(MonsterUid)}].UpperName
