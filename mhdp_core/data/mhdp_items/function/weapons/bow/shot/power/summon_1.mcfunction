#> mhdp_items:weapons/bow/shot/normal/summon_1
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Normal","Start","A"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Normal","Start","B"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    execute positioned ^-0.1 ^ ^ run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start,tag=A] ~ ~ ~ ~-1.8 ~-0.5
    execute positioned ^0.1 ^ ^ run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start,tag=B] ~ ~ ~ ~1.8 ~-0.5
    