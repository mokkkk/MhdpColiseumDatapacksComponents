#> mhdp_monsters:core/switch/damage
# 
# 分岐処理 モンスター被ダメージ処理
#
# @within function mhdp_monsters:/**

# Uid取得
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:temp Arg.TargetMonsterUid

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.get_upper_name with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.damage with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg
