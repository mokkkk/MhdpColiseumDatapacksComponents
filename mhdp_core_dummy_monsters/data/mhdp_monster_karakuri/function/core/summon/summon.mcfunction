#> mhdp_monster_karakuri:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# Uidスコア化
    scoreboard players set #mhdp_temp_monster_uid Mns.Uid 8001

# データ初期化
    function mhdp_monster_karakuri:core/init/init_monster_data

# モデル召喚
    function animated_java:karakuri_aj/summon {args: {}}

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Karakuri] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Karakuri] at @s run function mhdp_monster_karakuri:core/summon/summon_init

# say モンスター処理：からくり飛竜召喚処理