#> mhdp_items:weapons/bow/shot/normal/summon_0
#
# 矢の召喚処理
#
# @within function mhdp_items:/**

# 召喚
    summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Other.Shot","Wpn.Bw.Shot.Normal","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},item:{id:"minecraft:paper",count:1,components:{custom_model_data:10000}}}
    tp @n[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal] ~ ~ ~ ~ ~-0.5
