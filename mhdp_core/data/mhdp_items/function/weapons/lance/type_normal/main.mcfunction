#> mhdp_items:weapons/lance/type_normal/main
#
# ランスのメイン処理 天の型
#
# @within function mhdp_items:weapons/lance/main

# 無操作確認
    function mhdp_items:weapons/lance/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/lance/type_normal/0_drawattack/start
    execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/lance/type_normal/0_drawattack/start_guard

# 特殊空中攻撃：流転突き
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingWeapon,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.Spiral] run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/main

# 空中攻撃：強突き
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/lance/type_normal/20_low_spear/start
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/lance/type_normal/20_low_spear/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.LowSpear] run function mhdp_items:weapons/lance/type_normal/20_low_spear/main

# 狩技：ガードレイジ
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_normal/22_guard_rage/start
    # ガード
        execute if entity @s[tag=Wpn.Lc.Normal.GuardRage] run function mhdp_items:weapons/lance/type_normal/22_guard_rage/main
    # カウンター
        execute if entity @s[tag=Wpn.Lc.Normal.RageCounter] run function mhdp_items:weapons/lance/type_normal/23_rage_counter/main

# 狩技：スクリュースラスト
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/start
    # 溜め
        execute if entity @s[tag=Wpn.Lc.Normal.ScrewThrust] run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/main
    # 攻撃
        execute if entity @s[tag=Wpn.Lc.Normal.ScrewSpear] run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/main

# 突き
    # 1段目
        # 開始：左クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_normal/1_spear_1/start
        # 処理
            execute if entity @s[tag=Wpn.Lc.Normal.Spear.1] run function mhdp_items:weapons/lance/type_normal/1_spear_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Lc.Normal.Spear.2] run function mhdp_items:weapons/lance/type_normal/2_spear_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Lc.Normal.Spear.3] run function mhdp_items:weapons/lance/type_normal/3_spear_3/main

# 飛び込み突き
    # 開始：右クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_normal/5_dash_spear/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.DashSpear] run function mhdp_items:weapons/lance/type_normal/5_dash_spear/main

# 薙ぎ払い
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.Sweep] run function mhdp_items:weapons/lance/type_normal/6_sweep/main

# ガード
    # 開始：スニーク
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_normal/7_guard/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.Guard] run function mhdp_items:weapons/lance/type_normal/7_guard/main

# ガード溜め
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.GuardCharge] run function mhdp_items:weapons/lance/type_normal/8_guard_charge/main
    # カウンター突き
        execute if entity @s[tag=Wpn.Lc.Normal.CounterSpear] run function mhdp_items:weapons/lance/type_normal/9_auto_counter/main
    # 強突き
        execute if entity @s[tag=Wpn.Lc.Normal.HighSpear] run function mhdp_items:weapons/lance/type_normal/11_high_spear/main
    # 3連突き
        execute if entity @s[tag=Wpn.Lc.Normal.TripleSpear] run function mhdp_items:weapons/lance/type_normal/12_triple_spear/main
    # 5連突き
        execute if entity @s[tag=Wpn.Lc.Normal.QuintipleSpear] run function mhdp_items:weapons/lance/type_normal/13_quintuple_spear/main

# ステップ
    # 開始：ジャンプ
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartKeyJump,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_normal/10_step/start_noope
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.Step] run function mhdp_items:weapons/lance/type_normal/10_step/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
