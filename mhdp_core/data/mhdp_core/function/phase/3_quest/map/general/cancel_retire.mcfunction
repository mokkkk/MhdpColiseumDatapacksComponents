#> mhdp_core:phase/3_quest/map/general/cancel_retire
#
# クエスト中のtick処理
#
# @within function mhdp_core:phase/tick

# 自身のリタイアタグ更新
    tag @s remove Ply.State.IsRetire

# 通知
    tellraw @s [{"text":"【クエストリタイアをキャンセルしました】"}]
