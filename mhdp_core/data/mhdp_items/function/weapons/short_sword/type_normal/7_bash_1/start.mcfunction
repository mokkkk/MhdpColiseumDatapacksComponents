#> mhdp_items:weapons/short_sword/type_normal/7_bash_1/start
#
# 水平斬りコンボ3 開始
#
# @within function mhdp_items:weapons/short_sword/type_normal/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Ss.Normal.Bash.1

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

# say 武器操作：片手剣 盾攻撃