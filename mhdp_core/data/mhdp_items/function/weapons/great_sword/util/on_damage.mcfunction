#> mhdp_items:weapons/great_sword/util/on_damage
#
# 武器の被ダメージ時処理
#
# @within function mhdp_items:core/switch/macro/m.on_damage

# ジャストタックル
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Gs.Tec.Tackle] if score @s Wpn.GeneralTimer matches ..3 run function mhdp_items:weapons/great_sword/type_tec/3_tackle/just_tackle

# 威姿呵成の構え
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Gs.Tec.CounterStance] if score @s Wpn.GeneralTimer matches ..39 run function mhdp_items:weapons/great_sword/type_tec/20_counter_stance_success/start

# 相殺成功時、ダメージ軽減
    execute if entity @s[tag=Ply.Flag.CounterSuccess] run scoreboard players set #mhdp_temp_damage_reduction MhdpCore 25
