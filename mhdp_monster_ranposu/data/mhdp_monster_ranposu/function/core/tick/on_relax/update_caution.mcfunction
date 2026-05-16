#> mhdp_monster_ranposu:core/tick/on_relax/update_caution
#
# tick処理 非発見時
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Ranposu",DistNear:10,DistFar:25}

# 警戒度更新

# 同エリアにプレイヤーがいる場合、距離に応じて警戒度を加算
    # execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=..12] run scoreboard players add @s Mns.General.CautionTimer 40
    # execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=..12] run scoreboard players add @s Mns.General.CautionTimer 20
    # execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.CautionTimer 10
    # execute if entity @a[tag=Mns.Candidate.Ranposu,tag=Ply.Ope.IsSneaking,distance=12..26] run scoreboard players add @s Mns.General.CautionTimer 3
    # execute if entity @a[tag=Mns.Candidate.Ranposu,tag=!Ply.Ope.IsSneaking,distance=27..40] run scoreboard players add @s Mns.General.CautionTimer 1

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag
