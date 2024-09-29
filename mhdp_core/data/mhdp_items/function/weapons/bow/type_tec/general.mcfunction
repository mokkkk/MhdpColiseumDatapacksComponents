#> mhdp_items:weapons/bow/type_tec/general
#
# 共通処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 導ノ矢制限時間処理
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run scoreboard players remove @s Wpn.Bw.HormingTimer 1
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] if score @s Wpn.Bw.HormingTimer matches ..0 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/attack_burst

# 導ノ矢ターゲット取得
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run function mhdp_items:weapons/bow/type_tec/general_get_horming_target
