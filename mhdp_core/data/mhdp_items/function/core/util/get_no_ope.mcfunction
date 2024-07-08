#> mhdp_items:core/util/get_no_ope
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
    data modify storage mhdp_core:temp Temp.Tags set from entity @s Tags

# 処理開始
    function mhdp_items:core/util/macro/m.get_no_ope_loop with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Temp
