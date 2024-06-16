#> mhdp_items:player/tick
#
# アイテム処理 player別に毎tick実行される処理
#
# @within function mhdp_core:player/tick

# 念のためデータを読み込む
    function mhdp_core:player/data/load_data

# タイマー関連処理

# ヒットストップ処理
    execute if entity @s[tag=!Ply.Weapon.HisStop] if score @s Wpn.HitStopTimer matches 1.. run tag @s add Ply.Weapon.HisStop
    execute if score @s Wpn.HitStopTimer matches 1.. run scoreboard players remove @s Wpn.HitStopTimer 1
    execute if entity @s[tag=Ply.Weapon.HisStop] if score @s Wpn.HitStopTimer matches ..0 run tag @s remove Ply.Weapon.HisStop

# 武器関連処理
    execute if entity @s[tag=Ply.State.UsingWeapon] run function mhdp_items:player/weapon/tick

# 特殊装具関連処理
    execute if entity @s[tag=Ply.State.UsingWeapon] run function mhdp_items:sp_items/tick

# アイテム関連処理
    function mhdp_items:player/item/tick

# 終了
