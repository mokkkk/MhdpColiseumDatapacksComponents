#> mhdp_monster_dino:core/tick/on_relax/tick
#
# tick処理 非発見時
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 一定時間ごとに警戒度更新
    execute if entity @s[tag=Mns.Temp.IsTick] run function mhdp_monster_dino:core/tick/on_relax/update_caution

# 警戒度が一定以上になったとき、フェーズ移行
    execute if entity @a[tag=Mns.Candidate.Dino,scores={Mns.Dino.Caution=1000..}] run function mhdp_monster_dino:core/tick/on_caution/start
