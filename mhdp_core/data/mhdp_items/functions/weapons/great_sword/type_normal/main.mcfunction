#> mhdp_items:weapons/great_sword/type_normal/main
#
# 大剣のメイン処理 地の型
#
# @within function mhdp_items:weapons/great_sword/main

# 共通処理
    function mhdp_items:weapons/great_sword/type_normal/general

# 抜刀攻撃：溜め
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/great_sword/type_normal/0_drawattack/start

# 溜め
    # 開始：右クリック長押し
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/great_sword/type_normal/1_charge/start
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Charge,tag=!Ply.Flag.DrawAttack] run function mhdp_items:weapons/great_sword/type_normal/1_charge/main
        execute if entity @s[tag=Wpn.Gs.Normal.Charge,tag=Ply.Flag.DrawAttack] run function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/main
    
# 溜め斬り
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.ChargeSlash] run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/main

# タックル
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Tackle] run function mhdp_items:weapons/great_sword/type_normal/3_tackle/main

# ガード
    # 開始：スニーク
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/great_sword/type_normal/4_guard/start
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Guard] run function mhdp_items:weapons/great_sword/type_normal/4_guard/main

# 鉄蟲糸技：ハンティングエッジ

# 終了
    tag @s remove Ply.Weapon.NoOpe
