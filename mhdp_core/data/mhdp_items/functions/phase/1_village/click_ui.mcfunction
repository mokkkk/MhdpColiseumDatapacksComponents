#> mhdp_core:phase/1_village/click_ui
#
# UI用interactionクリック時に実行 クリック対象の特定と分岐
#
# @within function mhdp_core:player/advancement/interaction/interact_ui

# クエスト出発ベル
    execute if entity @s[tag=Other.Interaction.Bell] run function mhdp_core:phase/1_village/bell/click

# クエストボード
    execute if entity @s[tag=Other.Interaction.Board] run function mhdp_core:phase/1_village/quest/join/click

# 終了
    execute if data entity @s interaction run data remove entity @s interaction
