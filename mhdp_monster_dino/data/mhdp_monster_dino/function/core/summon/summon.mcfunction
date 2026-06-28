#> mhdp_monster_dino:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# データ登録
    # function mhdp_monster_dino:core/register

# 共通処理
    function mhdp_monsters:core/super/summon/

# データ初期化
    data modify storage mhdp_core:temp TargetMonsterData set from storage mhdp_core:monster_data MonsterData[{Uid:1003}]

# モデル召喚
    function animated_java_dino:dino/summon {args: {}}

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Dino] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Dino] at @s run function mhdp_monster_dino:core/init/
