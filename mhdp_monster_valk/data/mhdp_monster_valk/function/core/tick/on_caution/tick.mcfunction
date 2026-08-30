#> mhdp_monster_valk:core/tick/on_caution/tick
#
# tick処理 警戒中 (Phase 1)
#
# @within function mhdp_monster_valk:core/tick/main

# 一定時間ごとに発見度更新
    execute if entity @s[tag=Mns.Temp.IsTick] run function mhdp_monster_valk:core/tick/on_caution/update_search

# 発見度が一定以上になったとき、フェーズ移行
    execute if entity @a[tag=Mns.Candidate.Valk,scores={Mns.Valk.Search=1000..}] run function mhdp_monster_valk:core/tick/on_battle/start
