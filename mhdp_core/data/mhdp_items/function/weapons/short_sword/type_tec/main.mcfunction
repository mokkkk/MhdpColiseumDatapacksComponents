#> mhdp_items:weapons/short_sword/type_tec/main
#
# 片手剣のメイン処理 天の型
#
# @within function mhdp_items:weapons/short_sword/main

# 無操作確認
    function mhdp_items:weapons/short_sword/util/get_no_ope

# 抜刀攻撃
    # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/short_sword/type_tec/0_drawattack/start

# 通常コンボ
    # 1段目
        # 開始：右クリック短押し
            execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/short_sword/type_tec/1_normal_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Normal.1] run function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Normal.2] run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Normal.3] run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/main

# 水平斬りコンボ
    # 1段目
        # 開始：右クリック短押し
            execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/short_sword/type_tec/4_horizon_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Horizon.1] run function mhdp_items:weapons/short_sword/type_tec/4_horizon_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Horizon.2] run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Horizon.3] run function mhdp_items:weapons/short_sword/type_tec/6_horizon_3/main

# 盾攻撃コンボ
    # 盾攻撃
        # 開始：スニーク中に右クリック
            execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Bash.1] run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/main
    # バックナックル
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Bash.2] run function mhdp_items:weapons/short_sword/type_tec/8_bash_2/main
    # ハードバッシュ
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Bash.3] run function mhdp_items:weapons/short_sword/type_tec/9_bash_3/main

# 回転斬り
    # 通常
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Spin] run function mhdp_items:weapons/short_sword/type_tec/10_spin/main
    # 旋刈り
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Tsumuji] run function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/main

# バックステップ
    # 処理
        execute if entity @s[tag=Wpn.Ss.Tec.Backstep] run function mhdp_items:weapons/short_sword/type_tec/12_backstep/main

# ジャストラッシュ
    # 1段目・飛び込み斬り
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Just.1] run function mhdp_items:weapons/short_sword/type_tec/13_just_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Just.2] run function mhdp_items:weapons/short_sword/type_tec/14_just_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Just.3] run function mhdp_items:weapons/short_sword/type_tec/15_just_3/main
    # 4段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Just.4] run function mhdp_items:weapons/short_sword/type_tec/16_just_4/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
