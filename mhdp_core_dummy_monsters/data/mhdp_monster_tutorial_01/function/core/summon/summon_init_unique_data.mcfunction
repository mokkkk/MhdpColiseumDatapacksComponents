#> mhdp_monster_tutorial_01:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_tutorial_01:core/summon/summon_init

# Uid設定
    scoreboard players operation @s Mns.Uid = #mhdp_temp_monster_uid Mns.Uid

# ダミーは共通データの初期化の必要がないため、独自にHPを設定する
    # HP取得
        execute store result score @s Mns.Hp run data get storage mhdp_core:temp TargetMonsterData.Hp

# スコア初期化
    scoreboard players set @s Mns.General.DummyTimer 0
    scoreboard players set @s Mns.General.DummyCounter 0

# 教官召喚
    summon villager 207 66 141 {Silent:1b,Invulnerable:1b,Tags:["Mns.Shot.Tutorial01","Mns.Shot.Tutorial01.Villager"],CustomName:'"キョーカン"',attributes:[{id:"minecraft:movement_speed",base:0}],VillagerData:{profession:"minecraft:armorer",type:"minecraft:desert"}}

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # なし
