#> mhdp_monster_valk:core/summon/intrusion
#
# 乱入処理を行う
# summon と同じ流れ (AJ summon → Root as core/init/)。
# 天彗龍に専用の登場アニメーションが無いため、待機アニメで初期化する。
#
# @within function mhdp_monsters:core/switch/macro/m.intrusion

# データ登録
    function mhdp_monster_valk:core/register

# 共通処理 (TargetMonsterData.Uid を #mhdp_temp_monster_uid にする)
    function mhdp_monsters:core/super/summon/

# データ初期化
    data modify storage mhdp_core:temp TargetMonsterData set from storage mhdp_core:monster_data MonsterData[{Uid:1004}]

# モデル召喚
    function animated_java_valk:valk/summon {args: {}}

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Valk] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Valk] at @s run function mhdp_monster_valk:core/init/

# say モンスター処理：天彗龍乱入処理
