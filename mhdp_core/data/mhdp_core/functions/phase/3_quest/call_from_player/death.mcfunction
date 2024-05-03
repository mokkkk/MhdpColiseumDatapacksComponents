#> mhdp_core:phase/3_quest/call_from_player/death
#
# プレイヤーから呼び出す処理 死亡時
#
# @within function mhdp_core:player/phase_quest/death_animation/end_on_quest

# 死亡回数減算
    scoreboard players remove #mhdp_quest_deathcount MhdpCore 1

# 通知
    tellraw @a[tag=Ply.State.PlayingQuest] [{"text":"【"},{"selector":"@s"},{"text":"が力尽きた （残り回数 "},{"score":{"name":"#mhdp_quest_deathcount","objective":"MhdpCore"}},{"text":"/"},{"score":{"name":"#mhdp_quest_deathcount_max","objective":"MhdpCore"}},{"text":"）】"}]

# クエスト失敗
    execute if score #mhdp_quest_deathcount MhdpCore matches ..0 run tellraw @a[tag=Ply.State.PlayingQuest] [{"text":"【もう復活できません】"}]
    execute if score #mhdp_quest_deathcount MhdpCore matches ..0 run function mhdp_core:phase/3_quest/end/failed
