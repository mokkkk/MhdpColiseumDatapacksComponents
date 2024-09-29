#> mhdp_items:weapons/bow/type_tec/4_charge_step/change_to_shot
#
# 射撃 → 溜め
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0
    # 溜め段階上昇
        execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run scoreboard players add @s Wpn.Bw.ChargeCount 1
        execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players add @s Wpn.Bw.ChargeCount 1

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Bw.Tec.ChargeStep
    tag @s remove Ply.Weapon.StaminaNotRegen

# 対象の処理を実行
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run return run function mhdp_items:weapons/bow/type_tec/2_shot_normal/start
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run return run function mhdp_items:weapons/bow/type_tec/2_shot_normal/start
    function mhdp_items:weapons/bow/type_tec/3_shot_max/start
