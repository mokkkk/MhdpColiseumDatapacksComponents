#> mhdp_items:core/util/get_no_ope
# 
# 共通処理 無操作の取得
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp Args.TagPrefix タグのPrefix

# タイマー減算
    # execute if score @s Wpn.NoOpeTimer matches 1.. run scoreboard players remove @s Wpn.NoOpeTimer 1

# 初期状態設定
    execute if entity @s[tag=Ply.Weapon.Drawing] run tag @s add Ply.Weapon.NoOpe
    # 無操作取得の必要がない場合、そもそも実行しない
        # execute if score @s Wpn.NoOpeTimer matches 1.. run tag @s remove Ply.Weapon.NoOpe
        execute if entity @s[tag=!Ply.Weapon.NoOpe] run return 0

# タグ取得
    data modify storage mhdp_core:temp Temp.Tags set from entity @s Tags

# 処理開始
    function mhdp_items:core/util/macro/m.get_no_ope_loop with storage mhdp_core:temp Args

# タイマー設定
    # execute if entity @s[tag=!Ply.Weapon.NoOpe] run scoreboard players set @s Wpn.NoOpeTimer 2

# 終了
    data remove storage mhdp_core:temp Temp
