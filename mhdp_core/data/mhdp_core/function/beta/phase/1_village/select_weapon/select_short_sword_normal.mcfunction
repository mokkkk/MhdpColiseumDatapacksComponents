#> mhdp_core:beta/phase/1_village/select_weapon/select_short_sword_normal
#
# 武器選択 片手剣 地の型
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 訓練中は利用不可
    execute if entity @s[tag=Ply.State.IsTraining] run return run tellraw @s {"text": "【訓練中は利用できません】","color": "red"}

# 通知
    tellraw @s {"text":"【片手剣・地ノ型を選択した】","color": "light_purple"}
    playsound ui.button.click master @s ~ ~ ~ 1 1

# タグ付与
    tag @s add Beta.Ply.SelectedWeapon
    tag @s add Beta.Ply.Weapon.ShortSword
    tag @s remove Beta.Ply.Weapon.GreatSword
    tag @s remove Beta.Ply.Weapon.Bow
    tag @s remove Ply.Weapon.Type.Tech
