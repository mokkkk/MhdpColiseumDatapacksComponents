#> mhdp_items:player/tick
#
# アイテム処理 player別に毎tick実行される処理
#
# @within function mhdp_core:player/tick

# 念のためデータを読み込む
    function mhdp_core:player/data/load_data

# タイマー関連処理
    # 無敵時間
        execute if score @s Ply.Timer.DamageInterval matches 1.. run scoreboard players remove @s Ply.Timer.DamageInterval 1
    # 回避時間
        execute if score @s Ply.Timer.Avoid matches 1.. run scoreboard players remove @s Ply.Timer.Avoid 1
    # 先行入力
        execute if score @s Ply.Timer.Buffering matches 1.. run function mhdp_items:core/buffering/tick

# ジャンプ関連処理
    # ベクトルジャンプ
        # execute if entity @s[tag=Ply.Ope.StartJump,tag=Ply.Weapon.Drawing,tag=!Ply.Ope.IsSprinting] run function mhdp_items:player/weapon/move_jump/main
    # ダッシュジャンプ時、無敵時間を設定
        execute if entity @s[tag=Ply.Ope.IsSprinting,tag=Ply.Ope.StartJump] run scoreboard players set @s Ply.Timer.Avoid 3

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
