#> mhdp_items:weapons/bow/type_tec/general
#
# 共通処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 仕掛け矢ゲージ
    execute if score @s Wpn.Bw.Gauge matches ..-1 run scoreboard players set @s Wpn.Bw.Gauge 0
    execute if score @s Wpn.Bw.Gauge matches 301.. run scoreboard players set @s Wpn.Bw.Gauge 300

# 導ノ矢制限時間処理
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run scoreboard players remove @s Wpn.Bw.HormingTimer 1
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] if score @s Wpn.Bw.HormingTimer matches ..0 run function mhdp_items:weapons/bow/type_tec/8_horming/attack_burst

# 導ノ矢ターゲット取得
    execute if entity @s[tag=Ply.Weapon.Bow.IsHorming] run function mhdp_items:weapons/bow/type_tec/8_horming/get_horming_target

# 狩技キャンセル
    execute if entity @s[tag=Ply.Weapon.UsingArts.2,tag=!Wpn.Bw.Tec.TargettingShot] run scoreboard players set @s Ply.Stats.Arts.2 0
    execute if entity @s[tag=Ply.Weapon.UsingArts.2,tag=!Wpn.Bw.Tec.TargettingShot] run scoreboard players set @s Ply.Stats.Arts.2.Percent 0
    execute if entity @s[tag=Ply.Weapon.UsingArts.2,tag=!Wpn.Bw.Tec.TargettingShot] run tag @s remove Ply.Weapon.UsingArts.2
