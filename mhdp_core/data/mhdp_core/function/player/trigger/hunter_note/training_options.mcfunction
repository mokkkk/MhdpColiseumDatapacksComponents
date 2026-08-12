#> mhdp_core:player/trigger/hunter_note/training_options
#
# ハンターノート操作 メインメニュー 各フェーズのメニュー表示
#
# @within function mhdp_core:player/tick

# 適用
    function mhdp_items:hunter_note/show_menu/training_option/confirm

# 終了処理
    scoreboard players set @s Ply.Ope.HunterNote.TrainingOptions -1
    scoreboard players enable @s Ply.Ope.HunterNote.TrainingOptions
