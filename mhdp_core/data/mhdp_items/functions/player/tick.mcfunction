#> mhdp_items:player/tick
#
# アイテム処理 player別に毎tick実行される処理
#
# @within function mhdp_core:player/tick

# 念のためデータを読み込む
    function mhdp_core:player/data/load_data

# タイマー関連処理

# 武器関連処理
    execute if entity @s[tag=Ply.State.UsingWeapon] run function mhdp_items:player/weapon/tick

# 特殊装具関連処理
    execute if entity @s[tag=Ply.State.UsingWeapon]

# アイテム関連処理
    function mhdp_items:player/item/tick

# 終了
