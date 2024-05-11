#> mhdp_items:player/weapon/sheathe/normal_sheathe
#
# 通常納刀
#
# @within function mhdp_items:player/weapon/sheathe/main

# 武器のデータ更新
    item modify entity @s weapon.offhand {function:set_custom_data,tag:{IsDrawing:0b}}

# 各武器の通常納刀処理実行
    function mhdp_items:core/switch/weapon_sheathe

# タグ消去
    tag @s remove Ply.Flag.NormalSheathe
    tag @s remove Ply.Weapon.Drawing
    tag @s remove Ply.Weapon.Drawing.Sub

say 通常納刀