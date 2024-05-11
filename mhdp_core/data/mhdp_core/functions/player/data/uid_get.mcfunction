#> mhdp_core:player/data/uid_get
#
# playerへのUID割り当て
#
# @within
#   function mhdp_core:player/tick
#   function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# UID取得
    scoreboard players operation @s Ply.Uid = #mhdp_player_uid_grobal Ply.Uid

# グローバルUID増加
    scoreboard players add #mhdp_player_uid_grobal Ply.Uid 1

# バグ防止
    scoreboard players set @s Ply.Ope.AcceptedQuestId -1

# 状態更新
    tag @s add Ply.State.HasUid
