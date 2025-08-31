#> assets:object/1000.normal_wall/init/
#
# オブジェクト初期化処理

# UID付与
    execute store result score @s Build.Uid run scoreboard players add #mhdp_build_uid_grobal Build.Uid 1
    execute if score #mhdp_build_uid_grobal Build.Uid matches 2147483647.. run scoreboard players set #mhdp_build_uid_grobal Build.Uid -2147483648

# 念のため、位置を正確に移動
    execute align xyz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~ 0 0

# スコア初期化
    scoreboard players set @s Build.Stats.Height 2500

# 演出
    playsound block.smithing_table.use master @a ~ ~ ~ 1 0.7
