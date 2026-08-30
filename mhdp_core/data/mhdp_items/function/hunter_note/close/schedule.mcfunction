#> mhdp_items:hunter_note/show_menu/schedule
#
# ハンターノート操作 ダイアログを閉じる
#
# @within function mhdp_core:player/tick

# ダイアログ消去
    execute as @a[tag=Ply.Flag.IsCloseDialog] run dialog clear @s
    execute as @a[tag=Ply.Flag.IsCloseDialog] run tag @s remove Ply.Flag.IsCloseDialog
