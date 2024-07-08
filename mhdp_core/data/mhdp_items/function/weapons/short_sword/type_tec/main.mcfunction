#> mhdp_items:weapons/short_sword/type_tec/main
#
# 大剣のメイン処理 天の型
#
# @within function mhdp_items:weapons/short_sword/main

# 無操作確認
    function mhdp_items:weapons/short_sword/util/get_no_ope

# 抜刀攻撃：溜め
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/short_sword/type_tec/0_drawattack/start

# 終了
    tag @s remove Ply.Weapon.NoOpe
