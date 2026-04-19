#> mhdp_items:weapons/lance/type_tec/18_dash/start
#
# 突進 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.Dash.Start
    tag @s remove Ply.Weapon.NoOpe

# 演出
    playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
