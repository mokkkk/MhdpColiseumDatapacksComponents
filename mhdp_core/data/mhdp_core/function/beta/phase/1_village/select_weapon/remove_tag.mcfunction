#> mhdp_core:beta/phase/1_village/select_weapon/remove_tag
#
# ベータ版用、武器を選択する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# タグを消去
# 武器用
    tag @s remove Beta.Ply.Weapon.ShortSword
    tag @s remove Beta.Ply.Weapon.GreatSword
    tag @s remove Beta.Ply.Weapon.Bow
    tag @s remove Beta.Ply.Weapon.Lance

# 天の型
    tag @s remove Ply.Weapon.Type.Tech
