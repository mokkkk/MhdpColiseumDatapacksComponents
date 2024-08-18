#> mhdp_items:sp_items/carving_knife/main_monster
#
# 剥ぎ取りナイフメイン処理
#
# @within function mhdp_items:sp_items/carving_knife/util/use

# アイテム召喚
    $execute on vehicle positioned ^$(posx) ^$(posy) ^$(posz) run function mhdp_monsters:core/switch/loot_item
