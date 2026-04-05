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

# 特殊空中攻撃：飛翔睨み撃ち
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Flag.SpJumpAttack,tag=!Ply.Ope.IsSneaking] run function mhdp_items:weapons/bow/type_tec/10_flying_shot/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.FlyingShot] run function mhdp_items:weapons/bow/type_tec/10_flying_shot/main

# 空中攻撃：飛燕撃ち
    # 開始
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsFlying] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/bow/type_tec/14_air_shot/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.Air] run function mhdp_items:weapons/bow/type_tec/14_air_shot/main

# 狩技：身躱し射法
    # 開始：スニーク+Ctrl+左クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint] if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max run function mhdp_items:weapons/bow/type_tec/11_moving_shot/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.MovingShot] run function mhdp_items:weapons/bow/type_tec/11_moving_shot/main

# 狩技：昇天煌弓・箭射
    # 開始：スニーク+Ctrl+右クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint] if score @s Ply.Stats.Arts.2 >= @s Ply.Stats.Arts.2.Max run function mhdp_items:weapons/bow/type_tec/12_targetting_shot/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.TargettingShot] run function mhdp_items:weapons/bow/type_tec/12_targetting_shot/main
        execute if entity @s[tag=Wpn.Bw.Tec.JumpShot] run function mhdp_items:weapons/bow/type_tec/13_jump_shot/main

# 溜め
    # 通常
        # 開始：立ち+右クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_tec/1_charge/start
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.Charge] run function mhdp_items:weapons/bow/type_tec/1_charge/main

# クイックショット
    # 通常
        # 開始：立ち+左クリック
            execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=!Ply.Ope.IsSneaking] if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_tec/15_quick_shot/start
        # 処理
            execute if entity @s[tag=Wpn.Bw.Tec.QuickShot] run function mhdp_items:weapons/bow/type_tec/15_quick_shot/main

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

# 剛連射
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.PowerVolley] run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/main

# 竜の一矢
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.Pierce] run function mhdp_items:weapons/bow/type_tec/6_shot_pierce/main

# ビン装填
    # 開始：スニーク+左クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartLeftClick,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking] if score @s Wpn.Bw.Gauge matches 13.. if score @s Wpn.Bw.Bottle.Count matches ..7 run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Equip] run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/main

# 導ノ矢
    # 開始：スニーク+右クリック
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Weapon.NoOpe,tag=Ply.Ope.IsSneaking,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.Bw.Gauge matches 100.. run function mhdp_items:weapons/bow/type_tec/7_shot_horming/start
    # 処理
        execute if entity @s[tag=Wpn.Bw.Tec.Shot.Horming] run function mhdp_items:weapons/bow/type_tec/7_shot_horming/main

# 終了
    tag @s remove Ply.Weapon.NoOpe
