#> mhdp_items:weapons/bow/type_tec/1_charge/change_to_shot
#
# 溜め → 射撃
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/main

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack

# タグ消去
    tag @s remove Ply.Weapon.StaminaNotRegen
    
# 対象の処理を実行
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run return run function mhdp_items:weapons/bow/type_tec/2_shot_normal/start
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run return run function mhdp_items:weapons/bow/type_tec/2_shot_normal/start
    function mhdp_items:weapons/bow/type_tec/3_shot_max/start
