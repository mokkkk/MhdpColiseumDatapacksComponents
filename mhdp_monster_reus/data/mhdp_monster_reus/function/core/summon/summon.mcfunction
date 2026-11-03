#> mhdp_monster_reus:core/summon/summon
#
# 召喚処理を行う
#
# @within function mhdp_monsters:core/switch/macro/m.summon

# データ登録
    function mhdp_monster_reus:core/register

# 共通処理 (TargetMonsterData.Uid を #mhdp_temp_monster_uid にする)
    function mhdp_monsters:core/super/summon/

# データ初期化 (この後 super/init が参照する)
    data modify storage mhdp_core:temp TargetMonsterData set from storage mhdp_core:monster_data MonsterData[{Uid:1002}]

# モデル召喚
    function animated_java_reus:reus/on_load
    function animated_java_reus:reus/summon {args: {}}

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Reus] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Reus] at @s run function mhdp_monster_reus:core/init/

# say モンスター処理：火竜召喚処理
