#> mhdp_items:weapons/long_sword/type_tec/22_iai_spirit_slash/success
#
# 居合抜刀気刃斬り 成功判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# タグ更新
    tag @s remove Wpn.Ls.Tec.IaiSpiritSlash
    tag @s add Wpn.Ls.Tec.IaiSpiritSlash.Success

# カメラ演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run data modify storage api: Arg.Override.Type set value "arts"
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run function api:effect/apply.m {EffectId:4}
