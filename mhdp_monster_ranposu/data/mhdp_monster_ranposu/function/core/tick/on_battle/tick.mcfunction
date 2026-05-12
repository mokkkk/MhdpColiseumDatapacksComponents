#> mhdp_monster_ranposu:core/tick/on_battle/tick
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# # 同エリアにプレイヤーがいる場合、距離に応じて発見度を加算
#     execute if entity @a[tag=Mns.Candidate.Ranposu,distance=..12] run scoreboard players add @s Mns.General.CautionTimer 100
#     execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.CautionTimer 80
#     execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.CautionTimer 50
#     execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=27..] run scoreboard players add @s Mns.General.CautionTimer 20
#     execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=27..] run scoreboard players add @s Mns.General.CautionTimer 10
