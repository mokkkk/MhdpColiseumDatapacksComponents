#> mhdp_monster_valk:core/tick/on_battle/update_hate
#
# tick処理 戦闘中 ヘイト更新
#
# @within function mhdp_monster_valk:core/tick/on_battle/tick

# プレイヤーの状態取得
    function mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.Valk",DistNear:12,DistFar:30,Fov:90.0}

# ヘイト更新
    # 近距離
        execute as @a[tag=Mns.Temp.Situation.Near] run scoreboard players add @s Mns.Valk.Hate 8
    # 中距離
        execute as @a[tag=Mns.Temp.Situation.Middle] run scoreboard players add @s Mns.Valk.Hate 5
    # 遠距離
        execute as @a[tag=Mns.Temp.Situation.Far] run scoreboard players add @s Mns.Valk.Hate 4

# 終了
    function mhdp_monsters:core/util/tick/fetch_player/remove_tag

# 別エリアのプレイヤーの発見度、ヘイト減少
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Valk,scores={Mns.Valk.Hate=1..}] run scoreboard players remove @s Mns.Valk.Hate 1
    execute as @a[tag=Ply.State.PlayingQuest,tag=!Mns.Candidate.Valk,scores={Mns.Valk.Search=1..}] run scoreboard players remove @s Mns.Valk.Search 20

# 全プレイヤーの発見度が0以下になった場合、警戒に戻る
    execute unless entity @a[tag=Ply.State.PlayingQuest,scores={Mns.Valk.Search=1..}] run function mhdp_monster_valk:core/tick/on_caution/start
