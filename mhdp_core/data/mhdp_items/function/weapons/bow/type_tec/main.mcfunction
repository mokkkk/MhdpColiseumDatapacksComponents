#> mhdp_items:weapons/bow/type_tec/main
#
# 片手剣のメイン処理 天の型
#
# @within function mhdp_items:weapons/bow/main

# 無操作確認
    function mhdp_items:weapons/bow/util/get_no_ope

# 抜刀攻撃
    # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/bow/type_tec/0_drawattack/start
    # execute if entity @s[tag=Ply.Ope.StartSneak,tag=!Ply.Weapon.Drawing] run function mhdp_items:weapons/bow/type_tec/0_drawattack/start_guard

# 溜め
    # 通常
        # 開始：右クリック長押し
            execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/bow/type_tec/1_charge/start
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.Charge] run function mhdp_items:weapons/bow/type_tec/1_charge/main

# 射撃
    # 通常
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.Shot] run function mhdp_items:weapons/bow/type_tec/2_shot_normal/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
