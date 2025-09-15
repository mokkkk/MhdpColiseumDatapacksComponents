#> assets:object/1000.normal_wall/summon/
#
# オブジェクト召喚処理

# 召喚
    summon item_display ^ ^ ^ {interpolation_duration:3,teleport_duration:0,Tags:["Asset.Object","Asset.Object.Init","Asset.Build.Root"]}

# 建材ゲージ消費
    scoreboard players remove @s Ply.Stats.BuildGauge.Count 3
    scoreboard players remove @s Ply.Stats.BuildGauge 300
