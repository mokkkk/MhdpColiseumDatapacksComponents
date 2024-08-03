#> mhdp_monster_reus:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# Uidスコア化
    execute store result score #mhdp_temp_monster_uid Mns.Uid run data get storage mhdp_core:temp TargetMonsterData.Uid

# データ初期化
    function mhdp_monster_reus:core/init/init_monster_data

# モデル召喚
    function animated_java:reus_aj/summon/default

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Reus] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Reus] at @s run function mhdp_monster_reus:core/summon/summon_init

say 火竜召喚処理