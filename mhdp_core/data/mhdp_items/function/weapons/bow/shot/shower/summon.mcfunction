#> mhdp_items:weapons/bow/shot/shower/summon
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    # summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Shower","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    # tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Shower] ~ ~ ~ ~ ~-0.5

# 召喚
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Shower","Start","A"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Shower","Start","B"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Shower","Start","C"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Shower","Start","D"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    execute positioned ^ ^ ^ run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Shower,tag=Start,tag=A] ~ ~ ~ ~ ~-0.5
    execute positioned ^0.06 ^0.1 ^ run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Shower,tag=Start,tag=B] ~ ~ ~ ~-1.3 ~-0.55
    execute positioned ^-0.05 ^0.15 ^ run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Shower,tag=Start,tag=C] ~ ~ ~ ~1.2 ~-0.6
    execute positioned ^ ^0.25 ^-0.4 run tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Shower,tag=Start,tag=D] ~ ~ ~ ~0.2 ~-2.7
