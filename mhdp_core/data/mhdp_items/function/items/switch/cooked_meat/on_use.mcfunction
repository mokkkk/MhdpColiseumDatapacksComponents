#> mhdp_items:items/switch/cooked_beef/on_use
#
# こんがり肉使用処理
#
# @within function mhdp_items:/**

# 効果発動
    # クエスト中のみ、HP最大値を上昇
        execute if entity @s[tag=Ply.State.PlayingQuest] run attribute @s generic.max_health modifier remove mhdp_core:quest_max_health
        execute if entity @s[tag=Ply.State.PlayingQuest] run attribute @s generic.max_health modifier add mhdp_core:quest_max_health 8.0 add_value
    # HPを全回復
        summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:15,duration:30,show_particles:0b}]}}
