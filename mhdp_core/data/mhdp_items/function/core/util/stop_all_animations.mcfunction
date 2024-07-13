#> mhdp_items:core/util/stop_all_animations
# 
# 共通処理 無操作の取得
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp Args.TagPrefix タグのPrefix

# 初期状態設定
    execute if entity @s[tag=Ply.Weapon.Drawing] run tag @s add Ply.Weapon.NoOpe
    # そもそも実行しない
        execute if entity @s[tag=!Ply.Weapon.NoOpe] run return 0

# タグ取得
    data modify storage mhdp_core:temp Temp.Tags set from storage mhdp_core:temp PlayerData.Tags

# 処理開始
    function mhdp_items:core/util/macro/m.stop_all_animations_loop with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Temp
