#> mhdp_items:weapons/great_sword/util/guard
#
# 武器のガード成功時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# 斬れ味消費
    scoreboard players set #mhdp_temp_sharpness_dec_value MhdpCore 2
    function mhdp_core:player/damage/player_to_entity/decrease_sharpness
    scoreboard players reset #mhdp_temp_sharpness_dec_value MhdpCore
