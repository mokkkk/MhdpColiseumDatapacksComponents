#> mhdp_items:core/util/macro/m.get_no_ope_loop
# 
# 共通処理 無操作の取得
#
# @within function mhdp_items:core/util/get_no_ope
# @input 
#      #      mhdp_core:temp Args.TagPrefix タグのPrefix

# タグ取得
    data modify storage mhdp_core:temp Temp.TargetTag set from storage mhdp_core:temp Temp.Tags[-1]
    data remove storage mhdp_core:temp Temp.Tags[-1]

# 対象がアニメーションタグの場合、そのタグを消去する
    data modify storage mhdp_core:temp Temp.TagPrefix set string storage mhdp_core:temp Temp.TargetTag 0 6
    $execute if data storage mhdp_core:temp Temp{TagPrefix:"$(TagPrefix)"} run tag @s remove Ply.Weapon.NoOpe
    data remove storage mhdp_core:temp Temp.TargetTag 
    data remove storage mhdp_core:temp Temp.TagPrefix

# タグが残っている場合、続行
    execute if entity @s[tag=Ply.Weapon.NoOpe] if data storage mhdp_core:temp Temp.Tags[0] run function mhdp_items:core/util/macro/m.get_no_ope_loop with storage mhdp_core:temp Args
