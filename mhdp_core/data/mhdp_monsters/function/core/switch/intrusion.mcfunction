#> mhdp_monsters:core/switch/intrusion
# 
# 分岐処理 モンスター召喚処理
#
# @within function mhdp_monsters:/**

# 分岐処理
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:temp Arg.SummonMonsterUid
    function mhdp_monsters:core/switch/macro/m.summon_get_data with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.intrusion with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp TargetMonsterData

say 乱入処理実行