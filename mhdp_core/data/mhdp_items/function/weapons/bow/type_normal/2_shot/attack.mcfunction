#> mhdp_items:weapons/bow/type_tec/2_shot/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 矢を召喚
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run scoreboard players operation #mhdo_temp_charge_count MhdpCore = @s Wpn.Bw.ChargeCount
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if score @s Wpn.Bw.ChargeCount matches ..0 run function mhdp_items:weapons/bow/shot/normal_n/summon_0
    execute if score @s Wpn.Bw.ChargeCount matches 1 run function mhdp_items:weapons/bow/shot/normal_n/summon_1
    execute if score @s Wpn.Bw.ChargeCount matches 2 run function mhdp_items:weapons/bow/shot/normal_n/summon_2
    execute if score @s Wpn.Bw.ChargeCount matches 3 run function mhdp_items:weapons/bow/shot/normal_n/summon_3
    execute if score @s Wpn.Bw.ChargeCount matches 4.. run function mhdp_items:weapons/bow/shot/normal_n/summon_4
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run scoreboard players operation @s Wpn.Bw.ChargeCount = #mhdo_temp_charge_count MhdpCore

# データ設定
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Ply.Uid = @s Ply.Uid
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Wpn.Bw.ChargeCount = @s Wpn.Bw.ChargeCount

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] remove Start
    scoreboard players reset #mhdo_temp_charge_count MhdpCore
