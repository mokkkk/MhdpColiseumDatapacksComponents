#> mhdp_items:weapons/bow/type_tec/9_equip_bottle/start
#
# ビン装填 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# タグ付与
    tag @s add Wpn.Bw.Tec.Equip

# attribute設定
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value
    
# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    scoreboard players set @s Wpn.Bw.ChargeCount 0

say 弓 ビン装填