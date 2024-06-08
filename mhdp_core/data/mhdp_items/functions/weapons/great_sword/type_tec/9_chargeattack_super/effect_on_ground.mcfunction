#> mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/effect_on_ground
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/main

# 演出
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.5
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.7
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.9
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.3 0.1 0.3 1 12 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^2.5 0.3 0.1 0.3 1 12 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^3.5 0.3 0.1 0.3 1 12 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^4.5 0.3 0.1 0.3 1 12 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^5.5 0.3 0.1 0.3 1 12 normal
    particle explosion ^ ^ ^1.5 0.3 0.1 0.3 0 1
    particle explosion ^ ^ ^2.5 0.3 0.1 0.3 0 1
    particle explosion ^ ^ ^3.5 0.3 0.1 0.3 0 1
    particle explosion ^ ^ ^4.5 0.3 0.1 0.3 0 1
    particle explosion ^ ^ ^5.5 0.3 0.1 0.3 0 1
