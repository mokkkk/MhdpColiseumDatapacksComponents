#> mhdp_core:phase/1_village/click_ui
#
# UI用interactionクリック時に実行 クリック対象の特定と分岐
#
# @within function mhdp_core:player/advancement/interaction/interact_ui

# クエスト出発ベル
    execute if entity @s[tag=Other.Interaction.Bell] run function mhdp_core:phase/1_village/bell/click

# クエストボード
    execute if entity @s[tag=Other.Interaction.Board] run function mhdp_core:phase/1_village/quest/join/click

# ベータ版処理
    execute if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/phase/1_village/select_weapon/click_ui

# クエストリタイアベル
    execute if entity @s[tag=Other.Interaction.RetireBell] run function mhdp_core:phase/3_quest/map/general/click_retire

# 肉焼きセット
    execute if entity @s[tag=Other.Interaction.Meat] run function mhdp_items:sp_items/nikuyaki/using/click

# 終了
    execute if data entity @s interaction run data remove entity @s interaction
