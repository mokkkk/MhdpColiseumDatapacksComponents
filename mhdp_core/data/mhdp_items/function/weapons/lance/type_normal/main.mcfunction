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
        execute if entity @s[tag=Wpn.Lc.Tec.Spiral] run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/main

# 空中攻撃：強突き
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/lance/type_normal/20_low_spear/start
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/lance/type_normal/20_low_spear/start
    # 処理
        execute if entity @s[tag=Wpn.Lc.Tec.LowSpear] run function mhdp_items:weapons/lance/type_normal/20_low_spear/main

# 狩技：ガードレイジ
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_normal/22_guard_rage/start
    # ガード
        execute if entity @s[tag=Wpn.Lc.Tec.GuardRage] run function mhdp_items:weapons/lance/type_normal/22_guard_rage/main
    # カウンター
        execute if entity @s[tag=Wpn.Lc.Tec.RageCounter] run function mhdp_items:weapons/lance/type_normal/23_rage_counter/main

# 狩技：スクリュースラスト
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/start
    # 溜め
        execute if entity @s[tag=Wpn.Lc.Tec.ScrewThrust] run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/main
    # 攻撃
        execute if entity @s[tag=Wpn.Lc.Tec.ScrewSpear] run function mhdp_items:weapons/lance/type_normal/25_screw_thrust_spear/main

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

# # 3連突き
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.TripleSpear] run function mhdp_items:weapons/lance/type_normal/9_triple_spear/main

# # 飛び込み突き
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.DashSpear] run function mhdp_items:weapons/lance/type_normal/8_dash_spear/main

# # 溜め薙ぎ払い
#     # 開始：右クリック
#         execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_normal/4_charge/start
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.Charge] run function mhdp_items:weapons/lance/type_normal/4_charge/main
#         execute if entity @s[tag=Wpn.Lc.Tec.Sweep] run function mhdp_items:weapons/lance/type_normal/5_sweep/main
#         execute if entity @s[tag=Wpn.Lc.Tec.Sweep.Charge] run function mhdp_items:weapons/lance/type_normal/5_sweep/main_charge

# # 溜めカウンター
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.ChargeCounter] run function mhdp_items:weapons/lance/type_normal/11_charge_counter/main
#     # カウンター突き
#         execute if entity @s[tag=Wpn.Lc.Tec.CounterSpear] run function mhdp_items:weapons/lance/type_normal/12_counter_spear/main
#     # カウンター2連突き
#         execute if entity @s[tag=Wpn.Lc.Tec.CounterDoubleSpear] run function mhdp_items:weapons/lance/type_normal/14_counter_double_spear/main
#     # 自動カウンター
#         execute if entity @s[tag=Wpn.Lc.Tec.AutoCounter] run function mhdp_items:weapons/lance/type_normal/13_auto_counter/main

# # 突進
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.Dash.Start] run function mhdp_items:weapons/lance/type_normal/18_dash/main_start
#         execute if entity @s[tag=Wpn.Lc.Tec.Dash] run function mhdp_items:weapons/lance/type_normal/18_dash/main
#         execute if entity @s[tag=Wpn.Lc.Tec.Dash.Jump] run function mhdp_items:weapons/lance/type_normal/18_dash/main_jump

# # フィニッシュ突き
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.FinishSpear] run function mhdp_items:weapons/lance/type_normal/19_finish_spear/main

# # ガード
#     # 開始：スニーク
#         execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/lance/type_normal/6_guard/start
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.Guard] run function mhdp_items:weapons/lance/type_normal/6_guard/main

# # ガードダッシュ
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.GuardDash] run function mhdp_items:weapons/lance/type_normal/7_guard_dash/main

# # パワーガード
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.PowerGuard] run function mhdp_items:weapons/lance/type_normal/15_power_guard/main

# # 大返し突き
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.HighCounter] run function mhdp_items:weapons/lance/type_normal/17_high_counter/main

# # 渾身返し突き
#     # 処理
#         execute if entity @s[tag=Wpn.Lc.Tec.PowerCounter] run function mhdp_items:weapons/lance/type_normal/16_power_counter/main

# ステップ
    # 開始：ジャンプ
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartKeyJump,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/lance/type_normal/10_step/start_noope
    # 処理
        execute if entity @s[tag=Wpn.Lc.Normal.Step] run function mhdp_items:weapons/lance/type_normal/10_step/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
