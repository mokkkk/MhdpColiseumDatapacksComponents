#> mhdp_items:weapons/bow/type_normal/main
#
# 弓のメイン処理 地の型
#
# @within function mhdp_items:weapons/bow/main

# 共通処理
    function mhdp_items:weapons/bow/type_normal/general

# 無操作確認
    function mhdp_items:weapons/bow/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_normal/0_drawattack/start

# 特殊空中攻撃：飛翔睨み撃ち
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/bow/type_normal/10_flying_shot/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.FlyingShot] run function mhdp_items:weapons/bow/type_normal/10_flying_shot/main

# 溜め
    # 通常
        # 開始：立ち+右クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_normal/1_charge/start
        # 処理
            execute if entity @s[tag=Wpn.Bw.Normal.Charge] run function mhdp_items:weapons/bow/type_normal/1_charge/main

# 射撃
    # 通常
        # 処理
            execute if entity @s[tag=Wpn.Bw.Normal.Shot] run function mhdp_items:weapons/bow/type_normal/2_shot/main

# 剛射
    # 処理
        # execute if entity @s[tag=Wpn.Bw.Normal.Shot.Power] run function mhdp_items:weapons/bow/type_normal/5_shot_power/main

# 竜の一矢
    # 開始：スニーク+右クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Normal.Shot.Pierce] run function mhdp_items:weapons/bow/type_normal/6_shot_pierce/main

# 竜の千々矢
    # 処理
        execute if entity @s[tag=Wpn.Bw.Normal.Shot.Shower] run function mhdp_items:weapons/bow/type_normal/7_shot_shower/main

# 飛翔睨み撃ち
    # 処理
        execute if entity @s[tag=Wpn.Bw.Normal.FlyingShot] run function mhdp_items:weapons/bow/type_normal/10_flying_shot/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
