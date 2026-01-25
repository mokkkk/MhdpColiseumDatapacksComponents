#> mhdp_items:weapons/great_sword/type_tec/33_rage_charge/up_charge_count
#
# 震怒竜怨斬 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 処理
    scoreboard players add @s Wpn.Gs.ChargeCount 1

# 演出
    particle crit ~ ~1 ~ 0 0 0 1 20
    execute if score @s Wpn.Gs.ChargeCount matches ..2 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 1
    execute if score @s Wpn.Gs.ChargeCount matches ..2 run playsound block.enchantment_table.use master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    execute if score @s Wpn.Gs.ChargeCount matches 3 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.Gs.ChargeCount matches 3 run playsound block.enchantment_table.use master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2
    execute if score @s Wpn.Gs.ChargeCount matches ..1 positioned ~ ~1.4 ~ rotated as @s positioned ^ ^ ^0.1 run particle flash{color:[1.000,0.812,0.490,1.00]} ^ ^ ^0.5 0 0 0 0 1
    execute if score @s Wpn.Gs.ChargeCount matches 2 positioned ~ ~1.4 ~ rotated as @s positioned ^ ^ ^0.1 run particle flash{color:[0.949,0.663,0.447,1.00]} ^ ^ ^0.5 0 0 0 0 1
    execute if score @s Wpn.Gs.ChargeCount matches 3 positioned ~ ~1.4 ~ rotated as @s positioned ^ ^ ^0.1 run particle flash{color:[0.710,0.208,0.208,1.00]} ^ ^ ^0.5 0 0 0 0 1
    execute if score @s Wpn.Gs.ChargeCount matches 3 positioned ~ ~1.4 ~ rotated as @s positioned ^ ^ ^0.1 run particle flash{color:[1.00,1.00,1.00,1.00]} ^ ^ ^0.5 0 0 0 0 1

# [ImportKey]: NobwRALgngDgpmAXGAxgSwE4oDYIDRgCuhaAJkmAIwAcADAMwqUAsKAtAEYcCGtbzzWgCY21DgDN2Q0hwCslONRQA2AJz0A7GAIA7bgFsEyQGGKAAkrawMbhgMBnJOBQB7QjohJ6tAijju4GI5gAG7c2IRG4AAeSN5gULEAvokEtqRohA6IlLS5eXF2EDYeiHFw2NhoMHZGOXEYzkUQRnFodgCiFVU17QCOhGHYUADK1r7kiOJhNckAukA_3
# 円 1
    particle cloud ~ ~1 ~ ^0 ^-10000000 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^2079116.90818 ^-9781476.00734 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^4067366.43076 ^-9135454.57643 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^5877852.52292 ^-8090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^7431448.25477 ^-6691306.06359 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^8660254.03784 ^-5000000 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^9510565.16295 ^-3090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^9945218.95368 ^-1045284.63268 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^9945218.95368 ^1045284.63268 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^9510565.16295 ^3090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^8660254.03784 ^5000000 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^7431448.25477 ^6691306.06359 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^5877852.52292 ^8090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^4067366.43076 ^9135454.57643 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^2079116.90818 ^9781476.00734 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^0 ^10000000 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-2079116.90818 ^9781476.00734 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-4067366.43076 ^9135454.57643 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-5877852.52292 ^8090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-7431448.25477 ^6691306.06359 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-8660254.03784 ^5000000 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-9510565.16295 ^3090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-9945218.95368 ^1045284.63268 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-9945218.95368 ^-1045284.63268 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-9510565.16295 ^-3090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-8660254.03784 ^-5000000 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-7431448.25477 ^-6691306.06359 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-5877852.52292 ^-8090169.94375 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-4067366.43076 ^-9135454.57643 ^ 0.0000001 0
    particle cloud ~ ~1 ~ ^-2079116.90818 ^-9781476.00734 ^ 0.0000001 0