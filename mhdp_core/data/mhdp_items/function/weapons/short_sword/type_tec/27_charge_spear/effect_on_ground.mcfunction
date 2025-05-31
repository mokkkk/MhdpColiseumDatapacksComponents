#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/effect_on_ground
#
# 溜め斬り落とし アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/main

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    particle explosion ^ ^0.1 ^ 0.2 0.1 0.2 0.5 1 normal
