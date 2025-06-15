#> mhdp_items:weapons/bow/type_tec/7_shot_horming/attack
#
# 導ノ矢 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/7_shot_horming/main

# 矢を召喚
    function mhdp_items:weapons/bow/shot/horming/summon

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Horming,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
