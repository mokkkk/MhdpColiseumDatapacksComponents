#> mhdp_core:player/trigger/tick
#
# player別に毎tick実行される処理 trigger関連
#
# @within function mhdp_core:player/tick

# クエスト受注
    execute if score @s Ply.Ope.AcceptedQuestId matches 0.. run function mhdp_core:player/trigger/quest/click_accept

# ハンターノート操作
    # 一般
        execute if score @s Ply.Ope.HunterNote.General matches 0.. run function mhdp_core:player/trigger/hunter_note/general
    # 各メニュー
        execute if score @s Ply.Ope.HunterNote.ShowMenu matches 0.. run function mhdp_core:player/trigger/hunter_note/show_menu
    # オプション
        execute if score @s Ply.Ope.HunterNote.Options matches 0.. run function mhdp_core:player/trigger/hunter_note/options
