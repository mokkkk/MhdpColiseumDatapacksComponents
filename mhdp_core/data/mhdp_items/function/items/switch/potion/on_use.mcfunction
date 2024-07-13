#> mhdp_items:items/switch/potion/on_use
#
# 回復薬使用処理
#
# @within function mhdp_items:/**

# 効果発動
    # HPを5回復
        summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:5,duration:10,show_particles:0b}]}}
