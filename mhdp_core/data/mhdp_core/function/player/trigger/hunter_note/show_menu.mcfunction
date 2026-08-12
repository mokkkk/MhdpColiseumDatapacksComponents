#> mhdp_core:player/trigger/hunter_note/show_menu
#
# ハンターノート操作 メインメニュー 各フェーズのメニュー表示
#
# @within function mhdp_core:player/tick

# クエスト中
    # リタイア投票
        execute if score @s Ply.Ope.HunterNote.ShowMenu matches 21 run function mhdp_core:phase/3_quest/map/general/click_retire_dialog

# 終了処理
    scoreboard players set @s Ply.Ope.HunterNote.ShowMenu -1
    scoreboard players enable @s Ply.Ope.HunterNote.ShowMenu
