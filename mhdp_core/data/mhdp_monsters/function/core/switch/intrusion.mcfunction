#> mhdp_monsters:core/switch/intrusion
# 
# 分岐処理 モンスター召喚処理
#
# @within function mhdp_monsters:/**

# 召喚対象のUidとデータ取得
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:temp Arg.SummonMonsterUid
    data modify storage mhdp_core:temp Temp.Arg.Override set from storage mhdp_core:temp Temp.IntrusionMonsterData.Override

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.summon_get_data with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.intrusion with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg
    data remove storage mhdp_core:temp TargetMonsterData

# say 乱入処理実行