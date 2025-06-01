#> api:damage_player_to_entity/get_monster_defence.m
#
# モンスターの肉質を取得する
#
# @within function api:damage_player_to_entity/get_monster_data

# 肉質取得
    $data modify storage api: Arg.Defence set from storage mhdp_core:monster_data DefenceData[{Uid:$(TargetMonsterUid)}].Defences[$(TargetPartId)]
