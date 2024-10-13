#> mhdp_items:sp_items/immovable_cloth/util/ui
#
# 特殊装具のUI描画処理
# 右記functionにuiに飛ばす処理を追記すること：mhdp_items:player/ui/item/main
#
# @within function mhdp_items:core/switch/item/ui

# 特殊装具のUI描画処理

# 通常
    execute if entity @s[tag=!Itm.Sp.ImmovableCloth.Using] run function mhdp_items:sp_items/immovable_cloth/util/ui/normal

# 使用中
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] run function mhdp_items:sp_items/immovable_cloth/util/ui/using
