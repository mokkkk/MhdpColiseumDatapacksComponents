#> mhdp_items:weapons/long_sword/type_tec/main
#
# 太刀のメイン処理 天の型
#
# @within function mhdp_items:weapons/long_sword/main

# 無操作確認
    function mhdp_items:weapons/long_sword/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/long_sword/type_tec/0_drawattack/start
    # execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/long_sword/type_tec/0_drawattack/start_guard

# 特殊空中攻撃：飛翔円月斬り
    # 開始
        # execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingWeapon,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/21_spiral_thrust/start
    # 処理
        # execute if entity @s[tag=Wpn.Lc.Tec.Spiral] run function mhdp_items:weapons/long_sword/type_tec/21_spiral_thrust/main

# 空中攻撃：
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
    # 縦斬り
        # 開始：左クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/1_normal_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Normal.1] run function mhdp_items:weapons/long_sword/type_tec/1_normal_1/main
    # 突き
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Normal.2] run function mhdp_items:weapons/long_sword/type_tec/2_normal_2/main
            execute if entity @s[tag=Wpn.Ls.Tec.Normal.2.InSpirit] run function mhdp_items:weapons/long_sword/type_tec/2_normal_2/main_in_spirit
    # 斬り上げ
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Normal.3] run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/main
            execute if entity @s[tag=Wpn.Ls.Tec.Normal.3.InSpirit] run function mhdp_items:weapons/long_sword/type_tec/3_normal_3/main_in_spirit

# 赤刃斬りコンボ
    # 1段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.RedNormal.1] run function mhdp_items:weapons/long_sword/type_tec/12_red_normal_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.RedNormal.2] run function mhdp_items:weapons/long_sword/type_tec/13_red_normal_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.RedNormal.3] run function mhdp_items:weapons/long_sword/type_tec/14_red_normal_3/main

# 踏み込み斬り
    # 開始：前移動 + 左クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsKeyForward,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/10_step_slash/start
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.StepSlash] run function mhdp_items:weapons/long_sword/type_tec/10_step_slash/main

# 気刃斬りコンボ
    # 1段目
        # 開始：右クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Spirit.Miss] run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/main_miss
            execute if entity @s[tag=Wpn.Ls.Tec.Spirit.1] run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Spirit.2] run function mhdp_items:weapons/long_sword/type_tec/5_spirit_slash_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Spirit.3] run function mhdp_items:weapons/long_sword/type_tec/6_spirit_slash_3/main
    # 踏み込み気刃斬り
        # 処理
            execute if entity @s[tag=Wpn.Ls.Tec.Spirit.Step] run function mhdp_items:weapons/long_sword/type_tec/11_step_spirit_slash/main

# 気刃大回転斬り
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.Spirit.Spin] run function mhdp_items:weapons/long_sword/type_tec/7_spirit_spin/main

# 赤刃旋転斬
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.RedSpin] run function mhdp_items:weapons/long_sword/type_tec/16_red_spin/main

# 気刃突き
    # 開始：スニーク+右クリック同時押し
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye.WithSneak,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/start
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.SpiritSpear] run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/main

# 気刃兜割
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.HelmBreaker] run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/main

# 練気解放無双斬り
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.SpiritRelease] run function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/main

# 移動斬り
    # 開始：スニーク+左クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/start
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.MoveSlash.Back] run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/main
        execute if entity @s[tag=Wpn.Ls.Tec.MoveSlash.Right] run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/main_right
        execute if entity @s[tag=Wpn.Ls.Tec.MoveSlash.Left] run function mhdp_items:weapons/long_sword/type_tec/8_move_slash/main_left

# 見切り斬り
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.Foresight] run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/main
        execute if entity @s[tag=Wpn.Ls.Tec.Foresight.Success] run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/main_success

# 見切り斬り・旋
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.RedForesight] run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/main
        execute if entity @s[tag=Wpn.Ls.Tec.RedForesight.Success] run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/main_success

# 特殊納刀
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.SpecialSheathe] run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/main
# 居合抜刀斬り
    # 処理
        execute if entity @s[tag=Wpn.Ls.Tec.IaiSlash] run function mhdp_items:weapons/long_sword/type_tec/21_iai_slash/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
