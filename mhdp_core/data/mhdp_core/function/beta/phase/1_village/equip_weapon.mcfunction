#> mhdp_core:beta/phase/1_village/equip_weapon
#
# 次Phaseへ遷移できるか確認する 武器装備処理
#
# @within function mhdp_core:phase/1_village/change_phase/check

# ステータス設定
    scoreboard players set @s Ply.Stats.DefenceValue 0
    execute if entity @s[tag=Beta.Ply.Weapon.Bow] run scoreboard players set @s Ply.Stats.DefenceValue -15

# アイテム消去
    clear @s

# 武器装備
    # 大剣
        execute if entity @s[tag=Beta.Ply.Weapon.GreatSword] run loot replace entity @s weapon.offhand loot mhdp_items:weapons/great_sword/iron
    # 片手剣
        execute if entity @s[tag=Beta.Ply.Weapon.ShortSword] run loot replace entity @s weapon.offhand loot mhdp_items:weapons/short_sword/iron
    # 弓
        execute if entity @s[tag=Beta.Ply.Weapon.Bow] run loot replace entity @s weapon.offhand loot mhdp_items:weapons/bow/iron
        execute if entity @s[tag=Beta.Ply.Weapon.Bow] run tag @s add Skill.Stamina.StaminaSurge.1

# データ更新
    function mhdp_core:player/data/get_data
