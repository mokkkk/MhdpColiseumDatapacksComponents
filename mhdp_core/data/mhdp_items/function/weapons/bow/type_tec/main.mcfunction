#> mhdp_items:weapons/bow/type_tec/main
#
# 弓のメイン処理 天の型
#
# @within function mhdp_items:weapons/bow/main

# 共通処理
    function mhdp_items:weapons/bow/type_tec/general

# 無操作確認
    function mhdp_items:weapons/bow/util/get_no_ope

# 抜刀攻撃
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Weapon.Drawing] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_tec/0_drawattack/start

# 溜め
    # 通常
        # 開始：立ち+右クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_tec/1_charge/start
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.Charge] run function mhdp_items:weapons/bow/type_tec/1_charge/main

# 射撃
    # 通常
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.Shot] run function mhdp_items:weapons/bow/type_tec/2_shot_normal/main
    # 最大溜め
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.Shot.Max] run function mhdp_items:weapons/bow/type_tec/3_shot_max/main

# チャージステップ
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] run function mhdp_items:weapons/bow/type_tec/4_charge_step/main

# 剛射
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.Power] run function mhdp_items:weapons/bow/type_tec/5_shot_power/main

# 竜の一矢
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.Pierce] run function mhdp_items:weapons/bow/type_tec/6_shot_pierce/main

# ビン装填
    # 開始：スニーク+右クリック短押し
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.UsedEnderEye.Short,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking] if score @s Wpn.Bw.Gauge matches 100.. run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Equip] run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/main

# 導ノ矢
    # 開始：スニーク+右クリック長押し
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.UsedEnderEye.Long,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking] if score @s Wpn.Bw.Gauge matches 100.. run function mhdp_items:weapons/bow/type_tec/7_shot_horming/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.Horming] run function mhdp_items:weapons/bow/type_tec/7_shot_horming/main

# 飛翔睨み撃ち
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.FlyingShot] run function mhdp_items:weapons/bow/type_tec/10_flying_shot/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
