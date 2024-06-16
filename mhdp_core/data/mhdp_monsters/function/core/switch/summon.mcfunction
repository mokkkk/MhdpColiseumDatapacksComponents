#> mhdp_monsters:core/switch/summon
# 
# 分岐処理 モンスター召喚処理
#
# @within function mhdp_monsters:/**

# 分岐処理
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:temp Arg.MonsterUid
    function mhdp_monsters:core/switch/macro/m.summon_get_data with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.summon with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg
