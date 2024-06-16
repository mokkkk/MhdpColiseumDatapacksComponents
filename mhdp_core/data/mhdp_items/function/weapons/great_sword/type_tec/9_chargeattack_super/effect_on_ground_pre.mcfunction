#> mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/effect_on_ground_pre
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/main

# 演出
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.5
    particle explosion ^ ^0.1 ^1.5 0 0 0 0 1 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.3 0.1 0.3 0.5 5 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^2.5 0.3 0.1 0.3 0.5 5 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^3.5 0.3 0.1 0.3 0.5 5 normal
