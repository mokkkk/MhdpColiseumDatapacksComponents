#> mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/effect_on_ground
#
# 落下突き 演出
#
# @within function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/main

# 演出
    # playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    playsound item.trident.hit_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute rotated ~ 0 run particle cloud ^ ^0.8 ^1 0.2 0.1 0.2 0.15 5 normal
