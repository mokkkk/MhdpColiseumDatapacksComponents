#> mhdp_items:sp_items/whetstone/using/particle
#
# 砥石の使用中処理
#
# @within function mhdp_items:sp_items/whetstone/tick

# 斬れ味少し回復
    function mhdp_core:player/damage/player_to_entity/repair_sharpness

# 演出
    execute positioned ~ ~1.65 ~ run particle crit ^-0.2 ^ ^0.5 0 0 0 0.2 5
    playsound block.grindstone.use master @s ~ ~ ~ 1 2
