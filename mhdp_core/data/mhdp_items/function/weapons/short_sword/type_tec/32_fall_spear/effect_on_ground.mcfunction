#> mhdp_items:weapons/short_sword/type_tec/32_fall_spear/effect_on_ground
#
# 溜め斬り落とし アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/main

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute rotated ~ 0 run particle cloud ^ ^0.8 ^1 0.2 0.1 0.2 0.15 5 normal
