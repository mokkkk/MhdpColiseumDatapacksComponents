#> mhdp_monster_ranposu:core/tick/on_caution/tick
#
# tick処理 警戒中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 一定時間ごとに発見度更新
    execute if entity @s[tag=Mns.Temp.IsTick] run function mhdp_monster_ranposu:core/tick/on_caution/update_search

# 発見度が一定以上になったとき、フェーズ移行
    execute if entity @a[tag=Mns.Candidate.Ranposu,scores={Mns.Ranposu.Search=1000..}] run function mhdp_monster_ranposu:core/tick/on_battle/start
