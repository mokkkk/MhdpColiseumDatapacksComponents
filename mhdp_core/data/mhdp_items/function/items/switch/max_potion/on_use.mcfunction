#> mhdp_items:items/switch/max_potion/on_use
#
# 秘薬使用処理
#
# @within function mhdp_items:/**

# 効果発動
    # クエスト中のみ、HP最大値を上昇
        execute if entity @s[tag=Ply.State.PlayingQuest] run attribute @s max_health modifier remove mhdp_core:quest_max_health
        execute if entity @s[tag=Ply.State.PlayingQuest] run attribute @s max_health modifier add mhdp_core:quest_max_health 8.0 add_value
    # HPを全回復
        summon area_effect_cloud ~ ~ ~ {Particle:{type:"block",block_state:"minecraft:air"},Radius:1f,Duration:6,Age:4,WaitTime:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:15,duration:30,show_particles:0b,show_icon:0b}]}}
