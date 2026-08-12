#> mhdp_core:player/trigger/hunter_note/show_menu
#
# ハンターノート操作 メインメニュー 各フェーズのメニュー表示
#
# @within function mhdp_core:player/tick

# 訓練所
    # 武器操作
        execute if score @s Ply.Ope.HunterNote.ShowMenu matches 11 run function mhdp_items:hunter_note/info/weapon_guide/show.m {Trigger:"Ply.Ope.HunterNote.General",Value:"1"}
    # 訓練所オプション
        execute if score @s Ply.Ope.HunterNote.ShowMenu matches 12 run function mhdp_items:hunter_note/show_menu/training_option/show

# クエスト中
    # リタイア投票
        execute if score @s Ply.Ope.HunterNote.ShowMenu matches 21 run function mhdp_core:phase/3_quest/map/general/click_retire_dialog

# 終了処理
    scoreboard players set @s Ply.Ope.HunterNote.ShowMenu -1
    scoreboard players enable @s Ply.Ope.HunterNote.ShowMenu
