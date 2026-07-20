#> api:damage_entity_to_player/knockback
#
# モンスターからプレイヤーに対してのダメージ処理 ガード
#
# @within function mhdp_core:player/damage/entity_to_player/apply

# アーマー計算
    execute if entity @s[tag=Ply.Weapon.Armor.Super] run scoreboard players remove #mhdp_temp_knockback_strength MhdpCore 1
    execute if entity @s[tag=Ply.Weapon.Armor.Hyper] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] run scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0

# ノックバック量が0の場合、実行しない
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..0 run return 0

# 角度計算
    execute if data storage mhdp_core:temp Arg{VectorType:"Normal"} positioned as @s positioned ^ ^ ^-5 run function api:damage_entity_to_player/knockback_calc_vector
    execute unless data storage mhdp_core:temp Arg{VectorType:"Normal"} run function api:damage_entity_to_player/knockback_calc_vector

# 武器操作中断
    # 操作無効化
        execute if entity @s[tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run scoreboard players set @s Wpn.DeactivateTimer 20
    # 操作中断
        execute if entity @s[tag=Ply.State.UsingWeapon,tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run function mhdp_items:core/switch/weapon_interrupt
        execute if entity @s[tag=Ply.State.UsingWeapon,tag=!Ply.Weapon.Guard] if score #mhdp_temp_knockback_strength MhdpCore matches 1.. run function mhdp_items:core/switch/item/interrupt
