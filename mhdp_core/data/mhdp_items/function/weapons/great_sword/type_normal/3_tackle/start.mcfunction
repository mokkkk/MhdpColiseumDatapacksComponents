#> mhdp_items:weapons/great_sword/type_normal/3_tackle/start
#
# タックル 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Normal.Tackle
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 150
    tag @s add Ply.Weapon.StaminaNotRegen

# say 武器操作：大剣・タックル