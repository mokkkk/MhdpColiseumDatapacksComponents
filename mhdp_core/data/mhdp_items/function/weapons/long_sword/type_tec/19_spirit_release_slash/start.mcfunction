#> mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/start
#
# 練気解放無双斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.SpiritRelease
    tag @s remove Ply.Weapon.NoOpe
