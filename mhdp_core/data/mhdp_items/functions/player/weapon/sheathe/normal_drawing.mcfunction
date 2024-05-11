#> mhdp_items:player/weapon/sheathe/normal_drawing
#
# 通常抜刀
#
# @within function mhdp_items:player/weapon/sheathe/main

# 武器のデータ更新
    item modify entity @s weapon.mainhand {function:set_custom_data,tag:{IsDrawing:1b}}

# 各武器の通常抜刀処理実行
    function mhdp_items:core/switch/weapon_normal_drawing

# タグ付与
    tag @s add Ply.Weapon.Drawing

say 通常抜刀