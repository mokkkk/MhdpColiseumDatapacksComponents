#> mhdp_monsters:core/util/other/remove_target_tag
# 
# 汎用処理 ターゲットタグ消去
#
# @within function mhdp_monsters:/**

# タグ取得
    data modify storage mhdp_core:temp Temp.Tags set from entity @s Tags

# 処理開始
    function mhdp_monsters:core/util/other/remove_target_tag_loop

# 終了
    data remove storage mhdp_core:temp Temp
