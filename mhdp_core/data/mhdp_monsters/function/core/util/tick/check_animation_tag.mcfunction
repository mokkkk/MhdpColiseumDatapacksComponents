#> mhdp_monsters:core/util/tick/check_animation_tag
# 
# 汎用処理 Animタグがすでについているか確認
#
# @within function mhdp_monsters:/**

# モンスター以外から実行された場合、中止
    execute unless entity @s[type=item_display,tag=Mns.Root] run return 0

# タグ取得
    data modify storage mhdp_core:temp Temp.Tags set from entity @s Tags

# 処理開始
    function mhdp_monsters:core/util/tick/check_animation_tag_loop

# 終了
    data remove storage mhdp_core:temp Temp
