#> mhdp_items:weapons/bow/type_tec/6_shot_pierce/attack
#
# 射撃 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/6_shot_pierce/main

# 矢を召喚
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Pierce","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    execute positioned ^ ^ ^ run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] ~ ~ ~ ~ ~-0.5

# データ設定
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] Ply.Uid = @s Ply.Uid
    scoreboard players operation @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] Wpn.Bw.ChargeCount = #mhdp_temp_bow_charge_count MhdpCore

# 演出
    execute positioned ^ ^ ^1 run function mhdp_items:weapons/bow/type_tec/6_shot_pierce/particle

# 終了
    tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Pierce,tag=Start] remove Start
    scoreboard players reset #mhdp_temp_bow_charge_count MhdpCore
