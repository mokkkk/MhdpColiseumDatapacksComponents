#> mhdp_core:player/trigger/hunter_note/general/main
#
# ハンターノート操作 メインメニュー
#
# @within function mhdp_core:player/tick

# 各フェーズメニュー表示
    execute if score @s Ply.Ope.HunterNote.General matches 1 run function mhdp_items:hunter_note/show_menu/show

# オプション表示
    execute if score @s Ply.Ope.HunterNote.General matches 4 run function mhdp_items:hunter_note/options/show

# 閉じる
    execute if score @s Ply.Ope.HunterNote.General matches 99 run function mhdp_items:hunter_note/close/

# 終了処理
    scoreboard players set @s Ply.Ope.HunterNote.General -1
    scoreboard players enable @s Ply.Ope.HunterNote.General
