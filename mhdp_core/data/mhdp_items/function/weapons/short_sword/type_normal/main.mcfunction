#> mhdp_items:weapons/short_sword/type_normal/main
#
# 片手剣のメイン処理 地の型
#
# @within function mhdp_items:weapons/short_sword/main

# 無操作確認
    function mhdp_items:weapons/short_sword/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/short_sword/type_normal/0_drawattack/start
    execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/short_sword/type_normal/0_drawattack/start_guard

# ガード
    # 開始：スニーク
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsSneaking,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/short_sword/type_normal/24_guard/start
    # 処理
        execute if entity @s[tag=Wpn.Ss.Normal.Guard] run function mhdp_items:weapons/short_sword/type_normal/24_guard/main

# 剣攻撃コンボ
    # 1段目
        # 開始：右クリック短押し
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Sword.1] run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Sword.2] run function mhdp_items:weapons/short_sword/type_normal/2_sword_2/main
    # 3段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Sword.3] run function mhdp_items:weapons/short_sword/type_normal/3_sword_3/main
    # 4段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Sword.4] run function mhdp_items:weapons/short_sword/type_normal/4_sword_4/main
    # 5段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Sword.5] run function mhdp_items:weapons/short_sword/type_normal/5_sword_5/main

# 溜め
    # 処理
        execute if entity @s[tag=Wpn.Ss.Normal.Charge] run function mhdp_items:weapons/short_sword/type_normal/10_charge/main
    
# 回転斬り
    # 処理
        execute if entity @s[tag=Wpn.Ss.Normal.Spin] run function mhdp_items:weapons/short_sword/type_normal/11_spin/main

# 盾攻撃コンボ
    # 盾攻撃
       # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Bash.1] run function mhdp_items:weapons/short_sword/type_normal/7_bash_1/main
    # バックナックル
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Bash.2] run function mhdp_items:weapons/short_sword/type_normal/8_bash_2/main
    # ハードバッシュ
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Bash.3] run function mhdp_items:weapons/short_sword/type_normal/9_bash_3/main

# 剣盾ラッシュ
    # 処理
        execute if entity @s[tag=Wpn.Ss.Normal.Rush] run function mhdp_items:weapons/short_sword/type_normal/12_rush/main

# 剣の舞
    # 処理
        execute if entity @s[tag=Wpn.Ss.Normal.DanceRush] run function mhdp_items:weapons/short_sword/type_normal/13_dance_rush/main

# 鉄蟲糸技：飛影
    # 飛影
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Tobikage] run function mhdp_items:weapons/short_sword/type_normal/23_tobikage/main
    # 駆け上がり斬り
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.JumpSlash.High] run function mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/main
    # フォールバッシュ
        # 処理
            execute if entity @s[tag=Wpn.Ss.Normal.Fall.High] run function mhdp_items:weapons/short_sword/type_normal/18_fall_high/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
