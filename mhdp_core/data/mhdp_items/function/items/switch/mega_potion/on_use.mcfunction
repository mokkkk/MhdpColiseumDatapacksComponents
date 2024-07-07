#> mhdp_items:items/switch/mega_potion/on_use
#
# 回復薬グレート使用処理
#
# @within function mhdp_items:/**

# 効果発動
    # HPを8回復
        summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:5,duration:16,show_particles:0b}]}}
