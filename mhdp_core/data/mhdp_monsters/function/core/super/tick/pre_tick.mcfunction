#> mhdp_monsters:core/super/tick/pre_tick
# 
# 共通処理 tick開始時

# モンスター用の一時storageを初期化
    data modify storage mhdp_core:temp MonsterTemp set value {}

# 現在位置を保持
    data modify storage mhdp_core:temp MonsterTemp.PrePos set from entity @s Pos
