#> mhdp_core:beta/phase/1_village/select_weapon/select_great_sword_normal
#
# 武器選択 大剣 地の型
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 通知
    tellraw @s {"text":"【大剣・地ノ型を選択した】","color": "light_purple"}
    playsound ui.button.click master @s ~ ~ ~ 1 1

# タグ付与
    tag @s add Beta.Ply.SelectedWeapon
    tag @s remove Beta.Ply.Weapon.ShortSword
    tag @s add Beta.Ply.Weapon.GreatSword
    tag @s remove Ply.Weapon.Type.Tech
