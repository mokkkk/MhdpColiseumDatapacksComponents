#> mhdp_core:player/damage/player_to_entity/macro/m.get_monster_defence
#
# モンスターの肉質を取得する
#
# @within function mhdp_core:player/damage/player_to_entity

# 肉質取得
    $data modify storage mhdp_core:temp Damage.Defence set from storage mhdp_core:monster_data DefenceData[{$(TargetMonsterUid):1001}].Defences[$(TargetPartId)]
