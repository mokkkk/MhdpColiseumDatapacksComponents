#> mhdp_items:weapons/bow/type_tec/2_shot_normal/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/2_shot_normal/main

# 矢を召喚
    execute if score @s Wpn.Bw.ChargeCount matches ..0 run function mhdp_items:weapons/bow/shot/normal/summon_0
    execute if score @s Wpn.Bw.ChargeCount matches 1 run function mhdp_items:weapons/bow/shot/normal/summon_1
    execute if score @s Wpn.Bw.ChargeCount matches 2.. run function mhdp_items:weapons/bow/shot/normal/summon_2

# データ設定
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Ply.Uid = @s Ply.Uid
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] Wpn.Bw.ChargeCount = @s Wpn.Bw.ChargeCount

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] remove Start
