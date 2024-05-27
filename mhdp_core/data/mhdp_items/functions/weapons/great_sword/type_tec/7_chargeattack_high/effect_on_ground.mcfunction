#> mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/effect_on_ground
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/main

# 演出
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.5
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.6
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.9 10 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^2.5 0.2 0.1 0.2 0.9 10 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^3.5 0.2 0.1 0.2 0.9 10 normal
