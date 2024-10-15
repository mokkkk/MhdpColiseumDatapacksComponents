#> mhdp_core:beta/phase/1_village/select_weapon/select_short_sword_tec
#
# 武器選択 片手剣 地の型
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 通知
    tellraw @s {"text":"【片手剣・天ノ型を選択した】","color": "light_purple"}
    playsound ui.button.click master @s ~ ~ ~ 1 1

# タグ付与
    tag @s add Beta.Ply.SelectedWeapon
    tag @s add Beta.Ply.Weapon.ShortSword
    tag @s remove Beta.Ply.Weapon.GreatSword
    tag @s remove Beta.Ply.Weapon.Bow
    tag @s add Ply.Weapon.Type.Tech
