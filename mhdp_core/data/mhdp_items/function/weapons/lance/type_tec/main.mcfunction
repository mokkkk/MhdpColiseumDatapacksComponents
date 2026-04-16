#> mhdp_items:weapons/lance/type_tec/main
#
# 片手剣のメイン処理 天の型
#
# @within function mhdp_items:weapons/lance/main

# 無操作確認
    function mhdp_items:weapons/lance/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/lance/type_tec/0_drawattack/start
    execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/lance/type_tec/0_drawattack/start_guard

# 特殊空中攻撃：

# 空中攻撃：

# 狩技：

# 狩技：

# 突き
    # 1段目
        # 開始：右クリック短押し
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_tec/1_spear_1/start
        # 処理
            execute if entity @s[tag=Wpn.Lc.Tec.Spear.1] run function mhdp_items:weapons/lance/type_tec/1_spear_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Lc.Tec.Spear.2] run function mhdp_items:weapons/lance/type_tec/2_spear_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Lc.Tec.Spear.3] run function mhdp_items:weapons/lance/type_tec/3_spear_3/main

# 3連突き
    # 処理
        execute if entity @s[tag=Wpn.Lc.Tec.TripleSpear] run function mhdp_items:weapons/lance/type_tec/9_triple_spear/main

# 飛び込み突き
    # 処理
        execute if entity @s[tag=Wpn.Lc.Tec.DashSpear] run function mhdp_items:weapons/lance/type_tec/8_dash_spear/main

# 溜め薙ぎ払い
    # 開始：右クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_tec/4_charge/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Tec.Charge] run function mhdp_items:weapons/lance/type_tec/4_charge/main
        execute if entity @s[tag=Wpn.Lc.Tec.Sweep] run function mhdp_items:weapons/lance/type_tec/5_sweep/main
        execute if entity @s[tag=Wpn.Lc.Tec.Sweep.Charge] run function mhdp_items:weapons/lance/type_tec/5_sweep/main_charge

# ガード
    # 開始：スニーク
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_tec/6_guard/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Tec.Guard] run function mhdp_items:weapons/lance/type_tec/6_guard/main
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just] run function mhdp_items:weapons/lance/type_tec/6_guard/main_just

# ガードダッシュ
    # 処理
        execute if entity @s[tag=Wpn.Lc.Tec.GuardDash] run function mhdp_items:weapons/lance/type_tec/7_guard_dash/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
