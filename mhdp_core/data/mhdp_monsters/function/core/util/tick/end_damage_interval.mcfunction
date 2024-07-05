#> mhdp_monsters:core/util/tick/end_damage_interval
# 
# 汎用処理 同士討ちの無敵時間終了
#
# @within function mhdp_monsters:core/util/tick/tick

# Uid取得
    data modify storage mhdp_core:temp Temp.MonsterUid set from storage mhdp_core:temp Damage.TargetMonsterUid

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.get_upper_name with storage mhdp_core:temp Temp
    function mhdp_monsters:core/util/tick/macro/m.end_damage_interval with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# 終了
    tag @s remove Mns.State.IsDamageInterval
