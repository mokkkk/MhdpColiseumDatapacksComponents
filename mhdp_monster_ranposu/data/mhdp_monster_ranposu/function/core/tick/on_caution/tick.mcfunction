#> mhdp_monster_ranposu:core/tick/on_caution/tick
#
# tick処理 警戒中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 同エリアにプレイヤーがいる場合、距離に応じて発見度を加算
    execute if entity @a[tag=Mns.Candidate.Ranposu,distance=..12] run scoreboard players add @s Mns.General.SearchTimer 100
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.SearchTimer 80
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.SearchTimer 50
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=27..] run scoreboard players add @s Mns.General.SearchTimer 20
    execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=27..] run scoreboard players add @s Mns.General.SearchTimer 10

# 発見度が一定以上になったとき、フェーズ移行
    execute if score @s Mns.General.SearchTimer matches 4000.. run function mhdp_monster_ranposu:core/tick/on_battle/start
