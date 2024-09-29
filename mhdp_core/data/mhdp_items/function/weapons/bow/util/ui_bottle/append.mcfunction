#> mhdp_items:weapons/bow/util/ui_bottle/append
#
# 武器のUI描画処理
#
# @within function mhdp_items:core/switch/macro/m.ui

# 値を入れる
    execute if score #mhdp_temp_bottle MhdpCore matches ..0 run data modify storage mhdp_core:temp UI.BowBottleArray append value '[{"text":"0","font":"ui/weapon/bow/bottle"}]'
    execute if score #mhdp_temp_bottle MhdpCore matches 1.. run data modify storage mhdp_core:temp UI.BowBottleArray append value '[{"text":"1","font":"ui/weapon/bow/bottle"}]'
