#> mhdp_items:weapons/great_sword/type_tec/main
#
# 大剣のメイン処理 天の型
#
# @within function mhdp_items:weapons/great_sword/main

# 共通処理
    function mhdp_items:weapons/great_sword/type_tec/general

# 抜刀攻撃：溜め
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/great_sword/type_tec/0_drawattack/start

# 溜め
    # 通常
        # 開始：右クリック長押し
            execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/great_sword/type_tec/1_charge/start
        # 処理
            execute if entity @s[tag=Wpn.Gs.Tec.Charge,tag=!Ply.Flag.DrawAttack] if score @s Wpn.Gs.ChargeSlashCount matches 0 run function mhdp_items:weapons/great_sword/type_tec/1_charge/main
            execute if entity @s[tag=Wpn.Gs.Tec.Charge,tag=Ply.Flag.DrawAttack] if score @s Wpn.Gs.ChargeSlashCount matches 0 run function mhdp_items:weapons/great_sword/type_tec/5_charge_draw/main
    # 強溜め
        # 処理
            execute if entity @s[tag=Wpn.Gs.Tec.Charge] if score @s Wpn.Gs.ChargeSlashCount matches 1 run function mhdp_items:weapons/great_sword/type_tec/6_charge_high/main
    # 真溜め
        # 処理
            execute if entity @s[tag=Wpn.Gs.Tec.Charge] if score @s Wpn.Gs.ChargeSlashCount matches 2.. run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/main

# 溜め斬り
    # 通常
        # 処理
            execute if entity @s[tag=Wpn.Gs.Tec.ChargeSlash] if score @s Wpn.Gs.ChargeSlashCount matches 0 run function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/main
    # 強溜め
        # 処理
            execute if entity @s[tag=Wpn.Gs.Tec.ChargeSlash] if score @s Wpn.Gs.ChargeSlashCount matches 1 run function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/main
    # 真溜め
        # 処理
            execute if entity @s[tag=Wpn.Gs.Tec.ChargeSlash] if score @s Wpn.Gs.ChargeSlashCount matches 2.. run function mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/main

# タックル
    # 処理
        execute if entity @s[tag=Wpn.Gs.Tec.Tackle] run function mhdp_items:weapons/great_sword/type_tec/3_tackle/main

# ガード
    # 開始：スニーク
        # execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/great_sword/type_tec/4_guard/start
    # 処理
        # execute if entity @s[tag=Wpn.Gs.Tec.Guard] run function mhdp_items:weapons/great_sword/type_tec/4_guard/main

# 鉄蟲糸技：ハンティングエッジ

# 終了
    tag @s remove Ply.Weapon.NoOpe
