#> mhdp_items:weapons/long_sword/type_normal/main
#
# 太刀のメイン処理 地の型
#
# @within function mhdp_items:weapons/long_sword/main

# 無操作確認
    function mhdp_items:weapons/long_sword/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/long_sword/type_normal/0_drawattack/start
    # execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/long_sword/type_normal/0_drawattack/start_guard

# 特殊空中攻撃：飛翔円月斬り
    # # 開始
    #     execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingWeapon,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_normal/24_soaring_spirit_slash/start
    # # 処理
    #     execute if entity @s[tag=Wpn.Ls.Normal.SoaringSpirit] run function mhdp_items:weapons/long_sword/type_normal/24_soaring_spirit_slash/main
    # # ジャンプ処理
    #     execute if entity @s[tag=Wpn.Ls.Normal.SoaringSpirit.Jump] run function mhdp_items:weapons/long_sword/type_normal/25_soaring_spirit_jump/main

# 空中攻撃：落下突き
    # # 開始
    #     execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/start
    #     execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/start
    # # 処理
    #     execute if entity @s[tag=Wpn.Ls.Normal.FallThrust] run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/main

# 狩技：鏡花の構え
    # # 開始
    #     execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/start
    # # ガード
    #     execute if entity @s[tag=Wpn.Ls.Normal.Juncture] run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/main
    # # カウンター
    #     execute if entity @s[tag=Wpn.Ls.Normal.CriticalCounter] run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/main

# 狩技：桜花気刃斬り
    # # 開始
    #     execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/start
    # # 攻撃
    #     execute if entity @s[tag=Wpn.Ls.Normal.SakuraSlash] run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/main

# 通常攻撃
    # 1
        # 開始：左クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/long_sword/type_normal/1_normal_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ls.Normal.Normal.1] run function mhdp_items:weapons/long_sword/type_normal/1_normal_1/main
    # 2
        # 処理
            execute if entity @s[tag=Wpn.Ls.Normal.Normal.2] run function mhdp_items:weapons/long_sword/type_normal/2_normal_2/main
    # 3
        # 処理
            execute if entity @s[tag=Wpn.Ls.Normal.Normal.3] run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/main

# 気刃斬りコンボ
    # 1段目
        # 開始：右クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/long_sword/type_normal/4_spirit_slash_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ls.Normal.Spirit.Miss] run function mhdp_items:weapons/long_sword/type_normal/4_spirit_slash_1/main_miss
            execute if entity @s[tag=Wpn.Ls.Normal.Spirit.1] run function mhdp_items:weapons/long_sword/type_normal/4_spirit_slash_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Normal.Spirit.2] run function mhdp_items:weapons/long_sword/type_normal/5_spirit_slash_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ls.Normal.Spirit.3] run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/main

# # 気刃大回転斬り
#     # 処理
#         execute if entity @s[tag=Wpn.Ls.Normal.Spirit.Spin] run function mhdp_items:weapons/long_sword/type_normal/7_spirit_spin/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
