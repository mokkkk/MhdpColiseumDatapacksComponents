#> mhdp_items:weapons/bow/type_tec/9_equip_bottle/start
#
# ビン装填 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Tec.Equip
    tag @s remove Ply.Weapon.NoOpe
    
# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    scoreboard players set @s Wpn.Bw.ChargeCount 0

# ゲージ消費
    scoreboard players remove @s Wpn.Bw.Gauge 100

# say 武器操作：弓 ビン装填