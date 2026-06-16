#> mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/charge
#
# 威合 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_normal/20_special_sheathe/main

# 練気色消費
    scoreboard players remove @s Wpn.Ls.SpiritLevelGauge 10

# 練気色を1段階消費し終えた場合、フラグを付与
    execute if score @s Wpn.Ls.SpiritLevelGauge matches ..0 run tag @s add Ply.Flag.Ls.SacredCharge

# 以下、消費した場合
    execute unless entity @s[tag=Ply.Flag.Ls.SacredCharge] run return 0

# 練気色の段階を下げる
    function mhdp_items:weapons/long_sword/util/down_spirit_level

# 演出
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    playsound block.enchantment_table.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    playsound block.enchantment_table.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^1 0.2 0.2 0.2 0 1
