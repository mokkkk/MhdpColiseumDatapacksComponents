#> mhdp_core:player/phase_quest/cancel_quest/main
#
# クエストを中断して拠点に帰還する
#
# @within function mhdp_core:player/phase_quest/tick

# 通知
    tellraw @s {"text":"【参加していたクエストが終了したため、拠点に帰還しました】","color": "red"}

# 状態リセット
    function mhdp_core:phase/3_quest/change_phase/general/player/reset

# 拠点に戻る
# TODO：拠点の座標更新
    tp @s[tag=Ply.State.PlayingQuest] 266 63 204
    spawnpoint @s[tag=Ply.State.PlayingQuest] 266 63 204
    tag @s remove Ply.State.PlayingQuest
