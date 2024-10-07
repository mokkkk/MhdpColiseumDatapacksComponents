#> mhdp_items:player/weapon/sheathe/normal_sheathe
#
# 通常納刀
#
# @within function mhdp_items:player/weapon/sheathe/main

# 武器のデータ更新
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 0
    data modify storage mhdp_core:temp Args.Slot set value "offhand"
    function mhdp_items:core/util/item_modify_sheathe

# 各武器の納刀処理実行
    function mhdp_items:core/switch/weapon_sheathe

# タグ消去
    tag @s remove Ply.Flag.NormalSheathe
    tag @s remove Ply.Weapon.Drawing
    tag @s remove Ply.Weapon.Drawing.Sub
    
say 通常納刀