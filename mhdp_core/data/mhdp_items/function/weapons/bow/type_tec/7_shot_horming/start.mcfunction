#> mhdp_items:weapons/bow/type_tec/7_shot_horming/start
#
# 導ノ矢 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Bw.Tec.Shot.Horming
    # tag @s remove Wpn.Bw.Tec.Shot.Pierce

# attribute設定
    attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value
    
# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    scoreboard players set @s Wpn.Bw.ChargeCount 0

# ゲージ消費
    scoreboard players remove @s Wpn.Bw.Gauge 100

# say 武器操作：弓 導ノ矢