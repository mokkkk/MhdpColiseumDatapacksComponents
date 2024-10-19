#> mhdp_core:beta/phase/3_quest/end
#
# クエスト終了時の処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# タグ消去
    tag @s remove Skill.Stamina.StaminaSurge.1

# アイテム消去
    clear @s
