#> mhdp_items:items/switch/half_cooked_meat/on_use
#
# 生焼け肉使用処理
#
# @within function mhdp_items:/**

# 効果発動
    # 効果音
        playsound entity.player.burp master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    # HPを5回復
        summon area_effect_cloud ~ ~ ~ {Particle:{type:"block",block_state:"minecraft:air"},Radius:1f,Duration:6,Age:4,WaitTime:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:5,duration:10,show_particles:0b,show_icon:0b}]}}
        # summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:5,duration:10,show_particles:0b}]}}
