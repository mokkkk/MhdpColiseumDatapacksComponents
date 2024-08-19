#> mhdp_core:beta/phase/1_village/select_weapon/click_ui
#
# ベータ版用、武器を選択する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 片手剣
    execute if entity @s[tag=Beta.Interaction.Ss.Normal] as @a[tag=Ply.Temp.Target] at @s run function mhdp_core:beta/phase/1_village/select_weapon/select_short_sword_normal
    execute if entity @s[tag=Beta.Interaction.Ss.Tec] as @a[tag=Ply.Temp.Target] at @s run function mhdp_core:beta/phase/1_village/select_weapon/select_short_sword_tec

# 大剣
    execute if entity @s[tag=Beta.Interaction.Gs.Normal] as @a[tag=Ply.Temp.Target] at @s run function mhdp_core:beta/phase/1_village/select_weapon/select_great_sword_normal
    execute if entity @s[tag=Beta.Interaction.Gs.Tec] as @a[tag=Ply.Temp.Target] at @s run function mhdp_core:beta/phase/1_village/select_weapon/select_great_sword_tec
