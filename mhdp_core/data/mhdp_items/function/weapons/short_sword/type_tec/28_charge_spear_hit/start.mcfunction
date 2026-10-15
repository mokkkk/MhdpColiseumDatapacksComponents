#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/start
#
# 溜め斬り落とし 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.ChargeSpear.Hit
    tag @s remove Ply.Weapon.NoOpe

# カメラ演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run data modify storage api: Arg.Override.Type set value "blur"
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] run function api:effect/apply.m {EffectId:4}

# say 武器操作：片手剣 溜め斬り落とし