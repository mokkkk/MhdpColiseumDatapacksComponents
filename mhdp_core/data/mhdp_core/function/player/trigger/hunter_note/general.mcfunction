#> mhdp_core:player/trigger/hunter_note/general
#
# ハンターノート操作 メインメニュー
#
# @within function mhdp_core:player/tick

# もっかいダイアログ表示
    dialog show @s mhdp_items:hunter_note/general

# 終了処理
    scoreboard players set @s Ply.Ope.HunterNote.General -1
    scoreboard players enable @s Ply.Ope.HunterNote.General
