#> mhdp_items:weapons/bow/type_normal/1_charge/start_from_shot
#
# 溜め 開始
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Normal.Charge
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Weapon.StaminaNotRegen

# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run scoreboard players add @s Wpn.Bw.ChargeCount 1
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players add @s Wpn.Bw.ChargeCount 1

# say 武器操作：弓・溜め