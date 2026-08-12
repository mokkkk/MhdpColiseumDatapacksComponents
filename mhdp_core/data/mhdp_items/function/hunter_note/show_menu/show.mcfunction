#> mhdp_items:hunter_note/show_menu/show
#
# ハンターノート操作 メインメニュー クエスト中のメニュー表示
#
# @within function mhdp_core:player/tick

# 村
    # execute if entity @s[tag=!Ply.State.PlayingQuest,tag=!Ply.State.IsTraining] run say むらです

# 訓練
    # execute if entity @s[tag=!Ply.State.PlayingQuest,tag=Ply.State.IsTraining] run say くんれんです

# クエスト中
    # execute if entity @s[tag=Ply.State.PlayingQuest] run function mhdp_core:player/trigger/hunter_note/show_menu/in_quest

# 仮
    function mhdp_items:hunter_note/show_menu/quest/show