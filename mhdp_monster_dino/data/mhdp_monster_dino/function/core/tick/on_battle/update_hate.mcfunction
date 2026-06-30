#> mhdp_monster_dino:core/tick/on_battle/update_hate
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Dino",DistNear:12,DistFar:30,Fov:90.0}

# 警戒度更新
    # 近距離
        execute as @a[tag=Mns.Temp.Situation.Near] run scoreboard players add @s Mns.Dino.Hate 8
    # 中距離
        execute as @a[tag=Mns.Temp.Situation.Middle] run scoreboard players add @s Mns.Dino.Hate 5
    # 遠距離
        execute as @a[tag=Mns.Temp.Situation.Far] run scoreboard players add @s Mns.Dino.Hate 4

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag

# 別エリアのプレイヤーの発見度、ヘイト減少
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Dino,scores={Mns.Dino.Hate=1..}] run scoreboard players remove @s Mns.Dino.Hate 1
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Dino,scores={Mns.Dino.Search=1..}] run scoreboard players remove @s Mns.Dino.Search 20

# 全プレイヤーの発見度が0以下になった場合、警戒に戻る
    execute unless entity @a[tag=Ply.State.PlayingQuest,scores={Mns.Dino.Search=1..}] run function mhdp_monster_dino:core/tick/on_caution/start
