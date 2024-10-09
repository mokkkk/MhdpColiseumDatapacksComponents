#> mhdp_items:weapons/bow/type_normal/7_shot_shower/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_normal/7_shot_shower/main

# 矢を召喚
    function mhdp_items:weapons/bow/shot/shower/summon

# データ設定
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Shower,tag=Start] Ply.Uid = @s Ply.Uid

# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/particle

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
