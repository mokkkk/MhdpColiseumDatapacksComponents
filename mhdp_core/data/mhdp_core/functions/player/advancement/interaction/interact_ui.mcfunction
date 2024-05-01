#> mhdp_core:player/advancement/interaction/interact_ui
#
# 進捗 UI用interactionクリック
#
# @within advancement mhdp_core:player/interaction/interact_ui

# 実行
    tag @s add Ply.Temp.Target
    execute as @e[tag=Other.Interaction.UI,distance=..8] if data entity @s interaction at @s run function mhdp_core:phase/1_village/click_ui
    tag @s remove Ply.Temp.Target

# 終了
    advancement revoke @s only mhdp_core:player/interaction/interact_ui
