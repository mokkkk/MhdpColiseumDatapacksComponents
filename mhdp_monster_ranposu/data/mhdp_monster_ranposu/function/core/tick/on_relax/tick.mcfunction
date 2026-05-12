#> mhdp_monster_ranposu:core/tick/on_relax/tick
#
# tick処理 非発見時
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 同エリアにプレイヤーがいる場合、距離に応じて警戒度を加算
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=..12] run scoreboard players add @s Mns.General.CautionTimer 40
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=..12] run scoreboard players add @s Mns.General.CautionTimer 20
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.CautionTimer 10
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.CautionTimer 3
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=27..40] run scoreboard players add @s Mns.General.CautionTimer 1

# 警戒度が一定以上になったとき、フェーズ移行
    execute if score @s Mns.General.CautionTimer matches 2000.. run function mhdp_monster_ranposu:core/tick/on_caution/start
