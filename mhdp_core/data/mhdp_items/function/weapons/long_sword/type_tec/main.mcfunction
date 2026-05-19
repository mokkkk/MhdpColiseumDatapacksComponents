#> mhdp_items:weapons/long_sword/type_tec/main
#
# 太刀のメイン処理 天の型
#
# @within function mhdp_items:weapons/long_sword/main

# 無操作確認
    function mhdp_items:weapons/long_sword/util/get_no_ope

# 抜刀攻撃
    # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/long_sword/type_tec/0_drawattack/start
    # execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/long_sword/type_tec/0_drawattack/start_guard

# 特殊空中攻撃：流転突き
    # 開始
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingWeapon,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/21_spiral_thrust/start
    # 処理
        # execute if entity @s[tag=Wpn.Lc.Tec.Spiral] run function mhdp_items:weapons/long_sword/type_tec/21_spiral_thrust/main

# 空中攻撃：強突き
    # 開始
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/long_sword/type_tec/20_low_spear/start
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/long_sword/type_tec/20_low_spear/start
    # 処理
        # execute if entity @s[tag=Wpn.Lc.Tec.LowSpear] run function mhdp_items:weapons/long_sword/type_tec/20_low_spear/main

# 狩技：
    # 開始
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/long_sword/type_tec/22_guard_rage/start
    # ガード
        # execute if entity @s[tag=Wpn.Lc.Tec.GuardRage] run function mhdp_items:weapons/long_sword/type_tec/22_guard_rage/main
    # カウンター
        # execute if entity @s[tag=Wpn.Lc.Tec.RageCounter] run function mhdp_items:weapons/long_sword/type_tec/23_rage_counter/main

# 狩技：
    # 開始
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/long_sword/type_tec/24_screw_thrust/start
    # 溜め
        # execute if entity @s[tag=Wpn.Lc.Tec.ScrewThrust] run function mhdp_items:weapons/long_sword/type_tec/24_screw_thrust/main
    # 攻撃
        # execute if entity @s[tag=Wpn.Lc.Tec.ScrewSpear] run function mhdp_items:weapons/long_sword/type_tec/25_screw_thrust_spear/main

# 縦斬りコンボ
    # 1段目
        # 開始：左クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/1_spear_1/start
        # 処理
            execute if entity @s[tag=Wpn.Lc.Tec.Spear.1] run function mhdp_items:weapons/long_sword/type_tec/1_spear_1/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
