#> mhdp_monsters:core/util/other/remove_animation_tag_loop
# 
# 汎用処理 アニメーションタグ消去
#
# @within
#           function mhdp_monsters:core/util/other/remove_animation_tag
#           function mhdp_monsters:core/util/other/remove_animation_tag_loop

# タグ取得
    data modify storage mhdp_core:temp Temp.TargetTag set from storage mhdp_core:temp Temp.Tags[-1]
    data remove storage mhdp_core:temp Temp.Tags[-1]

# 対象がアニメーションタグの場合、そのタグを消去する
    data modify storage mhdp_core:temp Temp.TagPrefix set string storage mhdp_core:temp Temp.TargetTag 0 4
    execute if data storage mhdp_core:temp Temp{TagPrefix:"Anim"} run function mhdp_monsters:core/util/other/macro/m.remove_animation_tag with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp.TargetTag 
    data remove storage mhdp_core:temp Temp.TagPrefix

# タグが残っている場合、続行
    execute if data storage mhdp_core:temp Temp.Tags[0] run function mhdp_monsters:core/util/other/remove_animation_tag_loop
