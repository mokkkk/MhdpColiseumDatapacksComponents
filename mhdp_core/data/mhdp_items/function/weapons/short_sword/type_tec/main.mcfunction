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
            execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=Ply.Weapon.NoOpe] run function mhdp_items:weapons/short_sword/type_tec/1_normal_1/start
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Normal.1,tag=!Ply.Flag.DrawAttack] run function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main
    # 2段目
        # 処理
            execute if entity @s[tag=Wpn.Ss.Tec.Normal.2,tag=!Ply.Flag.DrawAttack] run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main
        

# 終了
    tag @s remove Ply.Weapon.NoOpe
