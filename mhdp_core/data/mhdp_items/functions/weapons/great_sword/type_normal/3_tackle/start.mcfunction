#> mhdp_items:weapons/great_sword/type_normal/3_tackle/start
#
# タックル 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Normal.Tackle

# attribute設定
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1 add_value

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 150
    tag @s add Ply.Weapon.StaminaNotRegen

say タックル