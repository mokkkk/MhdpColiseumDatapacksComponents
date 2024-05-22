#> mhdp_items:weapons/great_sword/type_normal/main
#
# 大剣のメイン処理 地の型
#
# @within function mhdp_items:weapons/great_sword/main

# 共通処理
    function mhdp_items:weapons/great_sword/type_normal/general

# 抜刀攻撃：溜め

# 溜め
    # 開始：右クリック長押し
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/great_sword/type_normal/1_charge/start
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Charge] run function mhdp_items:weapons/great_sword/type_normal/1_charge/main

# 溜め斬り
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.ChargeSlash] run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/main

# タックル
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Tackle] run function mhdp_items:weapons/great_sword/type_normal/3_tackle/main

# ガード
    # 処理

# 鉄蟲糸技：ハンティングエッジ

# 終了
    tag @s remove Ply.Weapon.NoOpe
