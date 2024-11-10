#> mhdp_monster_ranposu:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# Uidスコア化
    execute store result score #mhdp_temp_monster_uid Mns.Uid run data get storage mhdp_core:temp TargetMonsterData.Uid

# データ初期化
    function mhdp_monster_ranposu:core/init/init_monster_data

# モデル召喚
    function animated_java:ranposu_aj/summon {args: {}}

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Ranposu] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Ranposu] at @s run function mhdp_monster_ranposu:core/summon/summon_init

# say モンスター処理：ドスランポス召喚処理