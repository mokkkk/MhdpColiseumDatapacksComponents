#> mhdp_core:player/skill/attack/attack_sharpness
#
# 攻撃時の斬れ味の増減
#
# @within function mhdp_core:player/damage/player_to_entity/main

# デフォルト
    scoreboard players set #mhdp_temp_sharpness_dec_value MhdpCore 1

# 業物
    execute store result score #mhdp_temp_sharpness_random MhdpCore run random value 1..100
    execute if entity @s[tag=Skill.Extra.RazorSharp.1] if score #mhdp_temp_sharpness_random MhdpCore matches ..20 run scoreboard players remove #mhdp_temp_sharpness_dec_value MhdpCore 1
    execute if entity @s[tag=Skill.Extra.RazorSharp.2] if score #mhdp_temp_sharpness_random MhdpCore matches ..50 run scoreboard players remove #mhdp_temp_sharpness_dec_value MhdpCore 1

# 最小値を0に設定
    execute if score #mhdp_temp_sharpness_dec_value MhdpCore matches ..-1 run scoreboard players set #mhdp_temp_sharpness_dec_value MhdpCore 0

# 終了
    scoreboard players reset #mhdp_temp_sharpness_random MhdpCore
