#> assets:object/1000.normal_wall/init/
#
# オブジェクト初期化処理

# UID付与
    execute store result score @s Build.Uid run scoreboard players add #mhdp_build_uid_grobal Build.Uid 1
    execute if score #mhdp_build_uid_grobal Build.Uid matches 2147483647.. run scoreboard players set #mhdp_build_uid_grobal Build.Uid -2147483648

# 念のため、位置を正確に移動
    execute align xyz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~ 0 0

# 見た目召喚
    execute positioned as @s run summon item_display ~ ~ ~ {interpolation_duration:3,teleport_duration:0,Tags:["Asset.Build.Display","Asset.Build.Display.Init"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"builds/wall_normal"}}}
# 紐づけ開始
    execute as @n[type=item_display,tag=Asset.Build.Display,tag=Asset.Build.Display.Init] run function assets:core/object/build/start_link

# スコア初期化
    scoreboard players set @s Build.Stats.Height 2500

# 演出
    playsound block.smithing_table.use master @a ~ ~ ~ 1 0.7
