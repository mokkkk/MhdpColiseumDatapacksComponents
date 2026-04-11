#> mhdp_items:weapons/bow/type_normal/15_quick_shot/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/15_quick_shot/main

# 矢を召喚
    execute if score @s Wpn.Bw.ChargeCount matches ..0 run function mhdp_items:weapons/bow/shot/normal_n/summon_0

# データ設定
    # scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Ply.Uid = @s Ply.Uid
    # scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Wpn.Bw.ChargeCount = @s Wpn.Bw.ChargeCount

# 終了
    # tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] remove Start
    # scoreboard players reset #mhdo_temp_charge_count MhdpCore
