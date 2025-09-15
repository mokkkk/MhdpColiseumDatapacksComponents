#> assets:object/1000.normal_wall/summon/
#
# オブジェクト召喚処理

# 召喚
    summon item_display ^ ^ ^ {interpolation_duration:3,teleport_duration:0,Tags:["Asset.Object","Asset.Object.Init","Asset.Build.Root"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},item:{id:"minecraft:dark_oak_planks",count:1,components:{"minecraft:item_model":"builds/wall_normal"}}}

# 建材ゲージ消費
    scoreboard players remove @s Ply.Stats.BuildGauge.Count 3
    scoreboard players remove @s Ply.Stats.BuildGauge 300
