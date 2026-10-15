#> mhdp_items:weapons/short_sword/type_tec/14_just_2/start
#
# ジャストラッシュ4 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.Just.4

# カメラ演出
    execute if entity @s[tag=Ply.Flag.Just.Success,tag=!Ply.Option.DisableCameraEffect] run data modify storage api: Arg.Override.Type set value "just"
    execute if entity @s[tag=Ply.Flag.Just.Success,tag=!Ply.Option.DisableCameraEffect] run function api:effect/apply.m {EffectId:4}

# say 武器操作：片手剣 ジャストラッシュ4