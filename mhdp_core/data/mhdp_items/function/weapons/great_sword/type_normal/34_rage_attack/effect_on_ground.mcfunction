#> mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/effect_on_ground
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/main

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    particle explosion ^ ^0.5 ^2.5 0.6 0.6 0.6 0 3 normal
    particle explosion ^ ^0.5 ^4 0.6 0.6 0.6 0 3 normal
    particle explosion ^ ^0.5 ^5.5 0.6 0.6 0.6 0 3 normal
    particle flash{color:[1.000,0.812,0.490,1.00]} ^ ^0.5 ^3.5 0.6 0.6 0.6 0 3 normal
    particle flash{color:[1.000,0.812,0.490,1.00]} ^ ^0.5 ^5.5 0.6 0.6 0.6 0 3 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.3 ^1.5 0.2 0.1 0.2 0.9 10 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.3 ^2.5 0.2 0.1 0.2 0.9 10 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.3 ^3.5 0.2 0.1 0.2 0.9 10 normal

# 移動
    scoreboard players set $strength player_motion.api.launch 3000
    execute rotated ~0 -90 run function player_motion:api/launch_looking
