#> mhdp_items:weapons/bow/type_tec/1_charge/start_from_shot
#
# 溜め 開始
#
# @within function mhdp_items:weapons/bow/type_tec/main

# タグ付与
    tag @s add Wpn.Bw.Tec.Charge

# attribute設定
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run scoreboard players add @s Wpn.Bw.ChargeCount 1
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players add @s Wpn.Bw.ChargeCount 1

say 弓・溜め