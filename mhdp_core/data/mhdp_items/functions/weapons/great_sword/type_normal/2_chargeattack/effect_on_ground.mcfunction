#> mhdp_items:weapons/great_sword/type_normal/2_chargeattack/effect_on_ground
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/main

# 演出
    playsound entity.hoglin.step master @s ~ ~ ~ 1 0.5
    particle block{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0 5 normal
    particle block{block_state:"minecraft:sand"} ^ ^0.1 ^2.5 0.2 0.1 0.2 0 5 normal
    particle block{block_state:"minecraft:sand"} ^ ^0.1 ^3.5 0.2 0.1 0.2 0 5 normal
