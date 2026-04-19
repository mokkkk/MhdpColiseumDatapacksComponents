#> mhdp_items:weapons/lance/type_tec/18_dash/change_to_jump
#
# 突進 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# スコア初期化
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s remove Wpn.Lc.Tec.Dash
    tag @s add Wpn.Lc.Tec.Dash.Jump
    tag @s add Ply.Ope.IsAir

# スタミナ回復停止
    tag @s add Ply.Weapon.StaminaNotRegen
