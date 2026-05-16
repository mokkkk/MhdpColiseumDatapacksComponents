#> mhdp_monster_ranposu:core/tick/on_battle/update_hate
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Ranposu",DistNear:12,DistFar:30}

# 警戒度更新
    # 近距離
        # 前、横
            execute as @a[tag=Mns.Temp.Situation.Near,tag=!Mns.Temp.Situation.Back] run scoreboard players add @s Mns.Ranposu.Hate 8
        # 後
            execute as @a[tag=Mns.Temp.Situation.Near,tag=Mns.Temp.Situation.Back] run scoreboard players add @s Mns.Ranposu.Hate 6
    # 中距離
            execute as @a[tag=Mns.Temp.Situation.Middle] run scoreboard players add @s Mns.Ranposu.Hate 5
    # 遠距離
        execute as @a[tag=Mns.Temp.Situation.Far] run scoreboard players add @s Mns.Ranposu.Hate 4

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag

# 別エリアのプレイヤーの発見度、ヘイト減少
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Ranposu,scores={Mns.Ranposu.Hate=1..}] run scoreboard players remove @s Mns.Ranposu.Hate 5
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Ranposu,scores={Mns.Ranposu.Search=1..}] run scoreboard players remove @s Mns.Ranposu.Search 20

# 全プレイヤーの発見度が0以下になった場合、警戒に戻る
    execute unless entity @a[tag=Ply.State.PlayingQuest,scores={Mns.Ranposu.Search=1..}] run function mhdp_monster_ranposu:core/tick/on_caution/start
