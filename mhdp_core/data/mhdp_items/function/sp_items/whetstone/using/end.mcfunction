#> mhdp_items:sp_items/whetstone/using/end
#
# 砥石の使用中処理
#
# @within function mhdp_items:sp_items/whetstone/tick

# 切れ味回復
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    function mhdp_core:player/damage/player_to_entity/reset_sharpness

# 使用中断
    function mhdp_items:sp_items/whetstone/util/interrupt
