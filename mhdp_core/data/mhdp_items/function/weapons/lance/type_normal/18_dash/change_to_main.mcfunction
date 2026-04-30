#> mhdp_items:weapons/lance/type_tec/18_dash/change_to_main
#
# 突進 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# スコア初期化
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s remove Wpn.Lc.Tec.Dash.Start
    tag @s add Wpn.Lc.Tec.Dash
    tag @s remove Wpn.Lc.Tec.Dash.Jump

# スタミナ回復停止
    tag @s add Ply.Weapon.StaminaNotRegen
