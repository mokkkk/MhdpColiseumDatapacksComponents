#> mhdp_items:weapons/great_sword/type_tec/15_cross/effect_on_ground
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/main

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    particle explosion ^ ^0.1 ^1.5 0 0 0 0 1 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^2.5 0.2 0.1 0.2 0.5 5 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^3.5 0.2 0.1 0.2 0.5 5 normal
