#> mhdp_items:sp_items/wirebug/util/ui
#
# 特殊装具のUI描画処理
# 右記functionにuiに飛ばす処理を追記すること：mhdp_items:player/ui/item/main
#
# @within function mhdp_items:core/switch/item/ui

# 特殊装具のUI描画処理

# 通常
    execute if entity @s[tag=!Itm.Sp.Wirebug.UsedSkill] run function mhdp_items:sp_items/wirebug/util/ui/normal

# 鉄蟲糸技使用
    execute if entity @s[tag=Itm.Sp.Wirebug.UsedSkill] run function mhdp_items:sp_items/wirebug/util/ui/skill
