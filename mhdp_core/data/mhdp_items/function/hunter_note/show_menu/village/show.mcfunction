#> mhdp_items:hunter_note/show_menu/quest/show
#
# ハンターノート操作 メインメニュー クエスト中のメニュー表示
#
# @within function mhdp_core:player/tick

# 参加人数
    execute store result storage mhdp_core:temp Temp.Dialog.PlayerCount int 1 if entity @a[tag=Ply.State.PlayingQuest]
    execute store result storage mhdp_core:temp Temp.Dialog.RetiredPlayerCount int 1 if entity @a[tag=Ply.State.PlayingQuest,tag=Ply.State.IsRetire]

# 表示
    function mhdp_items:hunter_note/show_menu/quest/show.m with storage mhdp_core:temp Temp.Dialog

# 終了
    data remove storage mhdp_core:temp Temp.Dialog
