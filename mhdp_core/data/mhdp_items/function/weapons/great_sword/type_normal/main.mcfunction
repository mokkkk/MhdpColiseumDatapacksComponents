#> mhdp_items:weapons/great_sword/type_normal/main
#
# 大剣のメイン処理 地の型
#
# @within function mhdp_items:weapons/great_sword/main

# 共通処理
    function mhdp_items:weapons/great_sword/type_normal/general

# 無操作確認
    function mhdp_items:weapons/great_sword/util/get_no_ope

# 抜刀攻撃：溜め
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/great_sword/type_normal/0_drawattack/start
    execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/great_sword/type_normal/0_drawattack/start_guard

# 鉄蟲糸技：ハンティングエッジ
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/start
    # 攻撃
        execute if entity @s[tag=Wpn.Gs.Normal.HuntingEdge] run function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/main
    # 空中溜め
        execute if entity @s[tag=Wpn.Gs.Normal.Charge.Edge] run function mhdp_items:weapons/great_sword/type_normal/11_charge_edge/main
    # 空中溜め斬り
        execute if entity @s[tag=Wpn.Gs.Normal.ChargeSlash.Edge] run function mhdp_items:weapons/great_sword/type_normal/12_chargeattack_edge/main

# 狩技：強化納刀
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.PowerSheathe] run function mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/main

# 狩技：威姿呵成の構え
    # 構え
        execute if entity @s[tag=Wpn.Gs.Normal.CounterStance] run function mhdp_items:weapons/great_sword/type_normal/19_counter_stance/main
    # 成功
        execute if entity @s[tag=Wpn.Gs.Normal.CounterStance.Success] run function mhdp_items:weapons/great_sword/type_normal/20_counter_stance_success/main

# 溜め
    # 開始：右クリック長押し
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/great_sword/type_normal/1_charge/start
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Charge,tag=!Ply.Flag.DrawAttack] run function mhdp_items:weapons/great_sword/type_normal/1_charge/main
        execute if entity @s[tag=Wpn.Gs.Normal.Charge,tag=Ply.Flag.DrawAttack] run function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/main
    # 高速溜め
        execute if entity @s[tag=Wpn.Gs.Normal.Charge.Quick] run function mhdp_items:weapons/great_sword/type_normal/18_charge_high_quick/main

# 溜め斬り
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.ChargeSlash] run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/main

# 大溜め斬り
    # 溜め
        # 処理
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking] run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/start
            execute if entity @s[tag=Wpn.Gs.Normal.CrossCharge] run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/main
    # 攻撃
        # 処理
            execute if entity @s[tag=Wpn.Gs.Normal.Cross] run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/main

# ガード
    # 開始：スニーク
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/great_sword/type_normal/4_guard/start
    # 処理
        execute if entity @s[tag=Wpn.Gs.Normal.Guard] run function mhdp_items:weapons/great_sword/type_normal/4_guard/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
