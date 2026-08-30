#> mhdp_items:hunter_note/close/
#
# ハンターノート操作 ダイアログを閉じる
#
# @within function mhdp_core:player/tick

# ダイアログ消去用タグ
    tag @s add Ply.Flag.IsCloseDialog

# スケジュール
    schedule function mhdp_items:hunter_note/close/schedule 2t append
