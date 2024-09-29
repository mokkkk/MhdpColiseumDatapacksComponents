#> mhdp_items:weapons/bow/type_tec/5_shot_power/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/5_shot_power/main

# 溜め段階を1上げる
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run scoreboard players operation #mhdo_temp_charge_count MhdpCore = @s Wpn.Bw.ChargeCount
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players set @s Wpn.Bw.ChargeCount 2
    scoreboard players operation #mhdp_temp_bow_charge_count MhdpCore = @s Wpn.Bw.ChargeCount
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run scoreboard players add #mhdp_temp_bow_charge_count MhdpCore 1
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players add #mhdp_temp_bow_charge_count MhdpCore 1
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run scoreboard players operation @s Wpn.Bw.ChargeCount = #mhdo_temp_charge_count MhdpCore

# 矢を召喚
    execute if score @s Wpn.Bw.ChargeCount matches ..0 run function mhdp_items:weapons/bow/shot/power/summon_1
    execute if score @s Wpn.Bw.ChargeCount matches 1.. run function mhdp_items:weapons/bow/shot/power/summon_2

# データ設定
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Ply.Uid = @s Ply.Uid
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Wpn.Bw.ChargeCount = #mhdp_temp_bow_charge_count MhdpCore
    execute if score @s Wpn.Bw.Bottle.Count matches 1.. run function mhdp_items:weapons/bow/shot/apply_bottle_effect

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
    scoreboard players reset #mhdo_temp_charge_count MhdpCore
