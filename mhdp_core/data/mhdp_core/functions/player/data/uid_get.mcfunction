#> mhdp_core:player/data/uid_get
#
# playerへのUID割り当て
#
# @within function mhdp_core:player/tick

# UID取得
    scoreboard players operation @s Ply.Uid = #mhdp_player_uid_grobal Ply.Uid

# グローバルUID増加
    scoreboard players add #mhdp_player_uid_grobal Ply.Uid 1

# 状態更新
    tag @s add Ply.State.HasUid

say UID割り当て