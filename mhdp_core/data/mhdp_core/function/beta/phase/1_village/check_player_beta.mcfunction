#> mhdp_core:beta/phase/1_village/check_player_beta
#
# 次Phaseへ遷移できるか確認する ベータ版用処理
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 武器を選択しているかどうかチェック
    execute if entity @s[tag=!Beta.Ply.SelectedWeapon] run tag @s add Ply.Temp.Error.BetaNotSelectedWeapon
    execute if entity @s[tag=Ply.Temp.Error.BetaNotSelectedWeapon] run data modify storage mhdp_core:temp IsError set value true
