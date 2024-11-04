#> mhdp_monster_tutorial_01:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# Uidスコア化
    execute store result score #mhdp_temp_monster_uid Mns.Uid run data get storage mhdp_core:temp TargetMonsterData.Uid

# データ初期化
    function mhdp_monster_tutorial_01:core/init/init_monster_data

# モデル召喚
    summon item_display ~ ~ ~30 {Tags:["Mns.Root","Mns.Root.Tutorial01"]}

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Tutorial01] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Tutorial01] at @s run function mhdp_monster_tutorial_01:core/summon/summon_init

say チュートリアル01召喚処理