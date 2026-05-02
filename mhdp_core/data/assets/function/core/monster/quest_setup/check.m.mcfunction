#> assets:core/monster/quest_setup/check.m
#
# クエスト初期化時のモンスター配置処理

# デバッグ用
    $execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say assets:monster/quest_setup/check MonsterId - $(MonsterUid)

# ActiveFieldに対応するエリアがあるか
    $execute if data storage mhdp_core:game_data ActiveField.AreaList[{AreaId:$(AreaId)}] run return 0

# 存在しない場合、エリアを仮に1に設定する
    $tellraw @a {"text":"【WARN】モンスターの召喚先エリアが見つかりませんでした。出現エリアを1に上書きします： MonsterId - $(MonsterUid)","color":"gold"}
    data modify storage mhdp_core:temp Arg.AreaId set value 1
