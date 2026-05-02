#> assets:core/monster/quest_setup/summon.m
#
# クエスト初期化時のモンスター配置処理

# デバッグ用
    $execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say assets:monster/quest_setup/summon MonsterId - $(MonsterUid)

# 召喚位置決定
    summon marker ~ ~ ~ {Tags:["Mk.Field.SummonPos"]}
    $execute at @n[type=marker,tag=Mk.Field.Area$(AreaId)] run spreadplayers ~ ~ 10 20 under 95 false @e[type=marker,tag=Mk.Field.SummonPos]

# モンスター配置
    say モンスター置きまーす

# 終了
    kill @e[type=marker,tag=Mk.Field.SummonPos]
